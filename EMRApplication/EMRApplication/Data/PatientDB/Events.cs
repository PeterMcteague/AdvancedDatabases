using System;
using System.Collections.Generic;

namespace EMRApplication.Data.PatientDB
{
    public partial class Events
    {
        public int Id { get; set; }
        public int? InvestigationsId { get; set; }
        public int? ProblemsId { get; set; }
        public int? MedicationsId { get; set; }
        public int? ReactionsId { get; set; }
        public int? ReferralsId { get; set; }
        public bool Approved { get; set; }
        public string EventType { get; set; }

        public Investigations Investigations { get; set; }
        public Medications Medications { get; set; }
        public Problems Problems { get; set; }
        public Reactions Reactions { get; set; }
        public Referrals Referrals { get; set; }
    }
}
