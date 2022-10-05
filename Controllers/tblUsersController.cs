using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Proj_day11_test.Models;

namespace Proj_day11_test.Controllers
{
    public class tblUsersController : Controller
    {
        private ECartDB db = new ECartDB();

        // GET: tblUsers
        public ActionResult Index()
        {
            if (Session["Userid"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }

        }

        
        
        

    }
}
