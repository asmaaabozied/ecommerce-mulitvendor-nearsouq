<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Reason extends Model
{


    protected $table = "reason";
    protected $guarded = [];
     protected $appends = [ 'name'];

    protected $hidden = [

        "created_at",
        "updated_at",
  
"name_ar", "name_en",

    ];
    public function getNameAttribute()
    {
        return (app()->getLocale() === 'ar') ? $this->name_ar : $this->name_en;
    }// end of get name




}
