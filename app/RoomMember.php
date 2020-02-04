<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RoomMember extends Model
{
    public $timestamps = false;

    protected $fillable = [
        'chat_room_id', 'user_ids'
    ];

    /**
     * 
     * Get the sender of the message
     * 
     */

     public function chatRoom()
     {
         return $this->belongsTo('App\ChatRoom');
     }

     public function getUserIdsAttribute($value)
     {
         return unserialized($value);
     }

     public function scopeMembers($query)
     {
         return $query->where('avtive', 1);
     }
}
