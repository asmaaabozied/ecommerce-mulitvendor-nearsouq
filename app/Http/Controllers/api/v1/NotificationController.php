<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;

use App\Http\Resources\NotificationResource;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
  // show notifications to auth user 
    public function ShowNotification()
    {


        $users = auth()->user();

        $notification = $users->notifications;


        $notifications = NotificationResource::collection($notification);

        return $this->responseJson(1, __('site.messages.success'), $notifications);


    }
}
