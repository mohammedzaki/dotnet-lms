using System;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DigitalHubLMS.API.Controllers
{
    public class DashboardController : BaseAPIController<DigitalHubLMSContext>
    {
        public DashboardController(DigitalHubLMSContext context)
            : base(context)
        {
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<UserDashboard>> Get()
        {
            /*
            $user_id    = Auth::user()->id;
            $matchThese = ['user_id' => $user_id, 'type' => 'course'];

            $enroll = CourseEnrol::where($matchThese)
                // ->latest()
                                 ->orderBy('updated_at', 'desc')
                                 ->get();


            if (sizeof($enroll) !== 0) {
                $progress                   = [];
                $course                     = $enroll[0];
                $data                       = $course->course()->first();
                $currentCourse              = [];
                $currentCourse['title']     = $data->title;
                $currentCourse['thumbnail'] = $data->thumbnail;
                $currentCourse['slug']      = $data->slug;
                $currentCourse['progress']  = $course->progress;
                $total_courses              = $enroll->count();
                $total_progress             = $enroll->sum('progress');
                $total_percent              = $total_courses * 100;
                $not_started                = $enroll->where('progress', '0')->count();
                $not_started_percent        = $not_started * 100;

                $total_done_percent        = ceil(($total_progress / $total_percent) * 100);
                $total_not_started_percent = ceil(($not_started_percent / $total_percent) * 100);
                $total_in_progress_percent = ceil(100 - ($total_done_percent + $total_not_started_percent));
                foreach ($enroll as $en) {
                    $progress[] = $en->progress;
                }

                $matchThese         = ['user_id' => $user_id];
                $certificates       = Certificate::where($matchThese)->get();
                $total_certificates = $certificates->count();

                $output = array('latest_course'      => $currentCourse,
                                "in_progress"        => $total_in_progress_percent, 
                                "line" => $progress,
                                "done"               => $total_done_percent,
                                "total_courses"      => $total_courses,
                                "total_certificates" => $total_certificates,
                                "not_started"        => $total_not_started_percent,

                );

                return response()->json($output, 200);


            }
            */
            return new UserDashboard
            {
                latest_course = null,
                in_progress = 0,
                line = new System.Collections.Generic.List<int>(),
                done = 0,
                total_courses = 0,
                total_certificates = 0,
                not_started = 0
            };
        }
    }
}
