using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class BaseVM
    {
        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public DateTime DOB { get; set; }
    }
}
