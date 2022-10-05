using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proj_day11_test.Models
{
    public class ProductDAO
    {
        ECartDB db = null;
        public ProductDAO()
        {
            db = new ECartDB();
        }
        public List<tblProduct> ListProductsByCate(int cat)
        {
            var list = db.tblProducts.Where(p => p.Categoryid == cat);
            return list.ToList();
        }
    }
}