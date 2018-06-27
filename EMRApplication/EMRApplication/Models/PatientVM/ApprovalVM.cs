using EMRApplication.Data.PatientDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM 
{
    public class ApprovalVM : BaseVM
    {
        public List<Investigations> Investigations { get; set; }
        public List<Referrals> Referrals { get; set; }
        public List<Reactions> Reactions { get; set; }
        public List<Problems> Problems { get; set; }
        public List<Medications> Medications { get; set; }
    }
}
