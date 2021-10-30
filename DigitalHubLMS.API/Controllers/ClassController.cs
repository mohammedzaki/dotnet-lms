using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers
{
    public class ClassController : BaseAPIRepoController<IRepository<CourseClass, long>>
    {
        public ClassController(IRepository<CourseClass, long> repository)
            : base(repository)
        {
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("change")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<CourseEnrol>> Change()
        {
            /*
            $user_id = Auth::user()->id;

            $validator = $this->validate($request, [
                'current_class' => 'required|integer',
                'course_id'     => 'required|integer',
            ]);
            $changeClass = CourseEnrol::updateOrCreate(
                [
                    'course_id' => $request->course_id,
                    'user_id'   => $user_id,
                ],
                ['current_class' => $request->current_class,
                ]
            );
            return response()->json($changeClass, 201);
             */
            throw new NotImplementedException();
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("answer")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<ClassQuizAnswer>> Answer()
        {
            /*
            $user_id = Auth::user()->id;
            $validator = $this->validate($request, [
                'class_quiz_take_id' => 'required|integer',
                'question_id'        => 'required|integer',
                'option_id'          => 'required|integer',
            ]);
            $classQuizTake = ClassQuizAnswer::updateOrCreate(
                [
                    'class_quiz_take_id' => $request->class_quiz_take_id,
                    'question_id'        => $request->question_id,
                    'option_id'          => $request->option_id,
                ],
                ['score'   => $request->score,
                 'attempt' => $request->attempt]
            );
            return response()->json($classQuizTake, 201);
            */
            throw new NotImplementedException();
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("markComplete")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<ClassUserMeta>> MarkComplete()
        {
            /*
            $user_id   = Auth::user()->id;
            $validator = $this->validate($request, [
                'meta_value'      => 'required|integer',
                'course_class_id' => 'required|integer',
            ]);

            $ClassUserMeta = ClassUserMeta::updateOrCreate(
                [
                    'course_class_id' => $request->course_class_id,
                    'user_id'         => $user_id,
                ],
                ['completed' => $request->meta_value]
            );

            $this->updateProgress($request->course_id, $user_id);
            return response()->json($ClassUserMeta, 201);
            */
            throw new NotImplementedException();
        }

        /*
        public function updateProgress($course_id, $user_id)
        {


            $classes = CourseClass::where('course_id', '=', $course_id)
                                  ->orderBy('section_id', 'asc')
                                  ->orderBy('order', 'asc')
                                  ->get();
            $done    = 0;
            foreach ($classes as $courseClass) {
                $matchThese  = ['user_id' => $user_id, 'course_class_id' => $courseClass->id];
                $isCompleted = ClassUserMeta::where($matchThese)->first();
                if ($isCompleted && $isCompleted['completed'] == '1') {
                    $done++;
                }
            }
            $progress = ($done / sizeof($classes)) * 100;

            $changeClass = CourseEnrol::updateOrCreate(
                [
                    'course_id' => $course_id,
                    'user_id'   => $user_id,
                ],
                ['progress' => $progress
                ]
            );
            $matchThese  = ['user_id' => $user_id, 'course_id' => $course_id];
            $certificate = Certificate::where($matchThese)->first();

            if ($progress === 100 && !$certificate) {
                $user_name = Auth::user()->display_name;
                $course    = Course::findOrFail($course_id)->title;
                // return \Redirect::route('certificate', ['user'=>$user_name,'course'=>$course]);
                // app('App\Http\Controllers\CertificateController')->createCertPDF($user_name,$course);
                $this->generateCertificate($user_name, $course, $user_id, $course_id);

            }

            return response()->json($changeClass, 201);
        }

        public function generateCertificate($user, $course, $user_id, $course_id)
        {
            $file_path = base_path('cert/src/template.pdf');


            $destination_path = $this->dbase;
            $host_path        = $this->base;
            $uuid             = Uuid::generate(4)->string;
            $pdfName          = $uuid . '.pdf';

            $filledPath = $destination_path . $pdfName;


            $pdf = new FPDI('L', 'in');

            // Reference the PDF you want to use (use relative path)
            $pagecount = $pdf->setSourceFile($file_path);
            $tpl       = $pdf->importPage(1);
            $pdf->AddPage();
            $pdf->useTemplate($tpl);
            $pdf->SetFont('Exo2', 'm');
            $pdf->SetFontSize('36'); // set font size
            $pdf->SetXY(0, 4.1); // set the position of the box
            $pdf->Cell(11.6891, 0, $user, 0, 0, 'C'); // add the text, align to Center of cell
            $pdf->SetFontSize('20');
            $pdf->SetXY(0, 5.1775);
            $pdf->Cell(11.6891, 0, $course, 0, 0, 'C');
            $pdf->SetFontSize('20');
            $pdf->SetXY(1.4, 6.1);
            $pdf->Cell(2.8821, 0, date("d/m/Y"), 0, 0, 'C');
            $pdf->Output($filledPath, 'F');


            $data = array(
                'name'      => $uuid,
                'slug'      => Str::random(),
                'user_id'   => $user_id,
                'course_id' => $course_id,
                'url'       => request()->getSchemeAndHttpHost() . $host_path . $pdfName,
                'status'    => 1,
            );

            $Certificate = Certificate::create($data);

            return response()->json($Certificate, 201);


        }
         */
    }
}
