<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $guarded=[];

    protected $hidden = [
        'created_by', 'updated_by',
        "deleted_at",
        "deleted_by",
    ];

    public function user()
    {
        return $this->belongsTo(\App\User::class, 'user_id');

    }//end of category
}
