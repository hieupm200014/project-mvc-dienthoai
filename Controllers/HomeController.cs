using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using PagedList;
using Proj_day11_test.Models;

namespace Proj_day11_test.Controllers
{
    public class HomeController : Controller
    {
        private ECartDB db = new ECartDB();
        
        /*
        public ActionResult DisplaySuplier(int? page)
        {
            var supplies = db.tblCategories.Select(s => s);
            //Sap xep truoc khi phan trang
            supplies = supplies.OrderBy(s => s.Categoryid);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            return View(supplies.ToPagedList(pageNumber, pageSize));
        }*/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LoginForm()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            string email = f["email"], pass = f["password"];
            var user = db.tblUsers.Where(u => u.Email == email && u.Password == pass).FirstOrDefault();
            if (user == null)
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
            Session["userId"] = user.Userid;
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session["userId"] = null;
            return RedirectToAction("LoginForm");
        }
    }
}