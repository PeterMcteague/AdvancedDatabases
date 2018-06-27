using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EMRApplication.Data.PatientDB
{
    public partial class Patient
    {
        public Patient()
        {
            Investigations = new HashSet<Investigations>();
            Medication = new HashSet<Medications>();
            Problems = new HashSet<Problems>();
            Reactions = new HashSet<Reactions>();
            RecordAccess = new HashSet<RecordAccess>();
        }

        public int Id { get; set; }
        public string Consent { get; set; }

        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Display(Name = "Date of Birth")]
        public DateTime Dob { get; set; }

        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Display(Name = "Phone Number")]
        [DataType(DataType.PhoneNumber)]
        public string PhoneNumber { get; set; }

        public ConsentLookup ConsentNavigation { get; set; }
        public ICollection<Investigations> Investigations { get; set; }
        public ICollection<Medications> Medication { get; set; }
        public ICollection<Problems> Problems { get; set; }
        public ICollection<Reactions> Reactions { get; set; }
        public ICollection<RecordAccess> RecordAccess { get; set; }
    }
}
