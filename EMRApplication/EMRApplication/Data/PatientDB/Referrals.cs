using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EMRApplication.Data.PatientDB
{
    public partial class Referrals
    {
        public int Id { get; set; }
        public int PatientId { get; set; }

        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}")]
        [Display(Name = "Date and time")]
        public DateTime DateTime { get; set; }

        public string Encounter { get; set; }

        [Display(Name = "Referred by")]
        public string ReferredBy { get; set; }

        [Display(Name = "Referred to")]
        public string ReferredTo { get; set; }

        [Display(Name = "Referred to role")]
        public string RefferedToRole { get; set; }

        [Display(Name = "Referred to location")]
        public string RefferedToLocation { get; set; }

        public string Reason { get; set; }

        public bool Approved { get; set; }

        public Events Events { get; set; }
    }
}
