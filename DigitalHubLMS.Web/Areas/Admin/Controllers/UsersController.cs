using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DigitalHubLMS.Core.Data;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Web.Areas.Admin.Models;

namespace DigitalHubLMS.Web.Areas.Admin.Controllers
{
    public class UsersController : AdministrationController
    {
        private readonly DigitalHubLMSContext _context;
        private readonly UserManager<User> _userManager;

        public UsersController(DigitalHubLMSContext context, UserManager<User> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: Admin/Users
        public async Task<IActionResult> Index()
        {
            return View(await _context.Users.Where(u => u.UserName != "SuperAdmin" && u.UserName != "SysOwner").ToListAsync());
        }

        // GET: Admin/Users/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await _context.Users
                .FirstOrDefaultAsync(m => m.Id == id);
            if (user == null)
            {
                return NotFound();
            }

            return View(user);
        }

        // GET: Admin/Users/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(UserInput user)
        {
            if (ModelState.IsValid)
            {
                var u = new User { UserName = user.Email, Email = user.Email, EmailConfirmed = true, LockoutEnabled = false };
                var result = await _userManager.CreateAsync(u, user.Password);
                if (result.Succeeded)
                {
                    return RedirectToAction(nameof(Index));
                }
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
                return View(user);
            }
            return View(user);
        }

        // GET: Admin/Users/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            var inputUser = new UserInputUpdate { Id = user.Id, Email = user.Email, PhoneNumber = user.PhoneNumber };
            return View(inputUser);
        }

        // POST: Admin/Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, UserInputUpdate user)
        {
            if (id != user.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    //a hasher to hash the password before seeding the user to the db
                    var hasher = new PasswordHasher<User>();
                    //_context.Update(user);
                    //await _context.SaveChangesAsync();
                    var userFromMan = await _userManager.FindByIdAsync(user.Id.ToString());
                    userFromMan.UserName = user.Email;
                    userFromMan.Email = user.Email;
                    userFromMan.PhoneNumber = user.PhoneNumber;
                    if(!string.IsNullOrEmpty(user.Password))
                        userFromMan.PasswordHash = hasher.HashPassword(null, user.Password);
                    var result = await _userManager.UpdateAsync(userFromMan);
                    if (result.Succeeded)
                    {
                        return RedirectToAction(nameof(Index));
                    }
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }
                    return View(user);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserExists(user.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                //return RedirectToAction(nameof(Index)); // Unreachable code detected 

            }
            return View(user);
        }

        // GET: Admin/Users/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await _context.Users
                .FirstOrDefaultAsync(m => m.Id == id);
            if (user == null)
            {
                return NotFound();
            }

            return View(user);
        }

        // POST: Admin/Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var user = await _context.Users.FindAsync(id);
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool UserExists(long id)
        {
            return _context.Users.Any(e => e.Id == id);
        }
    }
}
