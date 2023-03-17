using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebLagoonBookStore.Models;
namespace WebLagoonBookStore
{
    public class HomeController : Controller
    {   
        private  BookStoreContextDataContext db = new BookStoreContextDataContext();

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

        [HttpPost]
        public ActionResult AddToCart(int productId, int quantity)
        {
            // Lưu thông tin sản phẩm vào biến tạm
            var cart = Session["Cart"] as List<ReceiptDetail> ?? new List<ReceiptDetail>();
            var book = db.Books.Where(p=>p.id ==productId);
            cart.Add(new ReceiptDetail {bookid = book, Quantity = quantity });
            Session["Cart"] = cart;

            // Chuyển hướng đến trang Order
            return RedirectToAction("Index", "Order");
        }
    }
}