using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Proj_day11_test.Models;

namespace Proj_day11_test.Controllers
{
    public class tblProductsController : Controller
    {
        private ECartDB db = new ECartDB();
        [ChildActionOnly]
        public PartialViewResult CategoryMenu()
        {
            CategoryDAO cd = new CategoryDAO();
            var li = cd.ListCategory();
            return PartialView(li);
        }
        public ActionResult ProductByCat(int cat)
        {
            ProductDAO p = new ProductDAO();
            var li = p.ListProductsByCate(cat);
            return View(li);
        }

        // GET: tblProducts
        public ActionResult Index(string sortOrder, string searchString, string currentFilter, int? page)
        {
            //Cac bien sap xep
            ViewBag.CurrentSort = sortOrder;// lay bien yeu cau sap xep hien tai

            ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.SapTheoGia = sortOrder == "Gia" ? "gia_desc" : "Gia";
            //Lay gia tri cua bo loc du lieu hien tai
            if (searchString != null)
            {
                page = 1;//Trang dau tien
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.CurrentFilter = searchString;
            //Lay danh sach hang
            var products = db.tblProducts.Select(p => p);
            //Loc theo ten san pham
            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(p => p.ProdName.Contains(searchString));
            }
            //Sap xep
            switch (sortOrder)
            {
                case "name_desc":
                    products = products.OrderByDescending(s => s.ProdName);
                    break;
                case "Gia":
                    products = products.OrderBy(s => s.Price);
                    break;
                case "gia_desc":
                    products = products.OrderByDescending(s => s.Price);
                    break;
                default:
                    products = products.OrderBy(s => s.ProdName);
                    break;
            }

            int pageSize = 5;
            int pageNumber = (page ?? 1);

            return View(products.ToPagedList(pageNumber, pageSize));
        }

        // GET: tblProducts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProduct tblProduct = db.tblProducts.Find(id);
            if (tblProduct == null)
            {
                return HttpNotFound();
            }
            return View(tblProduct);
        }

        // GET: tblProducts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tblProducts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Pid,Categoryid,ProdName,MetaTitle,Description,ImagePath,Price")] tblProduct tblProduct)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    tblProduct.ImagePath = "";
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        //Use Namespace called : System.IO
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        //lay ten file upload
                        string UploadPath = Server.MapPath("~/wwwroot/images/" + FileName);
                        //Copy va luu file vao server
                        f.SaveAs(UploadPath);
                        //Luu ten file vao truong Image
                        tblProduct.ImagePath = FileName;
                    }
                    db.tblProducts.Add(tblProduct);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu! " + ex.Message;
                ViewBag.CatalogyID = new SelectList(db.tblCategories, "Catelogyid", "CatelogyName", tblProduct.Categoryid);
                return View(tblProduct);
            }
        }

    // GET: tblProducts/Edit/5
    public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProduct tblProduct = db.tblProducts.Find(id);
            if (tblProduct == null)
            {
                return HttpNotFound();
            }
            return View(tblProduct);
        }

        // POST: tblProducts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Pid,Categoryid,ProdName,MetaTitle,Description,ImagePath,Price")] tblProduct tblProduct)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    tblProduct.ImagePath = "";
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        //Use Namespace called : System.IO
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        //lay ten file upload
                        string UploadPath = Server.MapPath("~/wwwroot/images/" + FileName);
                        //Copy va luu file vao server
                        f.SaveAs(UploadPath);
                        //Luu ten file vao truong Image
                        tblProduct.ImagePath = FileName;
                    }
                    db.Entry(tblProduct).State = EntityState.Modified;
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ViewBag.CatalogyID = new SelectList(db.tblCategories, "Catelogyid", "CatelogyName", tblProduct.Categoryid);
                return View(tblProduct);
            }
        }

        // GET: tblProducts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProduct tblProduct = db.tblProducts.Find(id);
            if (tblProduct == null)
            {
                return HttpNotFound();
            }
            return View(tblProduct);
        }

        // POST: tblProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblProduct tblProduct = db.tblProducts.Find(id);
            db.tblProducts.Remove(tblProduct);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
