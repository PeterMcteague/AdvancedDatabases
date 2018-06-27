using System;
using System.Collections.Generic;

namespace EMRApplication.Data.PatientDB
{
    public partial class ConsentLookup
    {
        public ConsentLookup()
        {
            Patient = new HashSet<Patient>();
            RecordAccess = new HashSet<RecordAccess>();
        }

        public string Name { get; set; }

        public ICollection<Patient> Patient { get; set; }
        public ICollection<RecordAccess> RecordAccess { get; set; }
    }
}
