<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChatController extends Controller
{
    public function show()
    {
        $htmlContent = file_get_contents('/var/www/resources/views/test.html');
        return response($htmlContent)->header('Content-Type', 'text/html');
    }
}
