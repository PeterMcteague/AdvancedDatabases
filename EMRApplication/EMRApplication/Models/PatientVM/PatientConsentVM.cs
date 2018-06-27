using EMRApplication.Data.PatientDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class PatientConsentVM
    {
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Consent { get; set; }
        public int Id { get; set; }

        public bool IsEmergency { get; set; }
        public string Message { get; set; }
    }
}
