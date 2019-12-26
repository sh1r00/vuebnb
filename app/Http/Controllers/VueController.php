<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VueController extends Controller
{
    public function vue_routes()
    {
        return view('inner')->where('vue-capture', '[\/\w\.-]*');
    }
}
