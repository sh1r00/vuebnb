<?php

use Illuminate\Database\Seeder;

class ListingItemsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $listingItem = factory(App\ListingItem::class, 1000)->create();
    }
}

/**
 * 
* [
*    'listing_id' => $this->getRandomListingId()
*    
* private function getRandomListingID() {
* $listing = \App\Listing::inRandomOrder()->first();
* return $listing->id;
* }
* ]

 */