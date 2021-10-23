using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class ReportController : BaseAdminAPIController<DigitalHubLMSContext>
    {
        public ReportController(DigitalHubLMSContext context)
            : base(context)
        {
        }

        [HttpGet]
        public async Task<ActionResult<List<Models.Report>>> Get()
        {
            /*
            $users = User::
        setEagerLoads([])
            // ->hidden(['confirmed' ])
                     ->selectRaw('
        users.display_name employee,
        course_enrols.progress progress,
        courses.title course,
        year(courses.created_at) year,
        monthname(courses.created_at) month

        ')
                     ->leftJoin('course_enrols', 'course_enrols.user_id', '=', 'users.id')
                     ->leftJoin('courses', 'courses.id', '=', 'course_enrols.course_id')
            // ->whereNull('course_enrols.progress',0)
                     ->get()->makeHidden(['confirmed']);;
        return response()->json($users, 200);
            */
            return null;
        }
    }
}
