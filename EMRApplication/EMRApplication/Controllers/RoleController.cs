using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using EMRApplication.Models;
using EMRApplication.Models.RoleViewModels;
using EMRApplication.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Authorization;

namespace EMRApplication.Controllers
{
    [Authorize(Roles = "Admin")]
    public class RoleController : Controller
    {
        private readonly RoleManager<ApplicationRole> _roleManager;
        private readonly UserManager<ApplicationUser> _userManager;

        public RoleController(RoleManager<ApplicationRole> roleManager, UserManager<ApplicationUser> userManager)
        {
            this._roleManager = roleManager;
            this._userManager = userManager;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            List<Role> model = new List<Role>();

            var roles = _roleManager.Roles.AsEnumerable().ToList();
            foreach (ApplicationRole role in roles)
            {
                var numberOfUsersResponse = await _userManager.GetUsersInRoleAsync(role.Name);
                model.Add(new Role
                {
                    Id = role.Id,
                    RoleName = role.Name,
                    NumberOfUsers = numberOfUsersResponse.Count()
                });
            }

            return View(model);
        }

        [HttpGet]
        public IActionResult Create()
        {
            Role model = new Role();
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Role role)
        {
            if (ModelState.IsValid)
            {
                // Check if no role with that name exists
                if (_roleManager.RoleExistsAsync(role.RoleName).Result)
                {
                    return View(role);
                }
                else
                {
                    IdentityResult result = await _roleManager.CreateAsync(new ApplicationRole
                    {
                        Name = role.RoleName,
                        
                    });
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Index");
                    }
                }
            }
            return View(role);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(string id)
        {
            if (!String.IsNullOrEmpty(id))
            {
                ApplicationRole applicationRole = await _roleManager.FindByIdAsync(id);
                if (applicationRole != null)
                {
                    IdentityResult roleRuslt = _roleManager.DeleteAsync(applicationRole).Result;
                }
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult AddUsers(string id)
        {
            var usersWithRole = _userManager.GetUsersInRoleAsync(id).Result.ToList();
            var usersWithoutRole = _userManager.Users.Where(b => !usersWithRole.Contains(b)).ToList();

            var model = new AddToRoleVM { users = usersWithoutRole, RoleName = id };

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> AddUsers(string roleName , string userId)
        {
            var user = _userManager.Users.FirstOrDefault(b => b.Id == userId);

            if (user != null)
            {
                await _userManager.AddToRoleAsync(user, roleName);
            }
            
            return RedirectToAction("AddUsers", "Role", roleName);
        }

        [HttpGet]
        public IActionResult RemoveUsers(string id)
        {
            var usersWithRole = _userManager.GetUsersInRoleAsync(id).Result.ToList();

            var model = new AddToRoleVM { users = usersWithRole, RoleName = id };

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> RemoveUsers(string roleName, string userId)
        {
            var user = _userManager.Users.FirstOrDefault(b => b.Id == userId);

            if (user != null)
            {
                await _userManager.RemoveFromRoleAsync(user, roleName);
            }

            return RedirectToAction("RemoveUsers", "Role" , roleName);
        }
    }
}