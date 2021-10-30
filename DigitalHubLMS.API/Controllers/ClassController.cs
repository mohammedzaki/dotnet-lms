using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MZCore.Helpers;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers
{
    public class ClassController : BaseAPIRepoController<IRepository<CourseClass, long>>
    {
        protected readonly DigitalHubLMSContext _dbContext;

        public ClassController(IRepository<CourseClass, long> repository, DigitalHubLMSContext context)
            : base(repository)
        {
            _dbContext = context;
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("change")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<CourseEnrol>> Change([Required] long current_class, [Required] long course_id)
        {
            var userId = User.GetLoggedInUserId<long>();
            var changeClass = await _dbContext.CourseEnrols
                .Where(e => e.CourseId == course_id && e.UserId == userId).FirstOrDefaultAsync();
            if (changeClass == null)
            {
                changeClass = new CourseEnrol();
                changeClass.CourseId = course_id;
                changeClass.UserId = userId;
                changeClass.CurrentClass = current_class;
                _dbContext.Add(changeClass);
            }
            else
            {
                changeClass.CurrentClass = current_class;
                _dbContext.Update(changeClass);
            }
            await _dbContext.SaveChangesAsync();
            return Created(nameof(Change), changeClass);
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("answer")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<ClassQuizAnswer>> Answer([Required] long class_quiz_take_id, [Required] long question_id, [Required] long option_id, byte? score, byte? attempt)
        {
            var classQuizAnswer = await _dbContext.ClassQuizAnswers.Where(e => e.ClassQuizTakeId == class_quiz_take_id && e.QuestionId == question_id && e.OptionId == option_id).FirstOrDefaultAsync();
            if (classQuizAnswer == null)
            {
                classQuizAnswer = new ClassQuizAnswer
                {
                    ClassQuizTakeId = class_quiz_take_id,
                    QuestionId = question_id,
                    OptionId = option_id,
                    Score = score.Value,
                    Attempt = attempt.Value
                };
                _dbContext.Add(classQuizAnswer);
            }
            else
            {
                classQuizAnswer.Score = score.Value;
                classQuizAnswer.Attempt = attempt.Value;
                _dbContext.Update(classQuizAnswer);
            }
            await _dbContext.SaveChangesAsync();
            return Created(nameof(Answer), classQuizAnswer);
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("markComplete")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<ClassUserMeta>> MarkComplete([Required] int meta_value, [Required] long course_class_id, long? course_id)
        {
            var userId = User.GetLoggedInUserId<long>();
            var classUserMeta = await _dbContext.ClassUserMeta.Where(e => e.CourseClassId == course_class_id && e.UserId == userId).FirstOrDefaultAsync();
            if (classUserMeta == null)
            {
                classUserMeta = new ClassUserMeta
                {
                    CourseClassId = course_class_id,
                    UserId = userId,
                    Completed = meta_value
                };
                _dbContext.Add(classUserMeta);
            }
            else
            {
                classUserMeta.Completed = meta_value;
                _dbContext.Update(classUserMeta);
            }
            await _dbContext.SaveChangesAsync();
            UpdateProgress(course_id, userId);
            return Created(nameof(MarkComplete), classUserMeta);
        }

        //public function updateProgress($course_id, $user_id)
        private void UpdateProgress(long? course_id, long user_id)
        {
            //$classes = CourseClass::where('course_id', '=', $course_id)
            //                      ->orderBy('section_id', 'asc')
            //                      ->orderBy('order', 'asc')
            //                      ->get();

            var done = 0;
            //foreach ($classes as $courseClass) {
            //    $matchThese = ['user_id' => $user_id, 'course_class_id' => $courseClass->id];
            //    $isCompleted = ClassUserMeta::where($matchThese)->first();
            //    if ($isCompleted && $isCompleted['completed'] == '1') {
            //        $done++;
            //    }
            //}
            //$progress = ($done / sizeof($classes)) *100;

            //$changeClass = CourseEnrol::updateOrCreate(
            //    [
            //        'course_id' => $course_id,
            //        'user_id'   => $user_id,
            //    ],
            //    ['progress' => $progress
            //    ]
            //);
            //$matchThese = ['user_id' => $user_id, 'course_id' => $course_id];
            //$certificate = Certificate::where($matchThese)->first();

            //if ($progress === 100 && !$certificate) {
            //    $user_name = Auth::user()->display_name;
            //    $course = Course::findOrFail($course_id)->title;
            //    $this->generateCertificate($user_name, $course, $user_id, $course_id);
            //}
            // return response()->json($changeClass, 201);
        }

        //public function generateCertificate($user, $course, $user_id, $course_id)
        private void generateCertificate(User user, Course course)
        {
            //$file_path = base_path('cert/src/template.pdf');


            //$destination_path = $this->dbase;
            //$host_path = $this->base;
            //$uuid = Uuid::generate(4)->string;
            //$pdfName = $uuid. '.pdf';

            //$filledPath = $destination_path. $pdfName;


            //$pdf = new FPDI('L', 'in');

            //// Reference the PDF you want to use (use relative path)
            //$pagecount = $pdf->setSourceFile($file_path);
            //$tpl = $pdf->importPage(1);
            //$pdf->AddPage();
            //$pdf->useTemplate($tpl);
            //$pdf->SetFont('Exo2', 'm');
            //$pdf->SetFontSize('36'); // set font size
            //$pdf->SetXY(0, 4.1); // set the position of the box
            //$pdf->Cell(11.6891, 0, $user, 0, 0, 'C'); // add the text, align to Center of cell
            //$pdf->SetFontSize('20');
            //$pdf->SetXY(0, 5.1775);
            //$pdf->Cell(11.6891, 0, $course, 0, 0, 'C');
            //$pdf->SetFontSize('20');
            //$pdf->SetXY(1.4, 6.1);
            //$pdf->Cell(2.8821, 0, date("d/m/Y"), 0, 0, 'C');
            //$pdf->Output($filledPath, 'F');


            //$data = array(
            //    'name'      => $uuid,
            //    'slug'      => Str::random(),
            //    'user_id'   => $user_id,
            //    'course_id' => $course_id,
            //    'url'       => request()->getSchemeAndHttpHost(). $host_path. $pdfName,
            //    'status'    => 1,
            //);

            //$Certificate = Certificate::create($data);

            //return response()->json($Certificate, 201);
        }
    }
}
