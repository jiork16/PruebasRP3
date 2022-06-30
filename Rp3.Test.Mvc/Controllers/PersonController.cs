using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Rp3.Test.Mvc.Controllers
{
    public class PersonController : Controller
    {
        // GET: Person
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Login(Common.Models.PersonLogin personLogin)
        {
            Proxies.Proxy proxy = new Proxies.Proxy();
            Common.Models.ResultTransaction result = new Common.Models.ResultTransaction();
            Rp3.Test.Common.Models.PersonLogin user = new Rp3.Test.Common.Models.PersonLogin();
            user = proxy.Login(personLogin);
            if (user.Id == 0)
            {
                result.Result = false;
                result.Message = "Credenciales Incorrectas";
            }
            else
            {
                result.Result = true;
                result.Message = "Ok";
            }
            FormsAuthentication.SetAuthCookie(user.Name, true);
            Session["personId"] = Convert.ToString(user.Id);
            Session["Name"] = user.Name;
            ViewBag.userName = Session["Name"];
            ViewBag.personId = Session["personId"];

            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }
    }
}