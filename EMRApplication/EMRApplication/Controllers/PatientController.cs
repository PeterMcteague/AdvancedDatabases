using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using EMRApplication.Data;
using Microsoft.AspNetCore.Authorization;
using EMRApplication.Data.PatientDB;
using EMRApplication.Models.PatientVM;
using EMRApplication.Models;
using Microsoft.AspNetCore.Identity;

namespace EMRApplication.Controllers
{
    [Authorize(Roles = "HCP,Patient")]
    public class PatientController : Controller
    {
        readonly Advanced_Databases_EMRContext _context;
        readonly UserManager<ApplicationUser> _userManager;

        public PatientController(Advanced_Databases_EMRContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        [HttpGet]
        public IActionResult Index(int id)
        {
            if (User.IsInRole("Patient"))
            {
                return RedirectToAction("Summary", new { PatientId = id });
            }
            else
            {
                var user = _context.Patient.FirstOrDefault(p => p.Id == id);
                var model = new PatientConsentVM { Consent = user.Consent, Email = user.Email, PhoneNumber = user.PhoneNumber, Id = user.Id };
                if (model.Consent == "red")
                {
                    model.IsEmergency = true;
                }
                return View(model);
            }
        }

        [HttpPost]
        public async Task<IActionResult> Index(PatientConsentVM model)
        {
            _context.RecordAccess.Add(new RecordAccess { AccessedBy = User.Identity.Name.ToString(), Date = DateTime.Now, IsEmergency = model.IsEmergency, Message = model.Message, PatientId = model.Id , Consent = model.Consent});
            await _context.SaveChangesAsync();
            return (RedirectToAction("Summary",new {PatientId = model.Id}));
        }

        [HttpGet]
        public IActionResult Summary(int PatientId)
        {
            var model = new SummaryVM();

            if (User.IsInRole("Patient"))
            {
                PatientId = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId.Value;
            }

            var user = _context.Patient.FirstOrDefault(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            model.Medications = _context.Medications.Where(m => m.PatientId == PatientId && m.Active && m.Approved).ToList();
            model.Problems = _context.Problems.Where(m => m.PatientId == PatientId && m.Active && m.Approved).ToList();
            model.Reactions = _context.Reactions.Where(m => m.PatientId == PatientId && m.Approved).ToList();

            return View(model);
        }

        [Authorize(Roles = "GP")]
        [HttpGet]
        public IActionResult Approvals(int PatientId)
        {
            var model = new ApprovalVM();

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;

            // Get all items to be approved
            model.Investigations = _context.Investigations.Where(m => m.PatientId == PatientId && m.Active && m.Approved == false).ToList();
            model.Referrals = _context.Referrals.Where(m => m.PatientId == PatientId && m.Approved == false).ToList();
            model.Medications = _context.Medications.Where(m => m.PatientId == PatientId && m.Active && m.Approved == false).ToList();
            model.Problems = _context.Problems.Where(m => m.PatientId == PatientId && m.Active && m.Approved == false).ToList();
            model.Reactions = _context.Reactions.Where(m => m.PatientId == PatientId && m.Active && m.Approved == false).ToList();

            return View(model);
        }

        [Authorize(Roles = "GP")]
        [HttpPost]
        public async Task<IActionResult> Approve(int id , int PatientId, string type)
        {
            if (type == "investigations")
            {
                var item = _context.Investigations.First(b => b.Id == id);
                item.Approved = true;
                _context.Investigations.Update(item);
            }
            if (type == "medication")
            {
                var item = _context.Medications.First(b => b.Id == id);
                item.Approved = true;
                _context.Medications.Update(item);
            }
            if (type == "problems")
            {
                var item = _context.Problems.First(b => b.Id == id);
                item.Approved = true;
                _context.Problems.Update(item);
            }
            if (type == "reactions")
            {
                var item = _context.Reactions.First(b => b.Id == id);
                item.Approved = true;
                _context.Reactions.Update(item);
            }
            if (type == "referrals")
            {
                var item = _context.Referrals.First(b => b.Id == id);
                item.Approved = true;
                _context.Referrals.Update(item);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction("Approvals", new { PatientId = PatientId });
        }

        [HttpGet]
        public IActionResult Problems(int PatientId)
        {
            var model = new ProblemVM();

            if (User.IsInRole("Patient"))
            {
                PatientId = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId.Value;
            }

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            if (User.IsInRole("HCP"))
            {
                model.Problems = _context.Problems.Where(m => m.PatientId == PatientId).ToList();
            }
            else
            {
                model.Problems = _context.Problems.Where(m => m.PatientId == PatientId && m.Approved).ToList();
            }

            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> Problems(int ProblemId, int PatientId)
        {
            var problem = _context.Problems.First(p => p.Id == ProblemId);
            problem.Active = false;
            _context.Problems.Update(problem);
            await _context.SaveChangesAsync();
            return RedirectToAction("Problems", new { PatientId = PatientId });
        }

        [Authorize(Roles = "HCP")]
        [HttpGet]
        public IActionResult AddProblem(int PatientId)
        {
            var model = new AddProblemVM();
            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> AddProblem(AddProblemVM model)
        {
            var problem = new Problems();
            problem.Active = true;
            problem.Date = DateTime.Now;
            problem.PatientId = model.PatientId;
            problem.ProblemName = model.ProblemName;
            problem.Approved = false;
            _context.Problems.Add(problem);
            await _context.SaveChangesAsync();
            return RedirectToAction("Problems",new {PatientId = model.PatientId });
        }

        [HttpGet]
        public IActionResult Events(int PatientId)
        {
            var model = new EventVM();

            if (User.IsInRole("Patient"))
            {
                PatientId = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId.Value;
            }

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            model.Events = _context.Events.Where(
                m => 
                (m.Investigations.PatientId == PatientId ||
                m.Medications.PatientId == PatientId ||
                m.Problems.PatientId == PatientId ||
                m.Reactions.PatientId == PatientId ||
                m.Referrals.PatientId == PatientId)

                && m.Approved == true
                ).ToList();
            model.EventNames = new List<String>();
            model.EventDates = new List<DateTime>();

            foreach (Events e in model.Events)
            {
                if (e.InvestigationsId != null)
                {
                    var itemInDB = _context.Investigations.First(i => i.Id == e.InvestigationsId);
                    model.EventNames.Add(itemInDB.Name);
                    model.EventDates.Add(itemInDB.DateTime);
                }
                if (e.MedicationsId != null)
                {
                    var itemInDB = _context.Medications.First(i => i.Id == e.MedicationsId);
                    model.EventNames.Add(itemInDB.Name);
                    model.EventDates.Add(itemInDB.DateTime);
                }
                if (e.ProblemsId != null)
                {
                    var itemInDB = _context.Problems.First(i => i.Id == e.ProblemsId);
                    model.EventNames.Add(itemInDB.ProblemName);
                    model.EventDates.Add(itemInDB.Date);
                }
                if (e.ReactionsId != null)
                {
                    var itemInDB = _context.Reactions.First(i => i.Id == e.ReactionsId);
                    model.EventNames.Add(itemInDB.Name);
                    model.EventDates.Add(itemInDB.Date);
                }
                if (e.ReferralsId != null)
                {
                    var itemInDB = _context.Referrals.First(i => i.Id == e.ReferralsId);
                    model.EventNames.Add("Referred to " + itemInDB.ReferredTo + " by " + itemInDB.ReferredBy);
                    model.EventDates.Add(itemInDB.DateTime);
                }
            }

            return View(model);
        }

        [HttpGet]
        public IActionResult Investigations(int PatientId)
        {
            var model = new InvestigationVM();

            if (User.IsInRole("Patient"))
            {
                PatientId = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId.Value;
            }

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;

            if (User.IsInRole("HCP"))
            {
                model.Investigations = _context.Investigations.Where(m => m.PatientId == PatientId).ToList();
            }
            else
            {
                model.Investigations = _context.Investigations.Where(m => m.PatientId == PatientId && m.Approved).ToList();
            }

            foreach (Investigations i in model.Investigations)
            {
                i.InvestigationDetails.Add( _context.InvestigationDetails.First(p => p.InvestigationId == i.Id));
            }

            return View(model);
        }

        [HttpGet]
        public IActionResult InvestigationDetails(int investigationId, int patientId)
        {
            if (User.IsInRole("Patient"))
            {
                patientId = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId.Value;
            }

            var model = new InvestigationDetailViewVM();
            var user = _context.Patient.First(u => u.Id == patientId);
            model.DOB = user.Dob;
            model.PatientId = patientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            model.Details = _context.InvestigationDetails.First(i => i.InvestigationId == investigationId);
            model.Investigation = _context.Investigations.First(i => i.Id == investigationId);
            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpGet]
        public IActionResult AddInvestigation(int PatientId)
        {
            var model = new AddInvestigationVM();

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            model.Investigation = new Investigations();
            model.InvestigationDetails = new InvestigationDetails();

            // Init datetimes to today for ease of use
            model.Investigation.DateTime = DateTime.Now;
            model.InvestigationDetails.ExtractTime = DateTime.Now;

            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> AddInvestigation(AddInvestigationVM model)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("AddInvestigation",new { PatientId = model.PatientId });
            }
            model.Investigation.PatientId = model.PatientId;
            model.Investigation.Active = true;
            model.Investigation.Approved = false;
            _context.Investigations.Add(model.Investigation);
            var details = model.InvestigationDetails;
            details.InvestigationId = model.Investigation.Id;
            _context.InvestigationDetails.Add(details);
            await _context.SaveChangesAsync();
            return RedirectToAction("Investigations", new { PatientId = model.PatientId });
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> InvestigationsRemove(int investigationId , int patientId)
        {
            var investigation = _context.Investigations.First(i => i.Id == investigationId);
            investigation.Active = false;
            _context.Investigations.Update(investigation);
            await _context.SaveChangesAsync();
            return RedirectToAction("Investigations", new { PatientId = patientId });
        }

        [HttpGet]
        public IActionResult Medications(int PatientId)
        {
            var model = new MedicationVM();

            if (User.IsInRole("Patient"))
            {
                PatientId = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId.Value;
            }

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;

            if (User.IsInRole("HCP"))
            {
                model.Medications = _context.Medications.Where(m => m.PatientId == PatientId).ToList();
            }
            else
            {
                model.Medications = _context.Medications.Where(m => m.PatientId == PatientId && m.Approved).ToList();
            }
            
            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpGet]
        public IActionResult AddMedication(int PatientId)
        {
            var model = new AddMedicationVM();

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            model.Medication = new Medications();

            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> AddMedication(AddMedicationVM model)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("AddMedication", new { PatientId = model.PatientId });
            }
            model.Medication.PatientId = model.PatientId;
            model.Medication.Active = true;
            model.Medication.Approved = false;
            model.Medication.DateTime = DateTime.Now;
            _context.Medications.Add(model.Medication);
            await _context.SaveChangesAsync();
            return RedirectToAction("Medications", new { PatientId = model.PatientId });
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> MedicationsRemove(int medicationId, int patientId)
        {
            var medication = _context.Medications.First(i => i.Id == medicationId);
            medication.Active = false;
            _context.Medications.Update(medication);
            await _context.SaveChangesAsync();
            return RedirectToAction("Medications", new { PatientId = patientId });
        }

        [HttpGet]
        public IActionResult Reactions(int PatientId)
        {
            var model = new ReactionsVM();

            if (User.IsInRole("Patient"))
            {
                PatientId = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId.Value;
            }

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;

            if (User.IsInRole("HCP"))
            {
                model.Reactions = _context.Reactions.Where(m => m.PatientId == PatientId).ToList();
            }
            else
            {
                model.Reactions = _context.Reactions.Where(m => m.PatientId == PatientId && m.Approved).ToList();
            }

            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpGet]
        public IActionResult AddReaction(int PatientId)
        {
            var model = new AddReactionVM();

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            model.Reaction = new Reactions();

            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> AddReaction(AddReactionVM model)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("AddReaction", new { PatientId = model.PatientId });
            }
            model.Reaction.PatientId = model.PatientId;
            model.Reaction.Active = true;
            model.Reaction.Date = DateTime.Now;
            model.Reaction.Approved = false;
            _context.Reactions.Add(model.Reaction);
            await _context.SaveChangesAsync();
            return RedirectToAction("Reactions", new { PatientId = model.PatientId });
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> ReactionsRemove(int reactionId, int patientId)
        {
            var reaction = _context.Reactions.First(i => i.Id == reactionId);
            reaction.Active = false;
            _context.Reactions.Update(reaction);
            await _context.SaveChangesAsync();
            return RedirectToAction("Reactions", new { PatientId = patientId });
        }

        [HttpGet]
        public IActionResult Referrals(int PatientId)
        {
            var model = new ReferralsVM();

            if (User.IsInRole("Patient"))
            {
                PatientId = _userManager.Users.First(b => b.UserName == User.Identity.Name).PatientId.Value;
            }

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;

            if (User.IsInRole("HCP"))
            {
                model.Referrals = _context.Referrals.Where(m => m.PatientId == PatientId).ToList();
            }
            else
            {
                model.Referrals = _context.Referrals.Where(m => m.PatientId == PatientId && m.Approved).ToList();
            }

            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpGet]
        public IActionResult AddReferral(int PatientId)
        {
            var model = new AddReferralVM();

            var user = _context.Patient.First(u => u.Id == PatientId);
            model.DOB = user.Dob;
            model.PatientId = PatientId;
            model.PatientName = user.FirstName + " " + user.LastName;
            model.Referral = new Referrals();

            return View(model);
        }

        [Authorize(Roles = "HCP")]
        [HttpPost]
        public async Task<IActionResult> AddReferral(AddReferralVM model)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("AddReferral", new { PatientId = model.PatientId });
            }
            model.Referral.PatientId = model.PatientId;
            model.Referral.DateTime = DateTime.Now;
            model.Referral.Approved = false;
            _context.Referrals.Add(model.Referral);
            await _context.SaveChangesAsync();
            return RedirectToAction("Referrals", new { PatientId = model.PatientId });
        }
    }
}