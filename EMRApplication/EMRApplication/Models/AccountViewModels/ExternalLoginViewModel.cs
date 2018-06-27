using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.AccountViewModels
{
    public class ExternalLoginViewModel
    {
        [Required(ErrorMessage = "Required")]
        [EmailAddress]
        public string Email { get; set; }
    }
}
