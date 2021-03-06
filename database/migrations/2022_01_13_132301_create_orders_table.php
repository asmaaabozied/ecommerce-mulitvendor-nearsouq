<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('status')->nullable();
            $table->string('payment_type')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('capon_id')->nullable();
            $table->integer('address_id')->nullable();
            $table->date('date')->nullable();
            $table->string('qrcode')->nullable();
             $table->string('delivery_cost')->nullable();
             $table->string('delivery_distance_in_km')->nullable();
            $table->string('total')->nullable();
            $table->string('subtotal')->nullable();
            $table->enum('payment_status', ['PAID', 'NOT_PAID'])->nullable();
            $table->string('bill_number')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->userstamps();
            $table->softUserstamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
