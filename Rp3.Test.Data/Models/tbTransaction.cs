//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Rp3.Test.Data.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbTransaction
    {
        public int TransactionId { get; set; }
        public short TransactionTypeId { get; set; }
        public int CategoryId { get; set; }
        public System.DateTime RegisterDate { get; set; }
        public string ShortDescription { get; set; }
        public decimal Amount { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> DateUpdate { get; set; }
        public int PersonId { get; set; }
    
        public virtual tbCategory tbCategory { get; set; }
        public virtual tbTransactionType tbTransactionType { get; set; }
        public virtual tbPerson tbPerson { get; set; }
    }
}
