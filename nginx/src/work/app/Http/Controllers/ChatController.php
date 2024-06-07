<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Chat;

class ChatController extends Controller
{
    public function index()
    {
        $htmlContent = file_get_contents('/var/www/resources/views/test.html');
        return response($htmlContent)->header('Content-Type', 'text/html');
    }

    public function submit(Request $request)
    {
        $chat = new Chat;
        $chat->user_id = '1';
        $chat->send_user_id = '2';
        $chat->comment = $request->input('text');
        $chat->save();

        $text = $request->input('text');

        return response()->json(['text' => $text]);
    }

    public function show()
    {
        return Chat::all();
    }
}
