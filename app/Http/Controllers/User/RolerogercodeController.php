<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Permission\Models\Role;
use App\Permission\Models\Permission;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\Gate;

class RolerogercodeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('hasAccess','role.index');

        $modul_caja = Permission::where([['section','modulo_caja'],['status',1]])->get();//->toArray();
        $permission_caja = Permission::where([['section','caja'],['status',1]])->get();//->toArray();
        $modul_products = Permission::where([['section','modulo_productos'],['status',1]])->get();//->toArray();
        $permission_products = Permission::where([['section','productos'],['status',1]])->get();//->toArray();
        $modul_cotizacion = Permission::where([['section','modulo_cotizaciones'],['status',1]])->get();//->toArray();
        $permission_cotizacion = Permission::where([['section','cotizacion'],['status',1]])->get();//->toArray();
        $modul_ventas = Permission::where([['section','modulo_ventas'],['status',1]])->get();//->toArray();
        $permission_ventas = Permission::where([['section','ventas'],['status',1]])->get();//->toArray();
        $modul_compras = Permission::where([['section','modulo_compras'],['status',1]])->get();//->toArray();
        $permission_compras = Permission::where([['section','compras'],['status',1]])->get();//->toArray();
        $modul_usuarios = Permission::where([['section','modulo_usuarios'],['status',1]])->get();//->toArray();
        $permission_usuarios = Permission::where([['section','usuarios'],['status',1]])->get();//->toArray();
        $modul_reportes = Permission::where([['section','modulo_reportes'],['status',1]])->get();//->toArray();
        $permission_reportes = Permission::where([['section','reportes'],['status',1]])->get();//->toArray();
        $permission_clientes = Permission::where([['section','clientes'],['status',1]])->get();//->toArray();
        $permission_proveedores = permission::where([['section','proveedores'],['status',1]])->get();//->toarray();
        $permission_configuracion = permission::where([['section','configuracion'],['status',1]])->get();//->toarray();
        return view('admin.role.index',compact(
        'modul_caja',
        'permission_caja',
        'modul_products',
        'permission_products',
        'modul_cotizacion',
        'permission_cotizacion',
        'modul_ventas',
        'permission_ventas',
        'modul_compras',
        'permission_compras',
        'modul_usuarios',
        'permission_usuarios',
        'modul_reportes',
        'permission_reportes',
        'permission_clientes',
        'permission_proveedores',
        'permission_configuracion',
        ));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $rules = [];
            if ($request->id > 0) {
                $rules = [
                    'id'=>'required',
                    'name'=>'required|max:50|unique:roles,name,'.$request->id,
                    'full-access'=>'required|in:yes,no'
                ];
            }else{
                $rules = [
                    'id'=>'required',
                    'name'=>'required|max:50|unique:roles,name',
                    'full-access'=>'required|in:yes,no'
                ];
            }
            $messages = [
                'id.required' => 'El id rol es requerido',
                'name.required' => 'EL nombre es requerido',
                'name.max' => 'EL nombre excede los 50 caracteres',
                'name.unique' => 'El nombre debe ser unico. Ya existe',
                'full-access.required' => 'El tipo de acceso es requerido'
            ];
            $validator = Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 0,
                    "message" => $validator->errors()->all(),
                ]);
            }
            $msg = "";
            if ($request->id > 0) {
                //$role->update($request->all());
                //$role = Role::update($request->all());
                //$role = Role::where('id', $request->id)->update($request->all());
                $role = Role::find($request->id);
                $role->update($request->all());
                //$role->name = $request->name; 
                //$role['full-access'] = $request['full-access']; 
                //$role->save();
                $role->permissions()->sync($request->get('permission'));
                $msg = "Exito. El Rol se actualizo con exito";

            }else{
                $role = Role::create($request->all());
                if ($request->get('full-access') == 'no') {
                    $role->permissions()->sync($request->get('permission'));
                }
                $msg = "Exito. El Rol se genero con exito";
            }
            
            return response()->json([
                'status' => 1,
                'message'=> $msg
            ]);
        } catch (\Throwable $th) {
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                "data"=> $th,
                'error' => (array) $m,
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        if ($request->ajax()) {
            $data = Role::where('status',true)->orderBy('id','desc')->get();
            return Datatables::of($data)->addIndexColumn()
                ->addColumn('status', function($data){
                    if ($data->status == 1) {
                        $status = '<span class="badge bg-success">Activo</span>';
                    }else{
                        $status= '<span class="badge bg-danger">Inactivo</span>';
                    }
                    return $status;
                })
                ->addColumn('date', function($data){
                    $date = Carbon::parse($data->created_at);
                     $onlyDate = $date->toDateString();
                    return $onlyDate;
                })
                ->addColumn('action', function($data){
                    //$btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm">View</a>';
                    $btn = '
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots-vertical"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li><button class="dropdown-item" type="button" onclick="showRole('.$data->id.');"><i class="bi bi-eye"></i>Ver</button></li>
                    <li><button class="dropdown-item" type="button" onclick="EditarRole('.$data->id.');"><i class="bi bi-pen"></i>Editar</button></li>
                    <li><button class="dropdown-item" type="button" disabled><i class="bi bi-trash"></i>Eliminar</button></li>
                  </ul>
                    ';
                    return $btn;
                })
                ->rawColumns(['status','date','action'])
                ->make(true);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $roleId = $request->id; 
        $role = Role::findOrFail($roleId);

        $permissions = $role->permissions;
        $permission_role = [];
        foreach ($permissions as $permission) {
            $permission_role[] = $permission->id;
        }
        $permissionsAll = Permission::get();

        return response()->json([
            'status' => 1,
            'request' => $request->id,
            'permissions' => $permission_role,
            'role' => $role,
            'permissionsAll' => $permissionsAll,
            'message'=> "Exito. El Rol se genero con exito"
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
