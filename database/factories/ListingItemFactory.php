<?php

use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/


$factory->define(App\ListingItem::class, function (Faker $faker) {
    return [
        'listing_id' => $faker->randomDigitNotNull,
        'title' => $faker->unique()->words(2, true),
        'description' => $faker->text(50),
        'strain' => $faker->randomElement($array = array('indica')),
        'price_per_gram' => $faker->randomDigitNotNull,
        'price_per_eigth' => $faker->randomDigitNotNull,
        'price_per_quarter' => $faker->randomDigitNotNull,
        'price_per_half' => $faker->randomDigitNotNull,
        'price_per_ounce' => $faker->randomDigitNotNull,
    ];
});
