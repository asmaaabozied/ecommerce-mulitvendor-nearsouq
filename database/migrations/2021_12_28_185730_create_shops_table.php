<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShopsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shops', function (Blueprint $table) {
            $table->id();
            $table->string('name_ar')->nullable();
            $table->string('name_en')->nullable();
            $table->string('phone')->nullable();
            $table->string('mobilephone')->nullable();
            $table->string('address')->nullable();
            $table->string('image')->nullable();

            $table->string('desc_ar')->nullable();
            $table->string('desc_en')->nullable();
            $table->string('commission')->nullable();
            $table->string('vat')->nullable();
            $table->string('mall_id')->nullable();
            $table->string('category_id')->nullable();
            $table->string('vat_no')->nullable();
            $table->enum('published', ['TRUE', 'FALSE'])->nullable();
            $table->string('vat_img')->nullable();
            $table->string('commerical_img')->nullable();

            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->enum('type', ['main', 'branch'])->nullable();

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
        Schema::dropIfExists('shops');
    }
}
