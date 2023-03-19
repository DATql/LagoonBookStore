using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebLagoonBookStore.Models;

namespace WebLagoonBookStore.Controllers
{
    public class ProductsController : Controller
    {
        private BookStoreContextDataContext db = new BookStoreContextDataContext();

        public ActionResult Index()
        {
            var books = (from book in db.Books
                         select book).ToList();
           

            var categories = (from c in db.Categories
                          select c).ToList();
            
            var model = new Tuple<List<Book>, List<Category>>(books, categories);
            return View((books,categories));
        }
    }
}