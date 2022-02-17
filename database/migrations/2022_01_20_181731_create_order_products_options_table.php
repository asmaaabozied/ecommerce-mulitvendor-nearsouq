<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderProductsOptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_products_options', function (Blueprint $table) {
            $table->id();
            $table->integer('variant_id')->nullable();
            $table->integer('option_id')->nullable();
            $table->integer('order_detail_id')->nullable();
            $table->string('extra_price')->nullable();
            $table->string('option_name_ar')->nullable();
            $table->string('option_name_en')->nullable();
            $table->string('variant_name_ar')->nullable();
            $table->string('variant_name_en')->nullable();
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
        Schema::dropIfExists('order_products_options');
    }
}
