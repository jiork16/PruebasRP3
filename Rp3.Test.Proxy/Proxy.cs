using Newtonsoft.Json;
using Rp3.Test.Common.Models;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;


namespace Rp3.Test.Proxies
{
    public class Proxy : BaseProxy
    {
        private const string UriGetCategory = "api/categoryData/get?active={0}";
        private const string UriGetCategoryById = "api/categoryData/getById?categoryId={0}";
        private const string UriInsertCategory = "api/categoryData/insert";
        private const string UriUpdateCategory = "api/categoryData/update";

        private const string UriGetTransactionType = "api/transactionTypeData/get";

        private const string UriGetTransactions = "api/transactionData/get?personId={0}";
        private const string UriGetTransactionsById = "api/transactionData/getById?transactionId={0}";
        private const string UriGetTransactionsByPersonId = "api/categoryData/getByPersonId?personId={0}";
        private const string UriIsertTransactions = "api/transactionData/insert";
        private const string UriUpdateTransactions = "api/transactionData/update";

        private const string UriGetBalance = "api/transactionData/getBalance?personId={0}";
        
        private const string UriLogin = "api/AuthenticationData/login";

        /// <summary>
        /// Obtiene el Listado de Tipos de Transacción
        /// </summary>
        /// <returns></returns>
        public List<TransactionType> GetTransactionTypes()
        {
            return HttpGet<List<TransactionType>>(UriGetTransactionType);
        }

        #region Category Services

        /// <summary>
        /// Obtiene el Listado de Categorías
        /// </summary>
        /// <param name="active">especifica si la consulta es sobre categorías activas o Inactivas</param>
        /// <returns></returns>
        public List<Category> GetCategories(bool? active = null)
        {
            return HttpGet<List<Category>>(UriGetCategory, active);
        }

        /// <summary>
        /// Obtiene una Categoría por Id
        /// </summary>
        /// <param name="categoryId">Id de la Categoría</param>
        /// <returns></returns>
        public Category GetCategory(int categoryId)
        {
            return HttpGet<Category>(UriGetCategoryById, categoryId);
        }

        /// <summary>
        /// Método para Insertar Categorías
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public bool InsertCategory(Rp3.Test.Common.Models.Category category)
        {
            return HttpPostAsJson<bool>(UriInsertCategory, category);
        }

        public bool UpdateCategory(Rp3.Test.Common.Models.Category category)
        {
            return HttpPostAsJson<bool>(UriUpdateCategory, category);
        }

        #endregion

        #region Login Services
        /// <summary>
        /// Método para Determinar usuario
        /// </summary>
        /// <param name="personLogin"></param>
        /// <returns></returns>
        /// 
        public Rp3.Test.Common.Models.PersonLogin Login(Rp3.Test.Common.Models.PersonLogin personLogin)
        {
            return HttpPostAsJson<Rp3.Test.Common.Models.PersonLogin>(UriLogin, personLogin);
        }
        #endregion
        /// <summary>
        /// Obtiene el Listado de Transacciones
        /// </summary>
        /// <returns></returns>
        public List<TransactionView> GetTransactions(int? personId = null)
        {
            return HttpGet<List<TransactionView>>(UriGetTransactions, personId);
        }
        public List<TransactionView> GetTransaction(int transactionId)
        {
            return HttpGet<List<TransactionView>>(UriGetTransactionsById, transactionId);
        }
        public List<TransactionView> GetTransactionsPerson(int personId)
        {
            return HttpGet<List<TransactionView>>(UriGetTransactionsByPersonId, personId);
        }
        /// <summary>
        /// Obtiene el Listado de Transacciones
        /// </summary>
        /// <returns></returns>
        public ReportBalance GetBalance(int? personId = null)
        {
            return HttpGet<ReportBalance>(UriGetBalance, personId);
        }
        /// <summary>
        /// Obtiene el Listado de Transacciones
        /// </summary>
        /// <returns></returns>
        public ResultTransaction InsertTransactions(Rp3.Test.Common.Models.Transaction transaction)
        {
            return HttpPostAsJson<ResultTransaction>(UriIsertTransactions, transaction);
        }
        /// <summary>
        /// Obtiene el Listado de Transacciones
        /// </summary>
        /// <returns></returns>
        public ResultTransaction UpdateTransactions(Rp3.Test.Common.Models.Transaction transaction)
        {
            return HttpPostAsJson<ResultTransaction>(UriUpdateTransactions, transaction);
        }


    }
}