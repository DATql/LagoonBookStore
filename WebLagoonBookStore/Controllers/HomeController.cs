using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebLagoonBookStore.Models;
using System.Security.Cryptography;
using System.Text;
namespace WebLagoonBookStore
{
    public class HomeController : Controller
    {   
        private readonly BookStoreContextDataContext db = new BookStoreContextDataContext();
        public static string GetHashedPassword(string password)
        {
            using (var sha256 = new SHA256Managed())
            {
                var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                var hash = BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
                return hash;
            }
        }
        public ActionResult Index()
        {
            var result = from b in db.Books
                         join bt in db.Book_Tags on b.id equals bt.bookID
                         join t in db.Tags on bt.tagID equals t.id
                         where t.tag1 =="best seller"
                         orderby t.tag1
                         select b
                        ;
            return View(result);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ActionName("Register")]
        public ActionResult RegisterPost(FormCollection form)
        {
            if (ModelState.IsValid)
            {   
                Customer cs = new Customer
                {
                    username = form["username"],
                    password = GetHashedPassword(form["password"]),
                    name = form["fullname"],
                    avatar = form["avatar"],
                    email = form["email"],
                    phone_number = form["phone"],
                    created_date = DateTime.Now,
                    is_active = true
                };
                db.Customers.InsertOnSubmit(cs);
                db.SubmitChanges();

            }
            return View();
            
        }


        //[HttpPost]
        //public ActionResult AddToCart(int productId, int quantity)
        //{
        //    // Lưu thông tin sản phẩm vào biến tạm
        //    var cart = Session["Cart"] as List<ReceiptDetail> ?? new List<ReceiptDetail>();
        //    var book = db.Books.Where(p=>p.id ==productId);
        //    cart.Add(new ReceiptDetail {bookid = book, Quantity = quantity });
        //    Session["Cart"] = cart;

        //    // Chuyển hướng đến trang Order
        //    return RedirectToAction("Index", "Order");
        //}
    }
}