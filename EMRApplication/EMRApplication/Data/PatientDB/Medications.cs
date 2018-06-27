using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EMRApplication.Data.PatientDB
{
    public partial class Medications
    {
        public int Id { get; set; }
        public int PatientId { get; set; }

        [Required(ErrorMessage = "Please enter a name for the medication")]
        public string Name { get; set; }

        [Display(Name = "Date and Time")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}")]
        public DateTime DateTime { get; set; }

        [Required]
        [Display(Name = "Repeat Prescription?")]
        public bool IsRepeat { get; set; }

        public bool Active { get; set; }

        public bool Approved { get; set; }

        public Patient Patient { get; set; }
        public Events Events { get; set; }
    }
}
