<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;

use App\Http\Resources\ProductResource;
use App\Http\Resources\ProductCategoryResource;
use App\Http\Resources\OfferProductResource;
use App\Http\Resources\ShopResource;
use App\Models\Product;
use App\Models\Shop;
use App\Models\Cart;
use App\Models\ProductRating;
use App\Models\VisitorProduct;
use App\Models\ShopProduct;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;


class ProductController extends Controller
{

// // show offerProduct

//       public function offerProduct(Request $request){
    
    
//             $latitude = $request->input('latitude');
//         $longitude = $request->input('longitude');

//         if (!empty($latitude && $longitude)) {
//             $shop = Shop::query()
//                 ->select('shops.*'
//                     , DB::raw("ROUND(111.045 * DEGREES(ACOS(COS(RADIANS('$longitude'))
//                             * COS(RADIANS(longitude))
//                             * COS(RADIANS(latitude)
//                             - RADIANS('$latitude'))
//                             + SIN(RADIANS('$longitude'))
//                             * SIN(RADIANS(longitude)))) ,2)
//                             as distance"))
//                 ->groupBy("shops.id")
//                 ->orderBy('distance', 'ASC')
//                 ->havingRaw('distance < ?', [1500])
//                 ->where('published', '=', 'TRUE')
//                 ->where(DB::raw("(SELECT COUNT(*)  as product_count  from shop_products where shop_products.shop_id = shops.id )"), '>', 0)
               

//                 ->paginate(10);
// $shop = collect($shop);
//  $flattened = $shop->flatMap(function ($product,$key) {
//         return $product;
    
// });
 
// return $flattened->values()->all();;
        
//         } else {
//             $shop = Shop::where('published', '=', 'TRUE')->paginate(10);

//         }

//         $shops = OfferProductResource::collection($shop->OfferProducts);

//         return $this->responseJson(1, __('site.messages.success'), $shops);
    
    
    
//       }


// show offerProduct

      public function offerProduct(Request $request){
    
    
    $latitude = $request->input('latitude');
        
        
    $longitude = $request->input('longitude');

        if (!empty($latitude && $longitude)) {
            $product = Product::query()
                ->select('shops.id as shop_id',
                    'products.*'
                    , DB::raw("ROUND(111.045 * DEGREES(ACOS(COS(RADIANS('$longitude'))
                            * COS(RADIANS(longitude))
                            * COS(RADIANS(latitude)
                            - RADIANS('$latitude'))
                            + SIN(RADIANS('$longitude'))
                            * SIN(RADIANS(longitude)))) ,2)
                            as distance"))
                ->join('shop_products', 'shop_products.product_id', '=', 'products.id')
                ->join('shops', 'shops.id', '=', 'shop_products.shop_id')
                ->orderBy('distance', 'ASC')
                ->havingRaw('distance < ?', [1500])
                ->where('shop_products.published', '=', 'TRUE')
                ->where('shop_products.quantity', '>', '0')
                ->where('products.discount_price', '<', 'products.price')
                ->whereNotNull('products.discount_price')
                ->paginate(10);
          
        }
        
                        $products = OfferProductResource::collection($product);
                        
                        return $this->responseJson(1, __('site.messages.success'), $products);
                    
    
    
       }

     // show product rating 
    public function showRating(Request $request)
    {

        $rule = [
            'product_id' => 'required|exists:products,id'


        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }


        $product_id = $request->input('product_id');

        $ratings = ProductRating::where('product_id', $product_id)->latest()->get();

        return $this->responseJson(1, __('site.messages.success'), $ratings);


    }

    // add rating to products 
    public function addRating(Request $request)
    {

        $rule = [
            'product_id' => 'required|exists:products,id',
            'rate' => 'required',
            'comment' => 'required'

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }


        $product_id = $request->input('product_id');

        $image = Product::where('id', $product_id)->first()->image;

        $ratings = ProductRating::create([


            'product_id' => $product_id,

            'rate' => $request->input('rate'),
            'comment' => $request->input('comment'),
            'image' => $image,
            'user_id' => Auth::id()


        ]);

        return $this->responseJson(1, __('site.messages.success'), $ratings);


    }

     // add quantity to cart
    public function addQuantity(Request $request)
    {
        $rule = [
            'cart_id' => 'required|exists:carts,id',
            'quantity' => 'required'

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        $cart = Cart::find($request->cart_id);
        $quantity=ShopProduct::where('shop_id',$cart->shop_id)->where('product_id',$cart->product_id)->first()->quantity;
        if ($cart->exists
            && $quantity >= $request->quantity) {
            $cart->update(['quantity' => $request->quantity]);

        } else {

            return $this->responseJson(1, __('site.productnotavailable'));

        }

        return $this->responseJson(1, __('site.messages.success'), $cart);

    }
     // show product with categories 
    public function showProductWithCategories(Request $request)
    {

        $rule = [
            'category_id' => 'required|exists:categories,id',

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }
        $product = Product::where('category_id', $request->category_id)->where('published', '=', 'TRUE')->paginate(10);

        $products = ProductCategoryResource::collection($product);

        return $this->responseJson(1, __('site.messages.success'), $products);

    }

    // show product(details)
    public function showProduct(Request $request)
    {
        $rule = [
            'id' => 'required|exists:products,id',

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }
        $user_id = Auth::guard('api')->id();
        $product_id = $request->id;
        $category_id = Product::where('id', $product_id)->first()->category_id;
        $product = VisitorProduct::where('product_id', $product_id)->where('user_id', $user_id)->first();
        if ($product) {
            $prod = $product->seen_count;
            $count = $prod + 1;

        } else {
            $count = 1;
        }

        VisitorProduct::updateOrCreate(['product_id' => $product_id, 'user_id' => $user_id],
            ['product_id' => $product_id, 'user_id' => $user_id, 'category_id' => $category_id, 'seen_count' => $count]);
        $data = ['user_id' => $user_id, 'product_id' => $product_id, 'category_id' => $category_id, 'count' => $count];

        $product = Product::where('id', $request->id)->first();
        $latitude = $request->input('latitude');
        $longitude = $request->input('longitude');

        if (!empty($latitude && $longitude)) {
            $shop = Shop::query()
                ->select('shops.*'
                    , DB::raw("ROUND(111.045 * DEGREES(ACOS(COS(RADIANS('$longitude'))
                            * COS(RADIANS(longitude))
                            * COS(RADIANS(latitude)
                            - RADIANS('$latitude'))
                            + SIN(RADIANS('$longitude'))
                            * SIN(RADIANS(longitude)))) ,2)
                            as distance"))
                ->groupBy("shops.id")
//                ->where('published', '=', 'TRUE')
                ->orderBy('distance', 'ASC')
                ->havingRaw('distance < ?', [1500])
                ->join('shop_products', 'shop_products.shop_id', '=', 'shops.id')
                ->where("shop_products.product_id", $product_id)
                ->where(DB::raw("(SELECT COUNT(*)  as product_count  from shop_products where shop_products.shop_id = shops.id )"), '>', 0)
                ->paginate(5);


        } else {


            $shop = $this->paginate($product->Shops);


        }
        $shops = ShopResource::collection($shop);


        $products = new ProductResource($product);

        return response()->json(['status' => 1, 'message' => __('site.messages.success'), 'product' => $products, 'shops' => $shops]);


    }
    // add visitor from here
    public function AddVisitorProduct(Request $request)
    {
        $user_id = Auth::id();

        $product_id = $request->input('product_id');

        $category_id = Product::where('id', $product_id)->first()->category_id;

        $product = VisitorProduct::where('product_id', $product_id)->where('user_id', $user_id)->first();

        if ($product) {
            $prod = $product->seen_count;
            $count = $prod + 1;

        } else {
            $count = 1;
        }


        VisitorProduct::updateOrCreate(['product_id' => $product_id, 'user_id' => $user_id],
            ['product_id' => $product_id, 'user_id' => $user_id, 'category_id' => $category_id, 'seen_count' => $count]);
        $data = ['user_id' => $user_id, 'product_id' => $product_id, 'category_id' => $category_id, 'count' => $count];

        return $this->responseJson(1, __('site.messages.success'), $data);


    }
    // get paginate 
    public function paginate($items, $perPage = 5, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }

   // add favourite products 
    public function AddFavouriteProduct(Request $request)
    {


        $rule = [
            'product_id' => 'required|exists:products,id',

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }
        $user_id = Auth::id();

        $users = auth()->user();


        $user = $users->products()->toggle($request->product_id);

        return $this->responseJson(1, __('site.messages.success'), $user);


    }

    // show product favourite 
    public function ShowFavouriteProduct()
    {


        $user_id = Auth::id();

        $users = User::find($user_id);


        $product = $users->products;


        $products = ProductResource::collection($product);


        return $this->responseJson(1, __('site.messages.success'), $products);


    }

}
