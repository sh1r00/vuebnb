<?php

namespace App\Http\Controllers;

use App\Message;
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
    public function index()
    {
        return view('chat');
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
