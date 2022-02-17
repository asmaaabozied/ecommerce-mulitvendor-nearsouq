<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeliverycalculatorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('delivery_calculators', function (Blueprint $table) {
            $table->id();
            $table->integer('cart_id')->nullable();
            $table->integer('shop_id')->nullable();
            $table->integer('mall_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->string('cost')->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('delivery_calculators');
    }
}
