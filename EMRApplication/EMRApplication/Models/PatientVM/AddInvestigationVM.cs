using EMRApplication.Data.PatientDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class AddInvestigationVM : BaseVM
    {
        public Investigations Investigation { get; set; }
        public InvestigationDetails InvestigationDetails { get; set; }
    }
}
