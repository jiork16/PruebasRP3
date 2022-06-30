using Rp3.Test.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rp3.Test.Data.Repositories
{
    public class TransactionRepository : Repository<Transaction>
    {
        public TransactionRepository(DbContext context) : base(context)
        {
        }

        /*
        Ejemplo consultar datos a partir de un procedimiento almacenado */

        public ReportBalance GetBalance(int? personId=null)
        {
            ReportBalance report = new ReportBalance();
            report.Balances= this.DataBase.SqlQuery<Balance>
                ("EXEC dbo.spGetBalance @personId = {0}", personId).ToList();
            foreach (Balance item in report.Balances)
            {
                report.Total += item.Amount;

            }
            return report;
            //return this.DataBase.SqlQuery<Balance>
            //    ("EXEC dbo.spGetBalance @AccountId = {0}, @DateStart = {1}, @DateEnd = {2}", accountId, dateStart, dateEnd).ToList();
        }

        
    }
   
}
