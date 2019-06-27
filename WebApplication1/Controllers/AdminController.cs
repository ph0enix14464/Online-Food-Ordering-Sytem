using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        // GET: Admin
        OnlineFoodDBEntities _db = new OnlineFoodDBEntities();
        [Authorize(Roles = "Admin")]
        public ActionResult DashBoard()
        {
            return View();
        }
    }
}