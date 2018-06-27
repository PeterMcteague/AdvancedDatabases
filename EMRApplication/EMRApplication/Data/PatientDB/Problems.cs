﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EMRApplication.Data.PatientDB
{
    public partial class Problems
    {
        public int Id { get; set; }

        public int PatientId { get; set; }

        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime Date { get; set; }

        [Required]
        [Display(Name = "Name")]
        public string ProblemName { get; set; }

        public bool Active { get; set; }

        public bool Approved { get; set; }

        public Patient Patient { get; set; }
        public Events Events { get; set; }
    }
}
