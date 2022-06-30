using Rp3.Test.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Rp3.Test.WebApi.Data.Controllers
{
    public class AuthenticationDataController : ApiController
    {
   
        [HttpPost]
        public IHttpActionResult Login(Rp3.Test.Common.Models.PersonLogin login)
        {
            Rp3.Test.Common.Models.PersonLogin personLogin = new Rp3.Test.Common.Models.PersonLogin();
            using (DataService service = new DataService())
            {
                var persons = service.Persons.GetQueryable();
                var person = persons.FirstOrDefault(x => x.UserName == login.Username
                             && x.Password == login.Password);
                if (person == null)
                {
                    personLogin.Id = 0;
                }
                else
                {
                    personLogin.Name = person.Name;
                    personLogin.Id = person.PersonId;
                    personLogin.Username = person.UserName;
                    personLogin.Password = null;
                }
            }
            return Ok(personLogin);

        }
    }
}