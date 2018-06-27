using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models
{
    public class IndexVM
    {
        public IEnumerable<EMRApplication.Data.PatientDB.Patient> Patients { get; set; }
    }
}
