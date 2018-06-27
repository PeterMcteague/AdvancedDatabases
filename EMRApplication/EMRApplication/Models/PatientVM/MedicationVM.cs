using EMRApplication.Data.PatientDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class MedicationVM : BaseVM
    {
        public List<Medications> Medications { get; set; }
    }
}
