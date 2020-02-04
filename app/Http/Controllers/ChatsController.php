<?php

namespace App\Http\Controllers;

use App\user;
use App\Message;
use App\ChatRoom;
use App\Receiver;
use App\Events\MessageSent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ChatsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show chats
     * @return \Illuminate\Http\Response
     */
    public function index($receiverId)
    {
        $receiver = User::find($receiverId);
        $senderUserId = auth()->user()->id;
        $roomMembers = [$receiverId, $senderUserId];
        sort($roomMembers);
        $roomMembers = implode($roomMembers, ',');

        $chatRoom = ChatRoom::where('user_ids', $roomMembers)->first();
        if(is_null($chatRoom)) {
            $chatRoom = new ChatRoom;
            $chatRoom->room_type = 'private';
            $chatRoom->user_ids = $roomMembers;
            $chatRoom->save();
        }

        // return view('private-chat.form', compact('chatRoom', 'receiver'));
    }

    /**
     * Fetch all messages
     * 
     * @return Message
     */
    public function fetch_messages(){
        return Message::with('user')->get();
    }

    /**
     * Persist message to database
     * 
     * @param Request $request
     * @return Response
     */

     public function store(ChatRoom $chatRoom)
     {
         $senderId = auth()->user()->id;
         $roomMembers = collect(explode(',', $chatroom->user_ids));
         $roomMembers->forget($roomMembers->search($senderId));
         $receiverId = $roomMembers->first();

         $message = new Message;
         $message->chat_room_id = $chatroom->id;
         $message->sender_id = $senderId;
         $message->message = request('message');
         $message->save();

         $receiver = new Receiver;
         $receiver->message_id = $message->id;
         $receiver->receiver_id = $receiverId;

         if($receiver->save()) {
             $message = Message::with('sender')->find($message->id);
             broadcast(new MessageSent($message))->toOthers();
             return $message;
         }
     }
    public function send_message(Request $request)
    {
        $user = Auth::user();

        $message  = $user->messages()->create([
            'message' => $request->input('message')
        ]);

        broadcast(new MessageSent($user, $message))->toOthers();

        return ['status' => 'Message Sent!', 'status code' => 201];
    }
}
