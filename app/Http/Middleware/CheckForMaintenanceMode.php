<?php namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Http\Request;

class CheckForMaintenanceMode
{
	   protected $request;
	   protected $app;
	
    public function __construct(Application $app, Request $request)
    {
         $this->app = $app;
         $this->request = $request;
    }
	
    public function handle($request, Closure $next)
    {

        $ip = $this->request->getClientIp();
        $allowed = array('27.251.192.2', '27.251.192.3', '27.251.192.4');

        if($this->app->isDownForMaintenance() && !in_array($ip, $allowed)) {
                return \Response::view($this->global->theme_folder.'.maintenance', [], 503);
        }

        return $next($request);
    }
}