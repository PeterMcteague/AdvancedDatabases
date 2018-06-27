using EMRApplication.Data.PatientDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class AddMedicationVM : BaseVM
    {
        public Medications Medication { get; set; }
    }
}
