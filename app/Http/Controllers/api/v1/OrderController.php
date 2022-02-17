<?php

namespace App\Http\Controllers\api\v1;
use App\Http\Controllers\Controller;
use App\Http\Resources\OrderResource;
use App\Http\Resources\CartResource;
use App\Models\Cart;
use App\Models\Cart_product_option;
use App\Models\Deliverycalculator;
use App\Models\Option;
use App\Models\Order;
use App\Models\Order_products_option;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Shop;
use App\Models\ShopProduct;
use App\Models\Variant;
use App\Models\Favorite;
use App\Models\DeliveryRelation;
use App\Models\DeliveryCost;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use App\Models\Reason;
class OrderController extends Controller
{
    //list of reasons to used in canceled order 
   public function listOfReason(){
        
             $reasons = Reason::get();
   
           return $this->responseJson(1, __('site.messages.success'), $reasons);

        
    }
    // show oder details with user auth
    public function showOrder(Request $request)
    {
        $rule = [
            'id' => 'required|exists:orders,id',

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }



        $orders = Order::where('user_id', Auth::id())->where('id', $request->id)->with(['address','PaymentType','orderDetails'])->first();
   

  $orderss = new OrderResource($orders);
        // $total = 0;

        // $Subtotal = 0;

        // foreach ($orders->orderDetails as $order)
        //     $product = Product::where('id', $order->product_id)->first();
        // $shop = Shop::where('id', $order->shop_id)->first();

        // $sum = ($order->price + $product->variants()) * $order->quantity;

        // $total = +$sum;
        // if ($shop->vat == 0) {
        //     $Subtotal = $total;
        // } else {
        //     $Subtotal = $total / $shop->vat / 100;

        // }

        // $data = array("total" => $total, 'subtotal' => $Subtotal);


        return response()->json(['status' => 1, 'message' => __('site.messages.success'), 'order' => $orderss]);


    }

    // list of all order to user auth
    public function listOfOrder()
    {
        
 

        // $orders = Order::where('user_id', Auth::id())->get();
        $orders = Order::where('status','!=','canceled')->where('user_id', Auth::id())->with(['address','PaymentType','orderDetails'])->get();
        

        
        
          $orderss = OrderResource::collection($orders);

        return $this->responseJson(1, __('site.messages.success'), $orderss);
    }

    public function listOfOrderWithType(Request $request)
    {

        $rule = [
            'type' => 'required',


        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }


        $orders = Order::where('user_id', Auth::id())->where('status', $request->type)->with(['address','PaymentType','orderDetails'])->get();
       $orderss = OrderResource::collection($orders);   
        return $this->responseJson(1, __('site.messages.success'), $orderss);
    }

    // canceled order user auth
    public function canceledOrder(Request $request)
    {
        $rule = [

            //'order_id'         => 'nullable',
           // 'order_detail_id'  =>'required'
        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);
         }
     if(isset($request->order_id)){
        $order = Order::find($request->order_id);
        $order->update(['status' => 'canceled']);
         }
     if(isset($request->order_detail_id)){
    

        $orderdetails=OrderDetail::where('id',$request->order_detail_id)->first();
        $orderdetails->update(['status' => 'canceled','reason_id'=>$request->reason_id]);
           }
        return response()->json(['status' => 1, 'message' => __('site.messages.success')]);


    }

    // add order user auth
    public function addOrder(Request $request)
    {
        $rule = [
            'address_id' => 'required',

            'payment_type' => 'required',

            'capon_id' => 'nullable'


        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        $order = Order::create([

            'address_id' => $request->address_id,

            'total' => 0,
            'subtotal' => 0,

            'capon_id' => $request->capon_id,

            'payment_type' => $request->payment_type,

            'bill_number' => 'SOUQ_' . rand(1111, 9999),


            'user_id' => Auth::id()

        ]);
        $ordersArray = [];
        $items = Cart::where('user_id', Auth::id())->get();
      if (isset($items) && !$items->isEmpty()) {

        $total = 0;
        $subtotal = 0;
        $cost=0;
        $distance=0;

        foreach ($items as $product) {

            $shopId = $product['shop_id'];
            $productId = $product['product_id'];
            $ids = Cart_product_option::where('product_id', $productId)->first();
            if($ids){
               $costs=Deliverycalculator::where('cart_id',$ids->cart_id)->sum('cost');
            $distances=Deliverycalculator::where('cart_id',$ids->cart_id)->sum('distance');  
            }else{
              $costs=0;  
              $distances=0;
                
            }
          
            $cost += $costs;
            $distance+=$distances;
            $variantId = $ids->variant_id ?? '';
            $optionId = $ids->option_id ?? '';
            $qty = $product['quantity'];
            $data = Product::where('id', $productId)->first();
            $variant = Variant::where('id', $variantId)->first();
            $option = Option::where('id', $optionId)->first();

            $productchekeds = ShopProduct::where('shop_id', $shopId)->where('product_id', $productId)->first();
            //   $product = Product::where('id', $productId)->first();
            $shop = Shop::where('id', $shopId)->first();

            if ($productchekeds->quantity >= $qty) {

                if ($data->discount_price > 0) {
                    $subtot = (($data->discount_price + $data->variants()) * $qty) / (1 + $shop->vat / 100);
                    $sum = ($data->discount_price + $data->variants()) * $qty;
                } else {
                    $subtot = (($data->price + $data->variants()) * $qty) / (1 + $shop->vat / 100);
                    $sum = ($data->price + $data->variants()) * $qty;
                }

                $total += $sum;
                $subtotal += $subtot;
       if ($data->discount_price > 0) {
			$product_total_price  =(($data->discount_price + $data->variants()) * $qty);
                        $net_amount_vat  = $product_total_price / (1 + $shop->vat / 100);
                        
                      	$amount_without_commsion  = $net_amount_vat  / (1 + $shop->commission / 100);

			

                    } else {
			$product_total_price  = (($data->price + $data->variants()) * $qty);
                        $net_amount_vat = $product_total_price  / (1 + $shop->vat / 100);
                        $amount_without_commsion  = $net_amount_vat  / (1 + $shop->commission / 100);

                    }
            $commission = $shop->commission;
            $commission_value = $net_amount_vat - $amount_without_commsion;
            
            $vat= $shop->vat;
         $vat_value= $product_total_price - $net_amount_vat;

         $merchant_will_get = $amount_without_commsion + $vat_value;
                
 
                $orders = OrderDetail::create([

                    'product_id' => $productId,
                    'order_id' => $order->id,
                    'quantity' => $qty,
                    'price' => $data->price,
                    'vat'=>$vat,
                    'vat_value'=> $vat_value,
                    'name_ar' => $data->name_ar,
                    'name_en' => $data->name_en,
                    'image' => $data->image,
                    'shop_id' => $shopId,
                    'commsion'=>$commission,
                    'commsion_value'=>$commission_value,
                    'delivery_date'=>Carbon::now()
                ]);

                if (!empty($product['variants'])) {
                    foreach ($product['variants'] as $variantt) {
                        $variantss = Variant::where('id', $variantt['id'])->first();
                        $optionss = Option::where('id', $variantt['option_id'])->first();
                        $ords = Order_products_option::create([
                            'variant_name_ar' => $variantss->name_ar,
                            'order_detail_id'=>$orders->id,
                            'variant_name_en' => $variantss->name_en,
                            'variant_id' => $variantt['id'],
                            'option_id' => $variantt['option_id'],
                            'extra_price' => $variantt['extra_price'],
                            'option_name_ar' => $optionss->name_ar,
                            'option_name_en' => $optionss->name_en,
                        ]);
                    }
                }
                
              $shop_product= ShopProduct::where('product_id',$productId)->where('shop_id',$shopId)->first();
                $shop_product->update(['quantity'=>$shop_product->quantity - $qty]);
                
            } else {

                return $this->responseJson(1, __('site.productnotavailable'));
            }

            array_push($ordersArray, $orders);
        }

        $order->update(['total' => $total, 'subtotal' => $subtotal,'delivery_cost'=>$cost,'delivery_distance_in_km'=>$distance]);

        $cartItem = Cart::where('user_id', Auth::id())->first();
        
        $Deliverycalculator = Deliverycalculator::where('cart_id', $cartItem->id)->delete();
     
          $deliveryrelation=DB::table('delivery_relation')->where('cart_id', $cartItem->id)->delete();

           $cartoption=Cart_product_option::where('cart_id', $cartItem->id)->first();
                if (!empty($cartoption)) {
            Cart_product_option::where('cart_id', $cartItem->id)->delete();
                }

            Cart::where('user_id', Auth::id())->delete();

            return $this->responseJson(1, __('site.messages.success'), $ordersArray);
        
        }else{
     
           return $this->responseJson(1, __('site.nodataincart'));
  
        }
 
       }

    // get all total in deliverycost using auth user
    public function TotalDeliveryCost(Request $request)
    {
        $lat1 = $request->latitude;
        $lon1 = $request->longitude;
        $cart=Cart::where('user_id', Auth::id())->get();
        
     
        if (isset($cart) && !$cart->isEmpty()) {
          $Totalcost=0;
            foreach ($cart as $car) {
                $delivery = Deliverycalculator::where('user_id', Auth::id())->where('cart_id',$car->id)->first();
                $lat2 = $delivery->latitude;
                $lon2 = $delivery->longitude;
                if ($lat1 == $lat2 && $lon1 == $lon2) {
                    $Totalcost+=$delivery->cost;

                } else {

                    $distance = round($this->distance($lat1, $lon1, $lat2, $lon2));

                    $Delivery = DeliveryCost::where('min_distance', '<=', $distance)->where('max_distance', '>=', $distance)->first();

                    if ($Delivery) {

                        $costs = $distance * $Delivery->price;


                        $chekeddelivery=Deliverycalculator::where('cart_id',$car->id)->where('user_id', Auth::id())->first();
                        if($chekeddelivery){

                               $chekeddelivery->update(['cost' => $costs,'distance'=>$distance]);

                            $Totalcost+=$costs;

                        }
                    } else {

                        return $this->responseJson(1, __('site.deliverycostnotavailable'));

                    }


                }

            }
            
            
         
            return $this->responseJson(1, __('site.messages.success'),$Totalcost);
        }else{
            
            return $this->responseJson(1, __('site.nodataincart'));
        }
        }

    // get distance bettween user and shop using latitude and longitude
    public function distance($lat1, $lon1, $lat2, $lon2)
    {

        if (($lat1 == $lat2) && ($lon1 == $lon2)) {
            return 1;
        } else {
            $theta = $lon1 - $lon2;
            $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
            $dist = acos($dist);
            $dist = rad2deg($dist);
            $dist = $dist * 60 * 1.1515 * 1.609344;

            return ($dist);
        }
    }

    // add carts with items in database
    public function addCart(Request $request)
    {
        $rule = [

            'products' => 'required',
        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);
        }
        $ordersArray = [];
        $notFoundProducts = collect();

        foreach ($request['products'] as $product) {
            $shopId = $product['shop_id'];
            $productId = $product['product'];
            $cartProduct = Cart::where('product_id', $productId)
                    ->where('shop_id', $shopId)
                    ->where('user_id', Auth::id())
                    ->first();

            if ($cartProduct != null && $cartProduct->exists) {
                $vatsId = [];
                   if (isset($product['variants'])) {
                foreach ($product['variants'] as $vat) {

                    $vatId = $vat['variant_id'];
                    array_push($vatsId, $vatId);

                }
                   }
  
                $cartOptions = Cart_product_option::where('product_id', $productId)
                    ->where('cart_id', $cartProduct->id)
                    ->whereIn('variant_id', $vatsId)
                    ->get();

                if (isset($cartOptions) && !$cartOptions->isEmpty()) {
                    $qty = $cartProduct->quantity + $product['quantity'];

                } else {
                    $qty = $product['quantity'];

                }
            } else {
                $qty = $product['quantity'];
            }
            //   $qty = $product['quantity'];
            $shopProduct = ShopProduct::where('shop_id', $shopId)
                ->where('product_id', $productId)
                ->first();

            //get distance bettween users and shops

            $lat1 = $request->latitude;
            $lon1 = $request->longitude;
            $lat2 = Shop::find($shopId)->latitude;
            $lon2 = Shop::find($shopId)->longitude;

            $distance = round($this->distance($lat1, $lon1, $lat2, $lon2));

            $cost = DeliveryCost::where('min_distance', '<=', $distance)->where('max_distance', '>=', $distance)->first();

            //check cost from table deliverycost
            if ($cost) {

                //checked product is exits in database
                if ($shopProduct
                    && $shopProduct->quantity >= $qty) {

                    if (isset($cartOptions) && !$cartOptions->isEmpty()) {

                        //$cartProduct->quantity = $qty;
                        
                 $carts = Cart::updateOrCreate(['product_id' => $productId,'user_id' => Auth::id(),'shop_id' => $shopId],[

                        'product_id' => $productId,
                        'quantity' => $qty,
                        'user_id' => Auth::id(),
                        'shop_id' => $shopId,
                    ]);

                    } else {

                        $carts = Cart::create([

                            'product_id' => $productId,
                            'quantity' => $product['quantity'],
                            'user_id' => Auth::id(),
                            'shop_id' => $shopId,
                        ]);
                    }

                 //   if (!empty($product['variants'])) {
                   if (isset($product['variants'])) {

                        foreach ($product['variants'] as $variant) {
                            
                            $option_id = Variant::where('id', $variant['variant_id'])->first()->option_id;
                            if (isset($cartOptions) && !$cartOptions->isEmpty()) {

                                $cart = Cart_product_option::updateOrCreate(['product_id' => $productId, 'variant_id' => $variant['variant_id'], 'cart_id' => $carts->id, 'option_id' => $option_id], ['product_id' => $productId, 'option_id' => $option_id, 'cart_id' => $carts->id, 'variant_id' => $variant['variant_id']
                                ]);
                            } else {
                                $cart = Cart_product_option::create(['product_id' => $productId, 'option_id' => $option_id, 'cart_id' => $carts->id, 'variant_id' => $variant['variant_id']]);

                            }

                        }

                    }

                    array_push($ordersArray, $carts);

                } else {
                    // checked product not found in tables and show message
                    $notFoundProducts->push($productId);
                }

            } else {

                return $this->responseJson(1, __('site.deliverycostnotavailable'));
            }

        }

        if (count($notFoundProducts) > 0) {

            return $this->responseJson(1, __('site.productnotavailable'));
        }

        // checked product is same shops and mall                                                                                                                                                                                          s or not



        foreach ($ordersArray as $value)
        
    {

        $shopchecked = Deliverycalculator::where('user_id', $value->user_id)->where('shop_id', $value->shop_id)->first();
        $mall_id = Shop::find($value->shop_id)->mall_id;
         if($shopchecked){
                    $dataDelivery= Deliverycalculator::updateOrCreate(['shop_id' => $value->shop_id, 'user_id' => $value->user_id],['shop_id' => $value->shop_id, 'user_id' => $value->user_id,
                    'latitude' => $request->latitude, 'longitude' => $request->longitude, 'cost' => $distance * $cost->price,
                    'mall_id' => $mall_id, 'cart_id' => $value->id, 'distance' => $distance]); 
             
         }else{
            $deliverychecked = Deliverycalculator::where('user_id', $value->user_id)->where('mall_id', $mall_id)->first(); 
            if($deliverychecked){
                
                 $dataDelivery= Deliverycalculator::updateOrCreate(['mall_id' => $mall_id, 'user_id' => $value->user_id],['shop_id' => $value->shop_id, 'user_id' => $value->user_id,
                    'latitude' => $request->latitude, 'longitude' => $request->longitude, 'cost' => $distance * $cost->price,
                    'mall_id' => $mall_id, 'cart_id' => $value->id, 'distance' => $distance]); 
            }
            else{
               $dataDelivery= Deliverycalculator::create(['shop_id' => $value->shop_id, 'user_id' => $value->user_id,
                    'latitude' =>$request->latitude, 'longitude' => $request->longitude, 'cost' => $distance * $cost->price,
                    'mall_id' => $mall_id, 'cart_id' => $value->id, 'distance' => $distance]);   
                
            }
             
         }

                    
             
                    
             DeliveryRelation::create(['deliverycalculator_id' => $dataDelivery->id,'cart_id' => $value->id]);
    }       
      //  deliveryCalculator
        // if ($shopchecked) {
        //     $count = $shopchecked->count + 1;
        //     $shopchecked->update(['count' => $count]);

        // } else {
                                             
        //     $deliverychecked = Deliverycalculator::where('user_id', $value->user_id)->where('mall_id', $mall_id)->first();
        //     if ($deliverychecked) {
        //         $count = $deliverychecked->count + 1;
        //         $deliverychecked->update(['count' => $count]);

        //     } else {

            //     Deliverycalculator::create(['shop_id' => $value->shop_id, 'user_id' => $value->user_id,
            //         'latitude' => $request->latitude, 'longitude' => $request->longitude, 'cost' => $distance * $cost->price,
            //         'mall_id' => $mall_id, 'cart_id' => $value->id, 'distance' => $distance]);
            // }

        // }

        return $this->responseJson(1, __('site.messages.success'), $dataDelivery);
    }

    // delete item from carts
    public function deleteCart(Request $request)
    {
        $rule = [
            'id' => 'required|exists:carts,id',

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        $delivery = Deliverycalculator::where('cart_id', $request->id)->first();
      $carts = Cart::where('id', $request->id)->first();

      //  if ($delivery->count == 0) {
 

    $deliveryrelation=DB::table('delivery_relation')->where('cart_id', $request->id)->delete();


           

            $cart = Cart::where('id', $request->id)->delete();

            $carts = Cart_product_option::where('cart_id', $request->id)->delete();

        // } else {
        //     $count = $delivery->count - 1;
        //     $delivery->update(['count' => $count]);

        // }
        return $this->responseJson(1, __('site.messages.success'));


    }

    // show items id cart using user authications
    public function showCart()
    {
        $carts = Cart::where('user_id', Auth::id())->with('variants')->get();


        if ($carts->isEmpty()) {
            return response()->json(['status' => 1, 'message' => __('site.no_data_product')]);


        } else {


            $total = 0;
            $subtotal = 0;


            foreach ($carts as $cart) {

                $productId = $cart['product_id'];

                $product = Product::where('id', $productId)->first();

                $shop = Shop::where('id', $cart['shop_id'])->first();

                $quantity = $cart['quantity'];

                $productchekeds = ShopProduct::where('shop_id', $cart['shop_id'])->where('product_id', $productId)->first();

// cheked quantity in carts with shopid and productid
                if ($productchekeds->quantity >= $quantity) {

                    if ($product->discount_price > 0) {
                        $subtot = (($product->discount_price + $product->variants()) * $quantity) / (1 + $shop->vat / 100);
                        $sum = ($product->discount_price + $product->variants()) * $quantity;
                    } else {
                        $subtot = (($product->price + $product->variants()) * $quantity) / (1 + $shop->vat / 100);
                        $sum = ($product->price + $product->variants()) * $quantity;
                    }

                    $total += $sum;
                    $subtotal += $subtot;
                    $cart = CartResource::collection($carts);


                } else {

                    Favorite::create(['product_id' => $productId, 'user_id' => Auth::id()]);
                    return response()->json(['status' => 1, 'message' => __('site.productAddfavourirte')]);


                }

            }
// get total and subtotal in carts

            $data = array("total" => $total, 'subtotal' => $subtotal);


            return response()->json(['status' => 1, 'message' => __('site.messages.success'), 'cart' => $data, 'cart_details' => $cart]);
        }

    }
}
