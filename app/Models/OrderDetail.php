<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Sqits\UserStamps\Concerns\HasUserStamps;

class OrderDetail extends Model
{
    use HasUserStamps;
    use SoftDeletes;

    protected $table = "order_details";
    protected $appends = ['image_path', 'name'];

    protected $guarded = [];
    protected $with=['options'];
    protected $hidden = [

        "created_at",
        "updated_at",
        "deleted_at",
        "created_by",
        "updated_by",
        "deleted_by",
        "variant_name"

    ];

  public function shop()
    {
        return $this->belongsTo(Shop::class);

    }//end of PaymentType

    public function getImagePathAttribute()
    {
        return asset('uploads/shops/products/' . $this->image);

    }//end of get image path

    public function getNameAttribute()
    {
        return (app()->getLocale() === 'ar') ? $this->name_ar : $this->name_en;
    }// end of get name



    public function getVariantNameAttribute()
    {
        return (app()->getLocale() === 'ar') ? $this->variant_name_ar : $this->variant_name_en;
    }// end of get name

 
    
       public function options()
    {
        return $this->hasMany(Order_products_option::class, 'order_detail_id');

    }//end of OrderProductOption 
    
}
