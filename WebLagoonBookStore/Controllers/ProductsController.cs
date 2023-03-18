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
            var result = from b in db.Books
                         select b;
             
            return View(result);
        }
    }
}