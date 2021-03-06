<?php

namespace App\Http\Controllers;

use App\Classes\Reply;
use App\Http\Requests\CustomFields\DeleteRequest;
use App\Http\Requests\CustomFields\IndexRequest;
use App\Http\Requests\CustomFields\StoreRequest;
use App\Models\User;
use Yajra\DataTables\Facades\DataTables;

class CustomFieldsController extends UserBaseController
{
    /**
     * Display a listing of the resource.
     * @param IndexRequest $request
     * @return \Illuminate\Contracts\View\View
     */

    public function index(IndexRequest $request)
    {
        $this->pageTitle = trans('menu.custom_fields');
        return \View::make($this->global->theme_folder.'.custom-fields.index', $this->data);
    }

    /**
     * @param IndexRequest $request
     * @return mixed
     */
    public function getFields(IndexRequest $request)
    {
        $permissions = \DB::table('custom_fields')->select('id', 'label', 'name', 'type', 'values', 'required');
        $data = Datatables::of($permissions)
            ->editColumn(
                'values',
                function ($row) {
                    $ul = '<ul>';

                    if (isset($row->values)) {
                        foreach (json_decode($row->values) as $key => $value) {
                            $ul .= '<li>' . $value . '</li>';
                        }

                    }

                    $ul .= '</ul>';

                    return $ul;
                }
            )
            ->editColumn(
                'required',
                function ($row) {
                    // Edit Button
                    $string = ' - ';
                    $class  = 'label bg-red label-danger disabled color-palette';

                    if ($row->required === 'yes') {
                        $string = '<span class="' . $class . '">' . $row->required . '</span>';
                    }

                    return $string;
                }
            )
            ->addColumn(
                'action',
                function ($row) {
                    // Edit Button
                    $class = $this->global->theme_folder == 'admin-lte' ? 'bg-' : '';
                    /*$string = '<a style="margin: 1px;" href="javascript:;" onclick="editModal('.$row->id.')" class="btn  margin-top-10 btn-sm  '.$class.'purple"><i class="fa fa-edit"></i> Edit</a> ';*/
                    // Delete Button
                    $msg = trans('messages.deleteConfirm', ['name' => $row->name]);
                    $string = '<a style="margin: 1px;" href="javascript:;" onclick="knap.deleteAlert(\'custom-fields\',\''.addslashes($msg).'\','.$row->id.')"  class="btn btn-danger margin-top-10 btn-sm  ' . $class . 'red"><i class="fa fa-trash"></i> Delete</a>';

                    return $string;
                }
            )
             ->rawColumns(['action','required','values'])
            ->make(true);
        return $data;
    }

    /**
     * @return \Illuminate\Contracts\View\View
     */
    public function create()
    {
        $this->icon = 'plus';

        return \View::make($this->global->theme_folder.'.custom-fields.create-edit', $this->data);
    }

    /**
     * @param StoreRequest $request
     * @return array
     */
    public function store(StoreRequest $request)
    {
        \DB::beginTransaction();
        $user = new User();
        $groupID = \DB::table('custom_field_groups')
            ->where('model', 'App\Models\User')
            ->select('id')
            ->first()->id;

        $group = [
            'fields' => [
                [
                    'name'     => $request->get('name'),
                    'groupID'  => $groupID,
                    'label'    => $request->get('label'),
                    'type'     => $request->get('type'),
                    'required' => $request->get('required'),
                    'values'   => $request->get('value'),
                ]
            ],

        ];
        $user->addCustomField($group);
        \DB::commit();
        return Reply::success('messages.customFieldCreateSuccess');
    }

    /**
     * @param $id
     * @return \Illuminate\Contracts\View\View
     */
    public function edit($id)
    {
        $this->iconEdit = 'pencil';
        $this->editUser = User::find($id)->withCustomFields();

        // Call the same create view for edit
        return $this->create();
    }

    /**
     * @param DeleteRequest $request
     * @param $id
     * @return array
     */
    public function destroy(DeleteRequest $request, $id)
    {
        \DB::table('custom_fields')->delete($id);
        return Reply::success('messages.deleteSuccess');
    }

}
