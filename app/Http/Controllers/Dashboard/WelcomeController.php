<?php

namespace App\Http\Controllers\Dashboard;

use App\Category;
use App\User;
// use App\Supplier;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;


class WelcomeController extends Controller
{
    public function index()
    {
        $categories_count = 0;
        $products_count = 0;
        $clients_count = 0;
      //  $users_count = User::whereRoleIs('admin')->count();
       $users_count = User::count();
       $suppliers_count = 0;
       $orders_count = 0;
       $orders_suppliers_count =0;
$stadium=0;
        // $sales_data = Order::select(
        //     DB::raw('YEAR(created_at) as year'),
        //     DB::raw('MONTH(created_at) as month'),
        //     DB::raw('SUM(total_price) as sum')
        // )->groupBy('month')->get();

        return view('dashboard.welcome', compact('categories_count', 'products_count', 'clients_count', 'users_count','suppliers_count','orders_suppliers_count','orders_count','stadium'));

    }//end of index

}//end of controller
