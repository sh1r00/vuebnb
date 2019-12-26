<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\User::class, function (Faker\Generator $faker) {
    static $password;

    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'password' => $password ?: $password = bcrypt('secret'),
        'remember_token' => str_random(10),
    ];
});

$factory->define(App\ListingItem::class, function (Faker\Generator $faker) {
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
