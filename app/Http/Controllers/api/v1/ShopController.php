<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;

use App\Http\Resources\DetailShopResource;

use App\Http\Resources\CategoryResource;
use App\Http\Resources\ShopResource;
use App\Models\category;
use App\Models\Shop;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Validator;
use Lang;
use LaravelLocalization;
use DB;
use Mail;

use Geographical;

class ShopController extends Controller
{


    public function __construct()
    {
        $local = (!empty(Request()->route())) ? (Request()->route()->parameters()['locale']) : 'en';
        LaravelLocalization::setLocale($local);
    }

    // get latitude and longitude to shops  
    public function index(Request $request)
    {
        $latitude = $request->input('latitude');
        $longitude = $request->input('longitude');
       $operation = $request->input('operation');
       


                
        if (!empty($latitude && $longitude)) {
    //=====================General SQL Query to get shops according distance========== 
              $sql = Shop::query()
                ->select('shops.*'
                    , DB::raw("ROUND(111.045 * DEGREES(ACOS(COS(RADIANS('$longitude'))
                            * COS(RADIANS(longitude))
                            * COS(RADIANS(latitude)
                            - RADIANS('$latitude'))
                            + SIN(RADIANS('$longitude'))
                            * SIN(RADIANS(longitude)))) ,2)
                            as distance"))
                // ->groupBy("shops.id")
                // ->orderBy('distance', 'ASC')
                ->where('published', '=', 'TRUE')
                ->where(DB::raw("(SELECT COUNT(*)  as product_count  from shop_products where shop_products.shop_id = shops.id )"), '>', 0)
                ->havingRaw('distance < ?', [1500]);


        } else {
            $shop = Shop::where('published', '=', 'TRUE')->paginate(10);

        }
        
              //===================get Nearest shops=====================================================
          if($operation === 'nearest') {

                 $shop =$sql
                    ->orderBy('distance', 'ASC')
                    ->paginate(10);

          }
                //===================get shops by rating=================================================

              elseif ($operation === 'rating'){
                  
                    $shop =$sql
                    ->withCount([
                      
                        'ratings as rating_avg' => function ($query) {
                                $query->select(DB::raw('coalesce(avg(rate), 0)'));
                            }
                        ])
                    ->orderBy('rating_avg', 'DESC')
                   ->paginate(10);   
              }
              
              
                   //===================search in shops====================================================
            else if ($operation === 'search'){
                $keyword = $request->input('keyword');
                $shop =$sql
                      ->where('name_ar', 'like', '%' . $keyword . '%')
                      ->orWhere('name_en', 'like', '%' . $keyword . '%')
                      ->orWhere('desc_ar', 'like', '%' . $keyword . '%')
                      ->orWhere('desc_en', 'like', '%' . $keyword . '%')
                      ->orWhere('address', 'like', '%' . $keyword . '%')
                     ->orderBy('distance', 'ASC')
                     ->paginate(10);
                
            }
                   //===================search in shops by categories=======================================

             else if ($operation === 'category'){
                       
                $category_id = $request->input('category_id');
                $shop =$sql
                      ->where('category_id', '=',$category_id)
                     ->orderBy('distance', 'ASC')
                     ->paginate(10);
                
            }
               else{
                 $shop =$sql
                    ->orderBy('distance', 'ASC')
                    ->paginate(10); 
                
            }

        $shops = ShopResource::collection($shop);

        return $this->responseJson(1, __('site.messages.success'), $shops);

    }



//  public function index(Request $request)
//     {
//         $latitude = $request->latitude;
//         $longitude = $request->longitude;

//         $shops = DB::select("SELECT
//                                     ROUND(111.045 * DEGREES(ACOS(COS(RADIANS('$longitude'))
//                                     * COS(RADIANS(shops.longitude))
//                                     * COS(RADIANS(shops.latitude)
//                                     - RADIANS('$latitude'))
//                                     + SIN(RADIANS('$longitude'))
//                                     * SIN(RADIANS(shops.longitude)))) ,2)
//                                     AS distance_in_km,
//                                     shops.*,
//                                     malls.name_ar as mall_name_ar, malls.name_en as mall_name_en,
//                                     categories.name_ar as category_name_ar, categories.name_en as category_name_en

//                                     FROM shops
//                                     LEFT join malls ON shops.mall_id=malls.id
//                                     LEFT join categories ON categories.id=shops.category_id

//                                  	where shops.published ='TRUE'

//                                  	HAVING(distance_in_km <= 1500)

//                                       ORDER BY distance_in_km ASC");


//         $shops = ShopResource::collection($shops);

//         return $this->responseJson(1, __('site.messages.success'), $shops);

//     }

     // show details shop 

    public function showshop(Request $request)
    {

        $rule = [
            'id' => 'required|exists:shops,id',

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        $shop = Shop::find($request->id);

        $shops = new DetailShopResource($shop);


        return $this->responseJson(1, __('site.messages.success'), $shops);


    }

    // get all categories 
    public function getCategories()
    {


        $categories = category::all();

        $items = CategoryResource::collection($categories);

        return $this->responseJson(1, __('site.messages.success'), $items);

    }


}
