using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.RoleViewModels
{
    public class AddToRoleVM
    {
        [Display(Name = "Name")]
        public String RoleName { get; set; }

        public IEnumerable<ApplicationUser> users { get; set; }
    }
}
