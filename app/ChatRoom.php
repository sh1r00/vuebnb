<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ChatRoom extends Model
{
    protected $fillable = [
        'room_type', 'user_ids'
    ];

    /**
     * 
     * Get the message of a chat room
     * 
     */

     public function messages()
     {
         return $this->hasMany('App\Message', 'chat_room_id')->with('sender');
     }
}
