using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using EMRApplication.Data;
using EMRApplication.Models;
using EMRApplication.Data.PatientDB;
using Microsoft.AspNetCore.Identity;

namespace EMRApplication.Controllers
{
    public class HomeController : Controller
    {
        readonly Advanced_Databases_EMRContext _context;
        readonly UserManager<ApplicationUser> _userManager;

        public HomeController(Advanced_Databases_EMRContext context , UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public IActionResult Index(string searchString)
        {
            var model = new IndexVM();

            if (User.IsInRole("HCP"))
            {
                if (searchString != null)
                {
                    model.Patients = _context.Patient.Where(b => (b.FirstName + " " + b.LastName).Contains(searchString));
                }
                else
                {
                    model.Patients = _context.Patient;
                }

                return View(model);
            }
            if (User.IsInRole("Patient"))
            {
                var patientIdForUser = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId;
                if (patientIdForUser != null)
                {
                    model.Patients = _context.Patient.Where(b => b.Id == patientIdForUser);
                }
                return View(model);
            }
            else
            {
                return View(model);
            }
            
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
