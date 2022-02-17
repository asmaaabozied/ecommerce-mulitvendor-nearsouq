<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\OrderDetailResource;

class OrderResource extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
         $name = 'name_'. app()->getLocale();
        return [


            'id' => $this->id,
         
            'delivery_cost' => $this->delivery_cost ?? '',
            'delivery_distance_in_km' => $this->delivery_distance_in_km ?? '',
            'payment_type'=>$this->PaymentType->$name ?? '',
            'user_id'=>$this->user_id ?? '',
            'capon_id'=>$this->capon_id ?? '',
            'date'=>$this->date ?? '',
            'qrcode'=>$this->qrcode ?? '',
             'total'=> $this->total ?? '',
           'subtotal'=>$this->subtotal ?? '',
           'payment_status' =>$this->payment_status ?? '',
           'bill_number'=>$this->bill_number ?? '',
         'user_name'=> $this->address->first_name.' '. $this->address->last_name  ?? '',

          'address'=> $this->address->street.' '. $this->address->city .' '. $this->address->country ?? '',
          'phone'=>$this->address->phone ?? '',
          'created_at' => $this->created_at->format('Y-m-d'),

          'order_details'=>OrderDetailResource::collection($this->orderDetails) ?? '',
   

        ];
    }
}
