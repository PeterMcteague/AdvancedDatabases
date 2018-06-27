using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EMRApplication.Models.RoleViewModels
{
    public class Role
    {
        public string Id { get; set; }

        [Display(Name = "Name")]
        public string RoleName { get; set; }

        [Display(Name = "Number of users")]
        public int NumberOfUsers { get; set; }
    }
}
