<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\MallResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ShopResource;
use App\Models\category;
use App\Models\Mall;
use App\Models\Product;
use App\Models\Shop;
use App\Http\Resources\ProductCategoryResource;
use App\Models\VisitorProduct;
use App\User;
use Illuminate\Http\Request;
use DB;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function home(Request $request)
    {


        $latitude = $request->input('latitude');
        $longitude = $request->input('longitude');
        $user = Auth::guard('api')->user();


        if (!empty($latitude || $longitude)) {


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
                ->orderBy('distance', 'ASC')
                ->havingRaw('distance < ?', [1500])
                ->where('published', '=', 'TRUE')
                ->where(DB::raw("(SELECT COUNT(*)  as product_count  from shop_products where shop_products.shop_id = shops.id )"), '>', 0)
                ->paginate(10);

            $mall = Mall::query()
                ->select('malls.*'
                    , DB::raw("ROUND(111.045 * DEGREES(ACOS(COS(RADIANS('$longitude'))
                            * COS(RADIANS(longitude))
                            * COS(RADIANS(latitude)
                            - RADIANS('$latitude'))
                            + SIN(RADIANS('$longitude'))
                            * SIN(RADIANS(longitude)))) ,2)
                            as distance"))
                ->groupBy("malls.id")
                ->orderBy('distance', 'ASC')
                ->where('visible', '=', 1)
                ->where(DB::raw("(SELECT COUNT(*)  as mall_count  from shops where shops.mall_id = malls.id )"), '>', 0)
                ->havingRaw('distance < ?', [1500])
                ->paginate(10);
        } else {

            $mall = Mall::where('visible', '=', 1)->paginate(10);


            $shop = Shop::where('published', '=', 'TRUE')->paginate(10);

        }


        if (Auth::guard('api')->user()) {

            $product = $this->paginate($user->productWatch);
            $productrecommand = $this->paginate($user->productWatch);


            $products = $user->products;
            $productss = ProductCategoryResource::collection($products);


        } else {
            $product = [];
            $productss = [];
            $seen_count = VisitorProduct::max('seen_count');
            $category_id = VisitorProduct::where('seen_count', $seen_count)->first()->category_id;

            $productrecommand = Product::where('category_id', $category_id)->paginate(10);

        }


        $products = ProductCategoryResource::collection($product);
        $productrecommands = ProductCategoryResource::collection($productrecommand);
        $prodss = ProductCategoryResource::collection(Product::paginate(10));


        $malls = MallResource::collection($mall);

        $shops = ShopResource::collection($shop);

        $categories = category::all();



        $items = CategoryResource::collection($categories);
    return response()->json(['status' => 1, 'message' => __('site.messages.success'), 'categories' => $categories, 'malls' => $malls, 'shops' => $shops, 'products' => $prodss, 'visitorproduct' => $products, 'favourite' => $productss, 'productrecommand' => $productrecommand]);


    }


    public function paginate($items, $perPage = 5, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }

}
