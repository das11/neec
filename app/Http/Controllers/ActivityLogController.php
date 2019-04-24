<?php

namespace App\Http\Controllers;

use App\Http\Controllers\UserBaseController;
use App\Http\Requests\ActivityLog\IndexRequest;
use Spatie\Activitylog\Models\Activity;

use Carbon\Carbon;
use Yajra\DataTables\Facades\DataTables;

class ActivityLogController extends UserBaseController
{

     /**
	 * UserController constructor.
	 */
    public function __construct()
    {
        parent::__construct();
        $this->pageTitle = trans('menu.activityLog');
    }

    /**
     * @param IndexRequest $request
     * @return \Illuminate\Contracts\View\View
     */
    public function index(IndexRequest $request)
    {
        return \View::make($this->global->theme_folder.'.activity.index', $this->data);
    }

    /**
     * Get All Activity Logs
     * @param IndexRequest $request
     * @return
     */
    public function activityLog(IndexRequest $request)
    {
        $activities = Activity::select('id', 'text', 'created_at')
	        ->latest()->limit(100)->get();

        $data = Datatables::of($activities)

	        ->editColumn('created_at',
                function ($row)
		        {
                    return Carbon::parse($row->created_at)->toDayDateTimeString();
                }
	        )
            ->rawColumns(['text'])
	        ->make(true);
        return $data;
    }

}
