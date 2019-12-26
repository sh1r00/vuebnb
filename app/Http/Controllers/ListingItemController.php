<?php

namespace App\Http\Controllers;

use App\ListingItem;
use Illuminate\Http\Request;

class ListingItemController extends Controller
{
    
    public function fetchAll($listing)
    {
        $listingItems = ListingItem::where('listing_id', $listing)->get();
        return response()->json($listingItems);
    }

    public function index(Request $request)
    {
        $listingItem = ListingItem::create($request->all());
        return response()->json($listingItem, 201);

    }
}
