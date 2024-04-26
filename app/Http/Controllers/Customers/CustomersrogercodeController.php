<?php

namespace App\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customers\Customersrogercode;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class CustomersrogercodeController extends Controller
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
        //$customers= Customersrogercode::all();
        return view('customers.index' );  
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
                'nombres' => 'required',
                'rut' => 'required',
                'telefono' => 'required',
                'direccion' => 'required',
                'email' => 'required',
                'estado' => 'required',
            ];
            $messages = [
                'id.required' => 'El id es requerido',
                'nombres.required' => 'El nombre es requerido',
                'rut.required' => 'El rut es requerido',
                'telefono.required' => 'El telefono es requerido',
                'direccion.required' => 'La direccion es requerido',
                'email.required' => 'El email es requerido',
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
                $cliente = Customersrogercode::find($request->id);
                $cliente->nombres= $request->nombres;
                $cliente->rut= $request->rut;
                $cliente->telefono= $request->telefono;
                $cliente->direccion= $request->direccion;
                $cliente->email= $request->email;
                $cliente->estado = $request->estado; 
                $cliente->save();
            }else{
                $cliente = new Customersrogercode();
                $cliente->user_id = $id_user;
                $cliente->nombres= $request->nombres;
                $cliente->rut= $request->rut;
                $cliente->telefono= $request->telefono;
                $cliente->direccion= $request->direccion;
                $cliente->email= $request->email;
                $cliente->estado = true; 
                $cliente->save();
            }
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
        //$customers= Customersrogercode::select('nombres','telefono')->get();
        if ($request->ajax()) {
            //$data = Customersrogercode::select('id','nombres','telefono','email','estado','created_at')->get();
            //$data = Customersrogercode::all();
            $data = Customersrogercode::orderBy('id','desc');
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
                    <li><a class="dropdown-item" href="#"><i class="bi bi-trash"></i>Eliminar</a></li>
                  </ul>
                    ';
                    return $btn;
                })
                ->rawColumns(['status','date','action'])
                ->make(true);
        }

    }

    public function getById(Request $request) {
        if ($request->ajax()) {
            $customer = Customersrogercode::find($request->id);
            return response()->json($customer);
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
