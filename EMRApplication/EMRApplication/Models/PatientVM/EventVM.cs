using EMRApplication.Data.PatientDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class EventVM : BaseVM
    {
        public List<Events> Events { get; set; }
        public List<String> EventNames { get; set; }
        public List<DateTime> EventDates { get; set; }
    }
}
