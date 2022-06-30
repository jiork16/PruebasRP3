﻿using Rp3.Test.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rp3.Test.Data.Repositories
{
    public class PersonRepository : Repository<Person>
    {
        public PersonRepository(DbContext context) : base(context)
        {
        }

    }
}
