<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Models\PaymentMethod;
use Illuminate\Http\Request;
use App\Models\Address;
use App\Models\Order;


class PaymentController extends Controller
{
    // show list of paymentmethods 
    public function showPaymentmethod()
    {

        $data = PaymentMethod::get();

        return $this->responseJson(1, __('site.messages.success'), $data);


    }
    // add paymentrequest
    public function paymentRequest(Request $request)
    {
        $order_id = $request->input('order_id');
        $payment = PaymentMethod::find($request->input('payment_type'));
        $mobile = $request->input('mobile');//---------------required for stc pay only-------

     

        //-----------------first get order information ----------------------------------------
        if (!$order_id)
        
         return $this->responseJson(0, __('site.order not found'));


        $order = Order::find($order_id);
        if($order){
                $amount = $order->total;
                $address_id = $order->address_id;
        }else{
                    
         return $this->responseJson(0, __('site.order not found'));

        }

       
       
          //-------------------secound get user address information ------------------------------

        $address = Address::find($address_id);
        if ($address) {
            $country     = $address->country;
            $city        = $address->city;
            $state       = $address->state;
            $postal_code = $address->postal_code;
            $street = $address->street;
            $phone = $address->phone;  
            $fullname = $address->first_name;
            $last_name = $address->last_name;

        } else {
                     return $this->responseJson(0,__('site.address not found'));
        }
      //----------------third get payment Method information ------------------------------------
        if (!$payment)
         return $this->responseJson(0,__('site.Payment Method doesnot exist'));

        $brand      = $payment->code;
        $entityId   = $payment->entity_id;
        $secret_key = $payment->secret_key;



        $email = auth('api')->user()->email;

        //------------------------------------------------------------------
        $url = "https://oppwa.com/v1/checkouts";
        $data = "entityId=$entityId" .
            "&amount=$amount" .
            "&currency=SAR" .
            "&paymentType=DB";
        $data .= "&billing.street1=$street" .
            "&billing.city=$city" .
            "&billing.state=$state" .
            "&billing.country=SA" . // $country
            "&billing.postcode=$postal_code" .
            "&customer.givenName=$fullname" .
            "&customer.surname=$last_name" .
            "&customer.email=$email" .
            "&merchantTransactionId=" .$order_id;
        // print_r($data);die();
       
        if($brand === "STCPAY"){
            if (!$mobile)
           return $this->responseJson(0, __('site.mobile  doesnot exist'));

            $data .="&customParameters[SHOPPER_payment_mode]=mobile";
            $data .= "&customer.mobile=$mobile"; // STCPAY mobile number 05xxxxxxxx
        }

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Authorization:Bearer ' . $secret_key
        ));
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true); // this should be set to true in production
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $responseData = curl_exec($ch);
        if (curl_errno($ch)) {
            return curl_error($ch);
        }
        curl_close($ch);
        // TODO:: update in order table set payment_type value
        
        
      $order=Order::find($request->input('order_id'));
      $order->update(['payment_type'=>$request->input('payment_type')]);
  $responseData= json_decode($responseData);
   
    return $this->responseJson(1,__('site.messages.success'),$responseData);

 
    }

    // checked payment status 
    public function paymentStatus(Request $request)
    {

        $id = $request->checkout_id;
        $brand = $request->payment_type;
     
        if ($id == NULL || $brand == NULL) {
                return $this->responseJson(0,__('site.Please enter all mandatory fields'));
        }

        $payment    = PaymentMethod::find($brand);
        $brand      = $payment->code;
        $entityId   = $payment->entity_id;
        $secret_key = $payment->secret_key;

        $url = "https://oppwa.com/v1/checkouts/" . $id . "/payment";
        $url .= "?entityId=$entityId";

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Authorization:Bearer ' . $secret_key
        ));
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // this should be set to true in production
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $responseData = curl_exec($ch);
        if (curl_errno($ch)) {
            $result =  'Error:' . curl_error($ch);
           return $this->responseJson(1,__('site.messages.success'),$result);

           
        }
        curl_close($ch);
        
        //-----------------check payment status from response code ------------------------------------------
        $data = json_decode($responseData);
        
        $code = $this->checkPayment($data->result->code);
        if ($code === "successful")
            $payment_status = "PAID";
        else 
            $payment_status = "NOT_PAID";

       $order=Order::find($request->input('order_id'));
       
      $order->update(['payment_status'=>$payment_status]);

           // todo::update payment status in orders table;
                      return $this->responseJson(1,__('site.messages.success'),$payment_status);



    }
   // check payment
    protected function checkPayment($code){
        $successRegExp = ("(000\.000\.|000\.100\.1|000\.[36]|000\.400\.0[^3]|000\.400\.[0-1]{2}0)");
        $pendingRegExp = ("(000\.200|800\.400\.5|100\.400\.500)");
           // $code = "000.400.090";
       
           if (preg_match($successRegExp,$code)) {
               return "successful";
           } else if (preg_match($pendingRegExp,$code)) {
               return "pending";
           } else {
               return "rejected";

       
           }
    }
}
