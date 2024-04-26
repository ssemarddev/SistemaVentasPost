<?php

namespace App\Http\Controllers\Shopping;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shopping\Providersrogercode;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ProvidersrogercodeController extends Controller
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
        return view('shopping.providers.index');  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        try {
            $rules = [
                'id' => 'required',
                'nombre_empresa' => 'required',
                'rut' => 'required',
                'telefono' => 'required',
                'vendedor' => 'required',
                'correo' => 'required',
                'direccion' => 'required',
                'nombre_banco' => 'required',
                'tipo_cuenta' => 'required',
                'numero_cuenta' => 'required',
                'estado' => 'required',
            ];
            $messages = [
                'id.required' => 'El id es requerido',
                'nombre_empresa.required' => 'El nombre es requerido',
                'rut.required' => 'El rut es requerido',
                'telefono.required' => 'El telefono es requerido',
                'direccion.required' => 'La direccion es requerido',
                'vendedor.required' => 'El representante es requerido',
                'correo.required' => 'El email es requerido',
                'nombre_banco.required' => 'El nombre del banco es requerido',
                'tipo_cuenta.required' => 'El tipo de cuenta es requerido',
                'numero_cuenta.required' => 'El numero de cuenta es requerido',
                'estado.required' => 'El estado es requerido',
            ];
            
            $validator = Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 0,
                    "message" => "Ocurrio un error",
                    "errores" => $validator->errors()->all(),
                ]);
            }
            $id_user = Auth::user()->id;
            if ($request->id>0) { 
                $proveedor= Providersrogercode::find($request->id);
                $proveedor->nombre_empresa= $request->nombre_empresa; 
                $proveedor->rut= $request->rut;
                $proveedor->telefono= $request->telefono;
                $proveedor->vendedor= $request->vendedor;
                $proveedor->correo= $request->correo;
                $proveedor->direccion= $request->direccion;
                $proveedor->nombre_banco= $request->nombre_banco;
                $proveedor->tipo_cuenta= $request->tipo_cuenta;
                $proveedor->numero_cuenta= $request->numero_cuenta; 
                $proveedor->estado = $request->estado; 
                $proveedor->save();
            }else {
                $proveedor = new Providersrogercode(); 
                $proveedor->user_id = $id_user;
                $proveedor->nombre_empresa= $request->nombre_empresa; 
                $proveedor->rut= $request->rut;
                $proveedor->telefono= $request->telefono;
                $proveedor->vendedor= $request->vendedor;
                $proveedor->correo= $request->correo;
                $proveedor->direccion= $request->direccion;
                $proveedor->nombre_banco= $request->nombre_banco;
                $proveedor->tipo_cuenta= $request->tipo_cuenta;
                $proveedor->numero_cuenta= $request->numero_cuenta; 
                $proveedor->estado = true; 
                $proveedor->save();
            }
            //return redirect()->back();
            return response()->json([
                "status" => 1,
                "message" => "Exito. Se guardo corectamente el cliente"
            ]);
        } catch (\Throwable $th) {
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                'error' => (array) $m,
            ]);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
            $data = Providersrogercode::orderBy('id','desc');
            return Datatables::of($data)->addIndexColumn()
                ->addColumn('status', function($data){
                    if ($data->estado == 1) {
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
                    <li><a class="dropdown-item" type="button" onclick="Editar('.$data->id.');"><i class="bi bi-pen"></i>Editar</a></li>
                    <li><a class="dropdown-item" type="button" onclick="showDetailProvider('.$data->id.');"><i class="bi bi-eye"></i>Ver</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-trash"></i>Eliminar</a></li>
                  </ul>
                    ';
                    return $btn;
                })
                ->rawColumns(['status','date','action'])
                ->make(true);
        }
    }

    public function getById(Request $request) 
    {
        if ($request->ajax()) {
            $provider = Providersrogercode::find($request->id);
            return response()->json($provider);
        }
    }

    public function showByIdProvider($id)
    {   
        try {
            $provider = Providersrogercode::find($id);
            return response()->json($provider);
        } catch (\Throwable $th) {
            //throw $th;
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
