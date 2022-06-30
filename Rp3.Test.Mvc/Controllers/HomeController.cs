using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Rp3.Test.Mvc.Controllers
{
    public class HomeController : Controller
    {
        private void SetSesion()
        {
            ViewBag.userName = Session["Name"];
            ViewBag.personId = Session["personId"];
        }
        public ActionResult Index()
        {
            SetSesion();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            SetSesion();
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            SetSesion();
            return View();
        }
    }
}