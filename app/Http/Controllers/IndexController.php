<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IndexController extends Controller
{
    //

	public function api(){

		return \File::get(public_path(). "/frontend/index.html");

	}


}
