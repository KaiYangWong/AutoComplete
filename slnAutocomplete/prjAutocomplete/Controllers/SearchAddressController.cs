using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using prjAutocomplete.Models;

namespace prjAutocomplete.Controllers
{
    public class SearchAddressController : ApiController
    {
        // GET: api/SearchAddress
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/SearchAddress/5
        public List<string> Get(string keyword)
        {
            NorthwindEntities db = new NorthwindEntities();
            var custs = db.客戶.Where(m => m.地址.Contains(keyword)).ToList();
            List<string> address = new List<string>();
            foreach (var c in custs)
            {
                address.Add(c.地址);
            }
            return address.Distinct().ToList();
        }

        // POST: api/SearchAddress
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/SearchAddress/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/SearchAddress/5
        public void Delete(int id)
        {
        }
    }
}
