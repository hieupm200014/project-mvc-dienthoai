using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proj_day11_test.Models
{
    public class CategoryDAO
    {
        ECartDB db = null;
        public CategoryDAO()
        {
            db = new ECartDB();
        }
        public List<tblCategory> ListCategory()
        {
            return db.tblCategories.ToList();
        }
        public tblCategory ListCategoryByCatId(int Categoryid)
        {
            return db.tblCategories.Find(Categoryid);
        }
    }
}