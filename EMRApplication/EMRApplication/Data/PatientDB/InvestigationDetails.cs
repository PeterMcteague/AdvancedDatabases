using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EMRApplication.Data.PatientDB
{
    public partial class InvestigationDetails
    {
        public int Id { get; set; }
        public int InvestigationId { get; set; }
        [Display(Name = "Recorded By")]
        public string RecordedBy { get; set; }
        [Display(Name = "Recorded By Role")]
        public string RecordedByRole { get; set; }
        [Display(Name = "Recorded By Organisation")]
        public string RecordedByOrganisationName { get; set; }
        [Display(Name = "Recorded By Organisation ID")]
        public string RecordedByOrganisationId { get; set; }
        [Display(Name = "SNOMED Code")]
        public string SnomedCode { get; set; }
        [Display(Name = "Record Element Indentifier")]
        public string RecordElementIdentifier { get; set; }
        [Display(Name = "Source System ID")]
        public string SourceSystemId { get; set; }
        [Display(Name = "Source System Type")]
        public string SourceSystemType { get; set; }
        [Display(Name = "Extract Identifier")]
        public string ExtractIdentifier { get; set; }
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}")]
        public DateTime ExtractTime { get; set; }

        public Investigations Investigation { get; set; }
    }
}
