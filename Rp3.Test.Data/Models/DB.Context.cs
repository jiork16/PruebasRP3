﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Rp3TestEntities : DbContext
    {
        public Rp3TestEntities()
            : base("name=Rp3TestEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tbCategory> tbCategory { get; set; }
        public virtual DbSet<tbTransaction> tbTransaction { get; set; }
        public virtual DbSet<tbTransactionType> tbTransactionType { get; set; }
        public virtual DbSet<tbPerson> tbPerson { get; set; }
    
        public virtual int FillRandomData()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("FillRandomData");
        }
    
        public virtual int spTransactionInsert(string infoXml)
        {
            var infoXmlParameter = infoXml != null ?
                new ObjectParameter("infoXml", infoXml) :
                new ObjectParameter("infoXml", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spTransactionInsert", infoXmlParameter);
        }
    
        public virtual int spTransactionUpdate(string infoXml)
        {
            var infoXmlParameter = infoXml != null ?
                new ObjectParameter("infoXml", infoXml) :
                new ObjectParameter("infoXml", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spTransactionUpdate", infoXmlParameter);
        }
    }
}
