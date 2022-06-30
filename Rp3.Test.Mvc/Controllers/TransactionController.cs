using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Rp3.Test.Mvc.Controllers
{
    public class TransactionController : Controller
    {
        private void SetSesion()
        {
            ViewBag.userName = Session["Name"];
            ViewBag.personId = Session["personId"];
        }
        public ActionResult Index()
        {
            Proxies.Proxy proxy = new Proxies.Proxy();

            var data = proxy.GetTransactions(Convert.ToInt32(Session["personId"]));

            List<Rp3.Test.Mvc.Models.TransactionViewModel> model = new List<Models.TransactionViewModel>();

            foreach(var item in data)
            {
                model.Add(new Models.TransactionViewModel()
                {
                    Amount = item.Amount,
                    CategoryId = item.CategoryId,
                    CategoryName = item.CategoryName,
                    Notes = item.Notes,
                    RegisterDate = item.RegisterDate,
                    ShortDescription = item.ShortDescription,
                    TransactionId = item.TransactionId,
                    TransactionType = item.TransactionType,
                    TransactionTypeId = item.TransactionTypeId                    
                });
            }
            SetSesion();
            return View(model);
        }
        public JsonResult GetTransactionId(int transactionId)
        {
            SetSesion();
            Proxies.Proxy proxy = new Proxies.Proxy();
            var data = proxy.GetTransaction(transactionId);

            List<Rp3.Test.Mvc.Models.TransactionViewModel> model = new List<Models.TransactionViewModel>();

            foreach (var item in data)
            {
                model.Add(new Models.TransactionViewModel()
                {
                    Amount = item.Amount,
                    CategoryId = item.CategoryId,
                    CategoryName = item.CategoryName,
                    Notes = item.Notes,
                    RegisterDate = item.RegisterDate,
                    ShortDescription = item.ShortDescription,
                    TransactionId = item.TransactionId,
                    TransactionType = item.TransactionType,
                    TransactionTypeId = item.TransactionTypeId
                });
            }
            return Json(model, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Transaction(Common.Models.Transaction transaction)
        {
            Proxies.Proxy proxy = new Proxies.Proxy();
            Common.Models.ResultTransaction result = new Common.Models.ResultTransaction();

            if (transaction.TransactionId > 0)
            {
                result= proxy.UpdateTransactions(transaction);
            }
            else
            {
                result= proxy.InsertTransactions(transaction);
            }
            SetSesion();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Balance()
        {
            Proxies.Proxy proxy = new Proxies.Proxy();
            Common.Models.ReportBalance reportBalance = new Common.Models.ReportBalance();
            reportBalance = proxy.GetBalance(Convert.ToInt32(Session["personId"]));
            ViewBag.report = reportBalance.Balances;
            ViewBag.totalReport = reportBalance.Total;
            SetSesion();
            return View();
        }

    }
}
