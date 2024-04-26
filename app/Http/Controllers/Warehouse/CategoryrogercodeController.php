<?php

namespace App\Http\Controllers\Warehouse;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use App\Models\Warehouse\Categoryrogercode;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class CategoryrogercodeController extends Controller
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
        
        return view('warehouse.category.index');  
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
                'nombre' => 'required',
                'estado' => 'required',
            ];
            $messages = [
                'id.required' => 'El id es requerido',
                'nombre.required' => 'El nombre es requerido',
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
            if ($request->id>0) { 
                $categ=  Categoryrogercode::find($request->id);
                $categ->nombre= $request->nombre;
                $categ->descripcion= $request->descripcion;
                $categ->estado = $request->estado;
                $categ->save();
            }else{
                $categ= new Categoryrogercode();
                $categ->nombre= $request->nombre;
                $categ->descripcion= $request->descripcion;
                $categ->estado = true;
                $categ->save();
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
            $data = Categoryrogercode::orderBy('id','desc');
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
            $provider = Categoryrogercode::find($request->id);
            return response()->json($provider);
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
