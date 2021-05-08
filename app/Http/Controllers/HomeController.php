<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hole;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $all_holes = Hole::all();
        
        return view('home', array('all_holes' => $all_holes));
    }
}
