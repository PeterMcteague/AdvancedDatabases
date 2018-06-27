using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EMRApplication.Data.PatientDB
{
    public partial class RecordAccess
    {
        public int Id { get; set; }
        public int PatientId { get; set; }
        public string Consent { get; set; }
        [Display(Name = "Emergency?")]
        public bool IsEmergency { get; set; }
        public string Message { get; set; }
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime Date { get; set; }
        [Display(Name = "Accessed by")]
        public string AccessedBy { get; set; }

        public ConsentLookup ConsentNavigation { get; set; }
        public Patient Patient { get; set; }
    }
}
