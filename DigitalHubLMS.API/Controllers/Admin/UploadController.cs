using System;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class UploadController : BaseAdminAPIController<DigitalHubLMSContext>
    {
        public UploadController(DigitalHubLMSContext context)
            : base(context)
        {
        }

        [HttpPost("document")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<IActionResult> UploadCourseDocument()
        {
            /*
            
    {

        $response = null;

        if ($request->hasFile('file')) {

            $original_filename     = $request->file('file')->getClientOriginalName();
            $mime                  = $request->file('file')->getMimeType();
            $size                  = $request->file('file')->getSize();
            $original_filename_arr = explode('.', $original_filename);
            $file_ext              = end($original_filename_arr);
            $destination_path      = $this->dbase . '/media/';
            $host_path             = $this->base . 'media/';
            $uuid                  = Uuid::generate(4)->string;
            $fileName              = $uuid . '.' . $file_ext;

            if ($request->file('file')->move($destination_path, $fileName)) {
                $document = Document::create([
                                                 'uid'        => $uuid,
                                                 'name'       => $original_filename_arr[0],
                                                 'size'       => $size,
                                                 'url'        => request()->getSchemeAndHttpHost() . $host_path . $fileName,
                                                 'file_key'   => $uuid,
                                                 'mime'       => $mime,
                                                 'private'    => true,
                                                 'user_id'    => Auth::user()->id,
                                                 'created_by' => Auth::user()->id,
                                                 'updated_by' => Auth::user()->id,
                                             ]);

                return $this->responseRequestSuccess($document);
            } else {
                return $this->responseRequestError('Cannot upload file');
            }
        } else {
            return $this->responseRequestError('File not found');
        }

    }
             */
            throw new NotImplementedException();
        }

        [HttpPost("image")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<IActionResult> UploadImage()
        {
            /* 
             
    {
        $response = null;
        $user     = (object)['image' => ""];

        if ($request->hasFile('file')) {
            $original_filename     = $request->file('file')->getClientOriginalName();
            $original_filename_arr = explode('.', $original_filename);
            $file_ext              = end($original_filename_arr);
            $destination_path      = $this->dbase . '/image/';
            $host_path             = $this->base . 'image/';
            $uuid                  = Uuid::generate(4)->string;

            $image = $uuid . '.' . $file_ext;

            $mime = $request->file('file')->getMimeType();
            $size = $request->file('file')->getSize();

            if ($request->file('file')->move($destination_path, $image)) {
                $user->image = $this->base . 'image/' . $image;
                $document    = Image::create([
                                                 'uid'        => $uuid,
                                                 'name'       => $original_filename_arr[0],
                                                 'size'       => $size,
                                                 'url'        => request()->getSchemeAndHttpHost() . $host_path . $image,
                                                 'file_key'   => $uuid,
                                                 'mime'       => $mime,
                                                 'private'    => true,
                                                 'user_id'    => Auth::user()->id,
                                                 'created_by' => Auth::user()->id,
                                                 'updated_by' => Auth::user()->id,
                                             ]);

                return $this->responseRequestSuccess($document);
            } else {
                return $this->responseRequestError('Cannot upload file');
            }
        } else {
            return $this->responseRequestError('File not found');
        }
    }
             */
            throw new NotImplementedException();
        }

        [HttpPost("media")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<IActionResult> UploadMedia()
        {
            /*
             
    {

        $validator = $this->validate($request, [
            'file' => 'required|file|mimetypes:video/mp4,video/mpeg,video/x-m4v,video/x-matroska',
        ]);


        $response = null;

        if ($request->hasFile('file')) {

            $destination_path = $this->dbase . '/course/media/';
            $host_path        = $this->base . 'course/media/';

            $track = new GetId3($request->file('file'));
            $info  = $track->extractInfo();

            $original_filename     = $request->file('file')->getClientOriginalName();
            $mime                  = $info['mime_type'];
            $size                  = $info['filesize'];
            $duration              = $info['playtime_string'];
            $quality               = $info['video']['resolution_y'];
            $original_filename_arr = explode('.', $original_filename);
            $file_ext              = end($original_filename_arr);

            $uuid  = Uuid::generate(4)->string;
            $image = $uuid . '.' . $file_ext;

            $uuid     = Uuid::generate(4)->string;
            $fileName = $quality . "_" . $uuid . '.' . $file_ext;
            if ($request->file('file')->move($destination_path, $fileName)) {
                $video = Media::create([
                                           'uid'        => Uuid::generate(4)->string,
                                           'name'       => $original_filename_arr[0],
                                           'size'       => $size,
                                           'url'        => request()->getSchemeAndHttpHost() . $host_path . $fileName,
                                           'file_key'   => $uuid,
                                           'duration'   => $duration,
                                           'quality'    => $quality,
                                           'mime'       => $mime,
                                           'private'    => true,
                                           'user_id'    => Auth::user()->id,
                                           'created_by' => Auth::user()->id,
                                           'updated_by' => Auth::user()->id,
                                       ]);

                return $this->responseRequestSuccess($video);
            } else {
                return $this->responseRequestError('Cannot upload file');
            }
        } else {
            return $this->responseRequestError('File not found');
        }

        // $this->dispatch(new ConvertVideoForDownloading($video));
        // $this->dispatch(new ConvertVideoForStreaming($video));


    }
             */
            throw new NotImplementedException();
        }

        [HttpPost("subtitle")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<IActionResult> UploadSubtitle()
        {
            /*
             
    {

        $validator = $this->validate($request, [
            'file' => 'required|file|max:5000|mimetypes:text/plain',
        ]);


        $response = null;

        if ($request->hasFile('file')) {

            $original_filename = $request->file('file')->getClientOriginalName();
            $mime              = $request->file('file')->getMimeType();

            $original_filename_arr = explode('.', $original_filename);
            $file_ext              = end($original_filename_arr);
            $destination_path      = $this->dbase . '/subtitle/';
            $host_path             = $this->base . 'subtitle/';
            $uuid                  = Uuid::generate(4)->string;
            $fileName              = $uuid . '.' . $file_ext;

            if ($request->file('file')->move($destination_path, $fileName)) {
                $subtitle = Subtitle::create([
                                                 'uid'        => $uuid,
                                                 'name'       => $original_filename_arr[0],
                                                 'url'        => request()->getSchemeAndHttpHost() . $host_path . $fileName,
                                                 'mime'       => $mime,
                                                 'user_id'    => Auth::user()->id,
                                                 'created_by' => Auth::user()->id,
                                                 'updated_by' => Auth::user()->id,
                                             ]);
                return $this->responseRequestSuccess($subtitle);
            } else {
                return $this->responseRequestError('Cannot upload file');
            }
        } else {
            return $this->responseRequestError('File not found');
        }

    }
             */
            throw new NotImplementedException();
        }

    }
}
