using EMRApplication.Data.PatientDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class ProblemVM : BaseVM
    {
        public List<Problems> Problems { get; set; }
    }
}
