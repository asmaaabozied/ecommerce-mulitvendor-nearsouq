<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;

use App\Http\Resources\AddressResource;
use App\Http\Resources\UserResource;
use App\Models\Address;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;
use Validator;
use Carbon\Carbon;
use Lang;
use LaravelLocalization;
use App\User;
use DB;
use Mail;

use Illuminate\Support\Facades\Hash;
use App\PasswordReset;


class AuthController extends Controller
{


    public function __construct()
    {
        $local = (!empty(Request()->route())) ? (Request()->route()->parameters()['locale']) : 'en';
        LaravelLocalization::setLocale($local);
    }


    function responseJson($status, $message, $data = null)
    {

        $response = [

            'status' => $status,

            'message' => $message,

            'data' => $data


        ];

        return response()->json($response);


    }

    //update profile in auth user 
    public function updateprofile(Request $request)
    {

        $rule = [
            'email' => 'max:254|email|required',
            'name' => 'required',
            'phone' => 'required|min:9',
//            'address' => 'required',
//            'password' => 'required'
        ];
        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        $user = User::findorfail(Auth::id());

        if ($request->hasFile('image')) {
            $picture_name = 'uploads' . '/' . time() . str_shuffle('abcdef') . '.' . $request->file('image')->getClientOriginalExtension();
            Image::make($request->file('image'))->save(public_path("$picture_name"));
            $request->request->set('image', $picture_name);
            $user->image = $picture_name;
        }//end if

        $user->name = isset($request->name) ? $request->name : $user->name;
        $user->email = isset($request->email) ? $request->email : $user->email;
        $user->phone = isset($request->phone) ? $request->phone : $user->phone;
//        $user->address = isset($request->address) ? $request->address : $user->address;
        $user->password = bcrypt($request->password);

        $user->save();
        $users = new UserResource($user);
        return $this->responseJson(1, __('site.messages.opertaion_success'), $users);


    }
   //show profile in auth user 
     public function showprofile()
    {

        $users = Auth::user();
        $user = new UserResource($users);

        return $this->responseJson(1, __('site.messages.success'), $user);


    }

   // signin logout in auth user 
    public function logout()
    {
        $user = auth()->user()->token()->revoke();


        return $this->responseJson(1, __('site.messages.success'), $user);


    }

    // reset password in auth user 
    public function resetpassword(Request $request)
    {

        $rule = [
            'phone' => 'required',
        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        $user = User::where('phone', $request->phone)->first();
        if ($user) {
            $code = rand(111111, 999999);
            $update = $user->update(['code' => $code]);
            if ($update) {
                $sms = __('site.messages.user_Verified') . $code;

                $this->sendSms($request->phone, $sms);


                return $this->responseJson(1, __('site.messages.checkemail'));
            } else {
                return $this->responseJson(0, _('site.messages.error'));
            }
        } else {
            return $this->responseJson(0, __('site.messages.invalidemail'));
        }


    }

   // send sms 
    public function sendSms($phone, $body)
    {

        if ($phone == NULL || $body == NULL) {
            return response(['error' => '1', 'msg' => 'Please enter all mandatory fields']);
        }


        $body = urlencode($body);
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, "http://basic.unifonic.com/wrapper/sendSMS.php?userid=nearsouq2@gmail.com&password=nearsouq123AA1$&msg=$body&to=$phone&sender=Near%20Souq&encoding=UTF8");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");


        $headers = array();
        $headers[] = "Accept: application/json";
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $result = curl_exec($ch);
        if (curl_errno($ch)) {
            $result = 'Error:' . curl_error($ch);
            return response(['error' => '1', 'msg' => $result]);
        }
        curl_close($ch);
        return response(['error' => '0', 'msg' => $result]);

    }
   //chanage password 
    public function changepassword(Request $request)
    {

        $user = Auth::user();


        $rule = [
            'old_password' => 'required',
            'new_password' => 'required|different:password',

        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }
        if (Hash::check($request->input('old_password'), $user->password)) {
            $user->fill([
                'password' => Hash::make($request->new_password)
            ])->save();
            return $this->responseJson(1, __('site.messages.resetpassword'));
        } else {
            return $this->responseJson(0, __('site.messages.error'));
        }


    }

   // sign in user register in applications
    public function register(Request $request)
    {

        $rule = [
            'email' => 'max:254|unique:users|email|required',
            'name' => 'required',
            'phone' => 'required|min:9',
//            'address' => 'required',
            'password' => 'required',
            'c_password' => 'required_with:password|same:password',
        ];
        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }


        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,

            'password' => bcrypt($request->password),
        ]);

        $user->save();


        $token = $user->createToken('MyApp')->accessToken;

        return $this->responseJson(1, __('site.messages.opertaion_success'),


            ['token' => $token, 'data' => $user]

        );
    }

   // login user with email and password  
    public function login(Request $request)
    {

        $rule = [
            'email' => 'required',
            'password' => 'required',


        ];

        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        $password = $request->password;
        $email = $request->email;

        if (Auth::attempt(['email' => $email, 'password' => $password])) {
            $user = Auth::user();
            $users = new UserResource($user);
            $token = $user->createToken('MyApp')->accessToken;
            return $this->responseJson(1, __('site.messages.opertaion_success'), ['token' => $token, 'user' => $users]
            );


        } else {
            return $this->responseJson(0, __('site.messages.user_loginInvalid'));

        }

    }
   // user can add address to user auth 
    public function addAddress(Request $request)
    {
        $rule = [
            'first_name' => 'required',
            'last_name' => 'required',
            'phone' => 'required|min:10',
            'comment' => 'required',
            'longitude' => 'required',
            'latitude' => 'required',
            'default_address' => 'required'

        ];
        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        // $user = auth()->user();

        // $user->name = isset($request->name) ? $request->name : $user->name;
        // $user->phone = isset($request->phone) ? $request->phone : $user->phone;
        // $user->last_name = isset($request->last_name) ? $request->last_name : $user->last_name;
        // $user->save();
        
            //================Delete previous default addresses====================
            

            
        //================Delete previous default addresses====================
        if($request->default_address === "TRUE"){
            $values = Address::where('default_address',  '=', "TRUE")->where('user_id', '=', Auth::id())->update(['default_address'=>"FALSE"]);
        }

        $data = Address::create([
            'user_id' => Auth::id(),
            'first_name' =>  $request->first_name,
            'last_name' =>  $request->last_name,
            'comment' => $request->comment,
            'longitude' => $request->longitude,
            'latitude' => $request->latitude,
            'city' => $request->city,
            'state' => $request->state,
            'country' => $request->country,
            'postal_code' => $request->postal_code,
            'street' => $request->street,
            'type' => $request->type,
            'phone' => $request->phone,
            'default_address'=> $request->default_address


        ]);
        

        return $this->responseJson(1, __('site.messages.success'), $data);

    }
   // user can update address to user auth 
    public function updateAddress(Request $request)
    {
        $rule = [
            'address_id' => 'required',
            'first_name' => 'required',
            'last_name' => 'required',
            'phone' => 'required|min:10',
            'comment' => 'required',
            'longitude' => 'required',
            'latitude' => 'required',
            'default_address' => 'required'

        ];
        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }

        //================Delete previous default addresses====================
        if($request->default_address === "TRUE"){
            $values = Address::where('default_address',  '=', "TRUE")->where('user_id', '=', Auth::id())->update(['default_address'=>"FALSE"]);
        }

        $data = Address::updateOrCreate(['user_id' => Auth::id(),
            'id'=> $request->address_id], [
            'user_id' => Auth::id(),
            'first_name' =>  $request->first_name,
            'last_name' =>  $request->last_name,
            'comment' => $request->comment,
            'longitude' => $request->longitude,
            'latitude' => $request->latitude,
            'city' => $request->city,
            'state' => $request->state,
            'country' => $request->country,
            'postal_code' => $request->postal_code,
            'street' => $request->street,
            'type' => $request->type,
            'phone' => $request->phone,
            'default_address'=> $request->default_address
        ]);

        return $this->responseJson(1, __('site.messages.success'), $data);

    }
    // show all address to user auth 
    public function showAddress()
    {
        $addresses = Address::where('user_id', Auth::id())->with('user')->get();

        $addresse = AddressResource::collection($addresses);

        return $this->responseJson(1, __('site.messages.success'), $addresse);
    }
    
    
    // delete address from address to user auth 
    public function deleteAddress(Request $request)
    {
        $rule = [
            'address_id' => 'required',
        ];
        $customMessages = [
            'required' => __('validation.attributes.required'),
        ];

        $validator = validator()->make($request->all(), $rule, $customMessages);

        if ($validator->fails()) {

            return response()->json(['status' => 422, 'message' => validationErrorsToString($validator->errors())], 422);

        }
        
        $deleted = Address::where('id', $request->address_id)->delete();
        if($deleted){
             return $this->responseJson(1, __('site.messages.success'), $deleted);
        }else{
               return $this->responseJson(1, __('site.messages.transaction_failed'), $deleted);
        }

    }  
 


}
