
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span></button>
    <h4 class="modal-title">@if(isset($role->id)) @lang('menu.editRole')@else @lang('menu.addRole') @endif </h4>
</div>
{!!  Form::open(['url' => '','class'=>'form-horizontal' ,'autocomplete'=>'off','id'=>'add-edit-form']) 	 !!}
@if(isset($role->id)) <input type="hidden" name="_method" value="PUT"> @endif
<div class="modal-body">
    <div class="box-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">@lang('core.name')</label>

            <div class="col-sm-10">
                <input type="text" name="name" class="form-control"  placeholder="@lang('core.enterRoleName')" value="{{$role->name or ''}}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">@lang('core.displayName')</label>
            <div class="col-sm-10">
                <input type="text" name="display_name" class="form-control" placeholder="@lang('core.enterDisplayName')" value="{{$role->display_name or ''}}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">@lang('core.description')</label>
            <div class="col-sm-10">
                <textarea class="form-control" rows="3" name="description" placeholder="@lang('core.description')">{{$role->description or ''}}</textarea>
            </div>
        </div>

        <div class="form-group" id="permissions-box">
            <label class="col-sm-2 control-label">@lang('core.selectPermission')</label>
            <div class="col-sm-10">
                <ul class="list-unstyled">
                @foreach($permissions as $permission)
                   <li>
                    <span>
                         <input type="checkbox" id="id{{ $permission->id }}" value="{{ $permission->id }}" name="permission[{{ $permission->id }}]" class="minimal" @if(isset($perms) && in_array($permission->id, $perms)) checked @endif>
                         <span for="id{{ $permission->id }}" style="margin-left: 5px;margin-right:10px;font-size: 13px;">{{ $permission->display_name }}</span>
                    </span>
                    </li>
                @endforeach
                </ul>

            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button id="save" type="submit" class="btn btn-success" onclick="knap.addUpdate('roles', '{{$role->id or ''}}');return false">@lang('core.submit')</button>
    <button class="btn default" data-dismiss="modal" aria-hidden="true">@lang('core.close')</button>
</div>
{{Form::close()}}
