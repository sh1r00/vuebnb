<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateListingItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('listing_items', function (Blueprint $table) {
            $table->integer('user_id')->unsigned();
            $table->increments('id');
            $table->integer('listing_id')->unsigned();
            $table->string('title');
            $table->string('description');
            $table->string('strain');
            
            // Prices
            $table->string('price_per_gram')->nullable();
            $table->string('price_per_eigth')->nullable();
            $table->string('price_per_quarter')->nullable();
            $table->string('price_per_half')->nullable();
            $table->string('price_per_ounce')->nullable();

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
        Schema::dropIfExists('listing_items');
    }
}
