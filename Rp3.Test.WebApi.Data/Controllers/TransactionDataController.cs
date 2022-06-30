using Rp3.Test.Common.Models;
using Rp3.Test.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Rp3.Test.WebApi.Data.Controllers
{
    public class TransactionDataController : ApiController
    {
        private string mmsg = "Revisar Fecha de Registro o Monto Icorrecto";
        private ResultTransaction result = new ResultTransaction();
        [HttpGet]
        public IHttpActionResult Get(int? personId = null)
        {
            List<Rp3.Test.Common.Models.TransactionView> commonModel = new List<Common.Models.TransactionView>();

            using (DataService service = new DataService())
            {
                IEnumerable<Rp3.Test.Data.Models.Transaction> 
                    dataModel = service.Transactions.Get(                   
                    includeProperties: "Category,TransactionType, Person",
                    filter: p => p.PersonId == (personId == null ? p.PersonId : personId),
                    orderBy: p=> p.OrderByDescending(o=>o.RegisterDate) );

                //Para incluir una condición, puede usar el primer parametro de Get
                /*
                 * Ejemplo
                 IEnumerable<Rp3.Test.Data.Models.Transaction>
                    dataModel = service.Transactions.Get(p=> p.TransactionId > 0
                    includeProperties: "Category,TransactionType",
                    orderBy: p => p.OrderByDescending(o => o.RegisterDate));

                 */

                commonModel = dataModel.Select(p => new Common.Models.TransactionView()
                {
                    CategoryId = p.CategoryId,
                    CategoryName = p.Category.Name,
                    Notes = p.Notes,
                    Amount = p.Amount,
                    RegisterDate = p.RegisterDate,
                    ShortDescription = p.ShortDescription,
                    TransactionId = p.TransactionId,
                    TransactionType = p.TransactionType.Name,
                    TransactionTypeId = p.TransactionTypeId
                }).ToList();
            }

            return Ok(commonModel);
        }
        [HttpGet]
        public IHttpActionResult GetById(int transactionId)
        {
            List<Rp3.Test.Common.Models.TransactionView> commonModel = new List<Common.Models.TransactionView>();

            using (DataService service = new DataService())
            {
                IEnumerable<Rp3.Test.Data.Models.Transaction>
                    dataModel = service.Transactions.Get(
                    includeProperties: "Category,TransactionType",
                    filter: p=> p.TransactionId== transactionId,
                    orderBy: p => p.OrderByDescending(o => o.RegisterDate));
                commonModel = dataModel.Select(p => new Common.Models.TransactionView()
                {
                    CategoryId = p.CategoryId,
                    CategoryName = p.Category.Name,
                    Notes = p.Notes,
                    Amount = p.Amount,
                    RegisterDate = p.RegisterDate,
                    ShortDescription = p.ShortDescription,
                    TransactionId = p.TransactionId,
                    TransactionType = p.TransactionType.Name,
                    TransactionTypeId = p.TransactionTypeId
                }).ToList();
            }

            return Ok(commonModel);
        }
        [HttpPost]
        public IHttpActionResult Insert(Rp3.Test.Common.Models.Transaction transaction)
        {
            //Complete the code
            if (ValTransaction(transaction.RegisterDate , transaction.Amount))
            {
                result.Result = false;
                result.Message = mmsg;
            }
            else
            {
                using (DataService service = new DataService())
                {
                    Rp3.Test.Data.Models.Transaction model = new Test.Data.Models.Transaction();
                    model.TransactionId = service.Transactions.GetMaxValue<int>(p => p.TransactionId, 0) + 1;
                    model.TransactionTypeId = transaction.TransactionTypeId;
                    model.CategoryId = transaction.CategoryId;
                    model.PersonId = transaction.PersonId;
                    model.RegisterDate = transaction.RegisterDate;
                    model.ShortDescription = transaction.ShortDescription;
                    model.Amount = transaction.Amount;
                    model.Notes = transaction.Notes;
                    service.Transactions.Insert(model);
                    service.SaveChanges();
                    result.Result = true;
                    result.Message = "Ok";
                }
            }          

            return Ok(result);
        }
        [HttpPost]
        public IHttpActionResult Update(Rp3.Test.Common.Models.Transaction transaction)
        {
            //Complete the code
            if (ValTransaction(transaction.RegisterDate, transaction.Amount))
            {
                result.Result = false;
                result.Message = mmsg;
            }
            else
            {
                using (DataService service = new DataService())
                {
                    Rp3.Test.Data.Models.Transaction model = service.Transactions.GetByID(transaction.TransactionId);
                    if (model != null)
                    {
                        model.TransactionTypeId = transaction.TransactionTypeId;
                        model.CategoryId = transaction.CategoryId;
                        model.PersonId = transaction.PersonId;
                        model.RegisterDate = transaction.RegisterDate;
                        model.ShortDescription = transaction.ShortDescription;
                        model.Amount = transaction.Amount;
                        model.Notes = transaction.Notes;
                        service.Transactions.Update(model);
                        service.SaveChanges();
                        result.Result = true;
                        result.Message = "Ok";
                    }
                    else
                    {
                        result.Result = false;
                        result.Message = "No existe Transaccion";
                    }
                }
            }
            return Ok(result);
        }
        
        [HttpGet]
        public IHttpActionResult GetBalance(int? personId= null)
        {
            using (DataService service = new DataService())
            {
                Rp3.Test.Data.Models.ReportBalance model = service.Transactions.GetBalance(personId);
                return Ok(model);
            }
        }
        private bool ValTransaction(DateTime registerDate, decimal amount)
        {
            if (registerDate < DateTime.UtcNow.Date.AddDays(-30) || amount <= 0)
            {
                return true;
            }
            return false;
        }
    }
}
