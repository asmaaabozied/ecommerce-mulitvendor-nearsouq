<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Order extends Model
{

    use SoftDeletes;
    
    protected $table = "orders";

    protected $guarded = [];

    protected $hidden = [
        "created_at",
        "updated_at",
        "deleted_at",
        "created_by",
        "updated_by",
        "deleted_by"

    ];
    
    public function address()
    {
        return $this->belongsTo(Address::class);

    }//end of address
    
     public function PaymentType()
    {
        return $this->belongsTo(PaymentMethod::class,'payment_type');

    }//end of PaymentType
    

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class, 'order_id');

    }//end of orderDetails
}
