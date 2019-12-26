<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ListingItem extends Model
{
    protected $fillable = [
        'id', 'listing_id', 'title', 'description', 'strain', 'price_per_gram', 'price_per_eigth', 'price_per_quarter', 'price_per_half', 'price_per_ounce'
    ];
}
