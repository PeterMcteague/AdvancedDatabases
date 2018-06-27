using EMRApplication.Data.PatientDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class SummaryVM : BaseVM
    {
        public List<Problems> Problems { get; set; }
        public List<Medications> Medications { get; set; }
        public List<Reactions> Reactions { get; set; }
    }
}
