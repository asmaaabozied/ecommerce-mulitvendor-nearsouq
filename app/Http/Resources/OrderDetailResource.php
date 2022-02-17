<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderDetailResource extends JsonResource
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
         
            'status' => $this->status ?? '',
            'shop_id' => $this->shop_id ?? '',
            'shop_name'=>$this->shop->$name ?? '',
            'product_id'=>$this->product_id ?? '',
            'order_id'=>$this->order_id ?? '',
            'price'=>$this->price ?? '',
            'vat'=>$this->vat ?? '',
            'commsion'=>$this->commsion ?? '',
             'commsion_value'=> $this->commsion_value ?? '',
           'quantity'=>$this->quantity ?? '',
           'delivery_date' =>$this->delivery_date ?? '',
           'image_path'=>$this->image_path ?? '',
            'name'=> $this->$name ?? '',
          'created_at' => $this->created_at->format('Y-m-d'),

          'options'=> $this->options ?? '',


   

        ];
    }
}
