<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;

use App\Models\Page;

use Illuminate\Http\Request;


class PageController extends Controller
{
  
public function GetPages(Request $request){

$pages=Page::where('slug',$request->slug)->first();


        return $this->responseJson(1, __('site.messages.success'), $pages);




}



}