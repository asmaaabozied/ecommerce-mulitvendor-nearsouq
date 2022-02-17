<?php

namespace App\Http\Resources;

use App\Models\ShopProduct;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailShopResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        $name = 'name_' . app()->getLocale();
        $description = 'desc_' . app()->getLocale();
        $quantity = ShopProduct::where('shop_id', $this->id)->first()->quantity ?? '';

        if ($quantity) {
            return [


                'id' => $this->id ?? '',
                'name' => $this->$name,
                'description' => $this->$description,
                'address' => $this->address ?? '',
                'latitude' => $this->latitude ?? '',
                'longitude' => $this->longitude ?? '',
                'category_name' => $this->category->$name ?? '',
                'mall_name' => $this->mall->$name ?? '',
                'distance' => $this->distance ?? 0,
                'rate' => $this->ratings->avg('rate') ?? '',
                'phone' => $this->phone,
                'image_path' => asset('uploads/shops/profiles/' . $this->image),
                'created_at' => $this->created_at ?? '',
                'quantity' => $quantity ?? '',
                'products' => ProductCategoryResource::collection($this->products) ?? '',

            ];
        }else{
            return [


                'id' => $this->id ?? '',
                'name' => $this->$name,
                'description' => $this->$description,
                'address' => $this->address ?? '',
                'latitude' => $this->latitude ?? '',
                'longitude' => $this->longitude ?? '',
                'category_name' => $this->category->$name ?? '',
                'mall_name' => $this->mall->$name ?? '',
                'distance' => $this->distance ?? 0,
                'rate' => $this->ratings->avg('rate') ?? '',
                'phone' => $this->phone,
                'image_path' => asset('uploads/shops/profiles/' . $this->image),
                'created_at' => $this->created_at ?? '',
                'products' => ProductCategoryResource::collection($this->products) ?? '',

            ];


        }
    }
}
