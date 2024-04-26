<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\Gate;

class UserrogercodeController extends Controller
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
        Gate::authorize('hasAccess','usuario.index');
        $roles = DB::table('roles')
        ->where('status','=',1)
        ->get();
        return view('admin.user.index', compact('roles')); //,compact('users','roles'));
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
            $rules = [
                'name'=>'required',
                'usuario'=>'required',
                'email'=>'required|email|unique:App\Models\User,email',
                'npassword'=>'required|min:8',
                'cpassword'=>'required|same:npassword',
                'rol'=>'required'
            ];

            $messages = [
                'name.required'=>'Su nombre es requerido',
                'usuario.required'=>'Su usuario es requerido',
                'email.required'=>'Su correo electronico es requerido',
                'email.email'=>'El formato de su correo electronico es invalido',
                'email.unique'=>'Ya existe un usuario registrado con este correo',
                'npassword.required'=>'Por favor escriba una contraseña',
                'npassword.min'=>'La contraseña debe de contener al menos 8 caracteres',
                'cpassword.required'=>'Es necesario confirmar el contraseña',
                'cpassword.min'=>'La confirmación de la contraseña debe de tener al menos 8 caracteres',
                'cpassword.same'=>'Las contraseñas no coinciden',
                'rol.required'=>'Necesitas seleccionar un rol para el usuario',
            ];
            
            $validator = Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 0,
                    'message'=> $validator->errors()->all(),
                ]);
            }
            
            $user = new User;
            $user->name = e($request->input('name'));
            $user->usuario = e($request->input('usuario'));
            $user->email = e($request->input('email'));
            $user->password = Hash::make($request->input('npassword'));
            $user->status = true;
            $user->save();
            /**RELATIONS USERS WITH ROLES*/
            $user->roles()->sync($request->get('rol'));

            return response()->json([
                'status' => 1,
                'message'=> "Exito. Se registro el usuario con exito"
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
            $data = DB::table('users')
            ->join('role_user', 'users.id', '=', 'role_user.user_id')
            ->join('roles', 'role_user.role_id', '=', 'roles.id')
            ->select('users.*', 'roles.name AS role_name', 'roles.full-access as acceso')
            ->get();
            //dd($data);
            //$data = User::where('status',true)->orderBy('id','desc')->get();
            return Datatables::of($data)->addIndexColumn()
                ->addColumn('status', function($data){
                    if ($data->status == 1) {
                        $status = '<span class="badge bg-success">Activo</span>';
                    }else{
                        $status= '<span class="badge bg-danger">Inactivo</span>';
                    }
                    return $status;
                })
                ->addColumn('useraccess', function($data){
                    if ($data->acceso == 'yes') {
                        $accessstatus = '<span class="badge bg-secondary">'.$data->acceso.'</span>';
                    }else{
                        $accessstatus= '<span class="badge bg-warning">'.$data->acceso.'</span>';
                    }
                    return $accessstatus;
                })
                ->addColumn('rolename', function($data){
                    $role = '<span class="badge bg-primary">'.$data->role_name.'</span>';
                    return $role;
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
                        <li><button class="dropdown-item" type="button" onclick="changePassword('.$data->id.');"><i class="bi bi-key"></i>Cambiar contraseña</button></li>
                        <li><button class="dropdown-item" type="button" onclick="Editar('.$data->id.');" disabled><i class="bi bi-pen"></i>Editar</button></li>
                    </ul>
                    ';
                    return $btn;
                })
                ->rawColumns(['status','date','rolename','useraccess','action'])
                ->make(true);
        }
        
    }

    public function updatepassword(Request $request)
    {

        try {
            
            $rules = [
                'upassword'=>'required|min:8',
                'id_user_now'=>'required'
            ];
            $messages = [
                'upassword.required'=>'Por favor escriba una contraseña',
                'upassword.min'=>'La contraseña debe de contener al menos 8 caracteres',
                'id_user_now'=>'El usuario es necesario'
            ];

            $validator = Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 0,
                    'message' => $validator->errors()->all(),
                ]);
            }

            $id = e($request->input('id_user_now'));
            $user = User::findOrFail($id);
            $user->password = Hash::make($request->input('upassword'));
            if($user->save()) {
                return response()->json([
                    'status' => 1,
                    'message'=>'El password se actualizo con exito',
                ]);
            }
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
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
