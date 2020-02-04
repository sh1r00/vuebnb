<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'ListingController@get_home_web');

Route::get('/saved', 'ListingController@get_home_web')->middleware('auth');

Route::get('/listings/{listing}', 'ListingController@get_listing_web');

Route::post('/listingCreate', 'ListingController@store_listing');

Route::post('/listingItemCreate/{listing_id}', 'ListingItemController@index');

Route::get('/chat', 'ChatsController@index');

Route::get('/chat/messages/{chatroom}', 'ChatsController@index');

Route::post('/chat/messages/{chatroom}', 'ChatsController@store');

Route::post('/user/toggle_saved', 'UserController@toggle_saved')
  ->middleware('auth')
;

Route::get('/register', 'Auth\RegisterController@showRegistrationForm');

Route::get('/login', 'Auth\LoginController@showLoginForm');

Route::get('/listings/{listing_id}', 'ListingController@view_listing');

Route::get('/comments/{listing_id}', 'CommentController@index');

Route::post('/comments', 'CommentController@store');

Route::post('/comments/{commentId}/{type}', 'CommentController@update');

Auth::routes();

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/{vue-capture?}', 'VueController@vue-routes');
