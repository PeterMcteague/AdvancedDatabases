using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EMRApplication.Data.PatientDB
{
    public partial class Investigations
    {
        public Investigations()
        {
            InvestigationDetails = new HashSet<InvestigationDetails>();
        }

        public int Id { get; set; }
        [Required(ErrorMessage = "Required")]
        public int PatientId { get; set; }

        [Required(ErrorMessage = "Required")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}")]
        [Display(Name = "Date and Time")]
        public DateTime DateTime { get; set; }

        [Required(ErrorMessage = "Required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Required")]
        public bool Flagged { get; set; }

        [Required(ErrorMessage = "Required")]
        public decimal? Result { get; set; }

        [Display(Name = "Range Minimum")]
        public decimal? RangeMin { get; set; }

        [Display(Name = "Range Maximum")]
        public decimal? RangeMax { get; set; }

        [Required(ErrorMessage = "Required")]
        public string Unit { get; set; }

        [Required(ErrorMessage = "Required")]
        [Display(Name = "Is Biochemistry?")]
        public bool IsBiochemistry { get; set; }
        public bool Active { get; set; }
        public bool Approved { get; set; }

        public Patient Patient { get; set; }
        public Events Events { get; set; }
        public ICollection<InvestigationDetails> InvestigationDetails { get; set; }
    }
}
