using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.PatientVM
{
    public class AddProblemVM : BaseVM
    {
        [Required(ErrorMessage = "Please enter a name")]
        [DisplayName("Problem Name")]
        public string ProblemName { get; set; }
    }
}
