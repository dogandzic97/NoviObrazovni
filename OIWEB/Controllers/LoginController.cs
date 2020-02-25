using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OIWEB.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        ObrazovniInformatorDataContext oi = new ObrazovniInformatorDataContext();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection fc)
        {
            string username = "";
            string lozinka = "";

            if (fc["KorisnickoIme"] != null && fc["KorisnickoIme"] != "")
            {
                 username = fc["KorisnickoIme"];
            }
            else
            {
                ViewBag.Message = "Молим вас да унесете своје корисничко име";
                return View();
            }


            if (fc["Lozinka"] != null && fc["Lozinka"] != "")
            {
                 lozinka = fc["Lozinka"];
            }
            else
            {
                ViewBag.Message = "Молим вас да унесете своју лозинку";
                return View();
            }


            Korisnik korisnik;
            try
            {
                 korisnik = (from k in oi.Korisniks
                                     where k.KorisnickoIme.Equals(username) & k.Lozinka.Equals(lozinka)
                                     select k).Single();
            }
            catch
            {
                ViewBag.Message = "Особа са датим корисничким именом не постоји, покушајте поново";
                return View();

            }

            if (korisnik != null)
            {

                Session["Korisnik"] = korisnik;
                return RedirectToAction("../Home/Index");

            }
            else
            {
                ViewBag.Message = "Покушајте поново";
                return View();

            }
        }
    }
}