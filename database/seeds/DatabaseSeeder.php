<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call(ListingItemsTableSeeder::class);
        $this->call(ListingsTableSeeder::class);
        $this->call(UsersTableSeeder::class);
    }
}
