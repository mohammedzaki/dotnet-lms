using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class CourseRepository : EntityRepository<DigitalHubLMSContext, Course, long>
    {
        public CourseRepository(DigitalHubLMSContext context)
            : base(context)
        {
        }

        public override Task<List<Course>> GetAll()
        {
            //$courses = Course::all();

            //foreach ($courses as $course) {
            //// show loan info
            //$course->cats;
            //$course->description = htmlspecialchars_decode($course->description);

            //$course->departments;
            //$course->studying = $course->courses->count();

            //$classData = $course->data()->first();
            //$course->course_data = $classData['data'];
            //$courseDuration = $course->duration;
            //$date_of_expiry = $course->created_at;
            //$date_of_expiry->addDays($courseDuration);

            //$course->course_ends = $date_of_expiry;


            //}
            //return response()->json($courses);

            return base.GetAll();
        }
    }
}



/*

 public function Get() getCoursesForCP
{



}

public function Getbyid($courseId) getCourseForDesign
{

}

public function createUpdateCourse(Request $request)
{


}

public function deleteCourse($courseId)
{


$deleted = Course::where('id', $courseId)->delete();
return $this->responseRequestSuccess(['success' => true]);

// if($course){
//     $course->delete();
//     return $this->responseRequestSuccess(['success' => true]);
// }else{
//     return $this->responseRequestError('Course not found');

// }


}

 */