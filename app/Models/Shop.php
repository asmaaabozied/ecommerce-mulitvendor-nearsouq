<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Shop extends Model
{
    protected $table = "shops";
    protected $guarded = [];
    protected $appends = ['image_path','name','description'];
    protected $with = ['category','Products'];
    protected $hidden = [

        "created_at",
        "updated_at",
        "deleted_at",
        "created_by",
        "updated_by",
        "deleted_by",
        "image","published"
        ,'extras','name_ar','name_en','desc_ar','desc_en','category_id',
        'mall_id','vat_no','vat_img','commerical_img'

    ];

    public function getNameAttribute()
    {
        return (app()->getLocale() === 'ar') ? $this->name_ar : $this->name_en;
    }

    public function getImagePathAttribute()
    {
        return asset('uploads/shops/profiles/' . $this->image);

    }//end of get image path

    public function getDescriptionAttribute()
    {
        return (app()->getLocale() === 'ar') ? $this->desc_ar : $this->desc_en;
    }

    public function Products()
    {
        return $this->belongsToMany(Product::class, 'shop_products')->withPivot('product_id','shop_id','quantity');

    }//end of Products
    
        public function OfferProducts()
    {
        return $this->belongsToMany(Product::class, 'shop_products')->whereNotNull('discount_price');

    }//end of OfferProducts

    public function getQuantity(){

//        return $this->Products->pivot->quantity ?? '';

    } //getQuantity
      public function category()
    {
        return $this->belongsTo(category::class, 'category_id');

    }//end of category
    //
     public function mall()
    {
        return $this->belongsTo(Mall::class, 'mall_id');

    }//end of mall

    public function ratings()
    {
        return $this->hasMany(Rating::class, 'rated_id')->where('type','Shop');

    }//end of ratings
}
