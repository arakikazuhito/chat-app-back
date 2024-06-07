<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChatController extends Controller
{
    public function show()
    {
        $htmlContent = file_get_contents(resource_path('views/test.html'));
        return response($htmlContent)->header('Content-Type', 'text/html');
    }
}
