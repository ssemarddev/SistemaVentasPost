<?php

namespace App\Http\Controllers\Sales;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customers\Customersrogercode;
use App\Models\Sales\Carritorogercode;
use App\Models\Sales\Quotationsrogercode;
use App\Models\Sales\Quotationsdetailrogercode;
use App\Models\Warehouse\Productsrogercode;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;
use App\Http\Controllers\Settings\settingsrogercodeController;
use Illuminate\Support\Facades\Gate;
//use Barryvdh\DomPDF\Facade\PDF;

class QuotationsrogercodeController extends Controller
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
        Gate::authorize('hasAccess','cotizacion_lista.index');
        return view('sales.quotations.index');
    }

    public function createnewquotation()
    {
        Gate::authorize('hasAccess','cotizacion.index');
        $id_user = Auth::user()->id;
        $productos = Productsrogercode::all();
        $clientes= Customersrogercode::all();
        $carrito = Carritorogercode::where('id_user',$id_user)->get();
        $codserie = Quotationsrogercode::where('tipo_registro',false)->max('serie');
        return view('sales.quotations.create',compact('productos','clientes','carrito', 'codserie'));  
    }

    public function create_carrito(Request $request)
    { 
        $id_user = Auth::user()->id;
        if ($request->ajax()) {
            //$carrito = Carritorogercode ::find($request->id);
            $carrito = Carritorogercode::firstWhere([['producto_id', (int)$request->id],['id_user',$id_user]]);
            if($carrito==null){ 
                $carrito = new Carritorogercode ();
                $carrito->id_user = $id_user;
                $carrito->producto_id = $request->id;
                $carrito->cod= $request->cod ;
                $carrito->nombre= $request->nombre ;
                $carrito->cantidad= $request->cantidad ;
                $carrito->descipcion= 'sd';
                $carrito->precio= $request->costo;
                $carrito->descuento=  0;
                $carrito->total= $request->total;
                $carrito->save();
            }else{
                $carrito=Carritorogercode ::find($request->id);
                $cantidad=$carrito->cantidad+ $request->cantidad;
                $subtotal= $cantidad*$request->costo; 
                $total= $subtotal-$carrito->descuento; 
                $carrito->cod= $request->cod;
                $carrito->id_user= $id_user;
                $carrito->nombre= $request->nombre;
                $carrito->cantidad= $cantidad;
                $carrito->descipcion='sd';
                $carrito->precio= $request->costo; 
                $carrito->total= $total;
                $carrito->save();
            }
            //$car = Carritorogercode ::all();
            $car = Carritorogercode::where('id_user',$id_user)->get();
            return response()->json($car); 
        }

        return response()->json($id_user); 
    }

    public function update_carrito(Request $request)
    {
        if ($request->ajax()) { 
            $id_user= Auth::user()->id;
            $carrito=Carritorogercode::find($request->id);
            $subtotsl=  $request->cantidad * $request->precio;  
            $total= $subtotsl;
            $carrito->cantidad = $request->cantidad;
            $carrito->precio =  $request->precio;   
            $carrito->total= $total;
            $carrito->save();   
            $car = Carritorogercode::where('id_user',$id_user)->get();
            return response()->json($car); 
        } 
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        try {
            $id_user= Auth::user()->id;
            $total = $request->total;
            if ($total == 0) {
                return response()->json([
                    'status'=>0,
                    "message" => "No tiene productos agregados para la cotizacion",
                ]);
            }
            DB::beginTransaction();
            $cotizacion = new Quotationsrogercode();
            $cotizacion->id_user= $id_user;
            $cotizacion->id_cliente= $request->id_cliente;
            $cotizacion->cod= 'COT';
            $cotizacion->serie= $request->serie; 
            $cotizacion->validez= $request->validez;
            $cotizacion->total= $total;
            $cotizacion->abono = $request->abono;
            $cotizacion->servicio= $request->servicio;
            $cotizacion->numero_cotizacion_manual = $request->numeroCotizacionManual;
            $cotizacion->estado= true;
            $cotizacion->tipo_registro= false;
            $cotizacion->save();

            $carrito= Carritorogercode ::where('id_user',$id_user)->get();
            $i=1;
            foreach ($carrito as $row) {  
                $detalle= new Quotationsdetailrogercode();
                $detalle->id_cotizacion = $cotizacion->id;
                $detalle->id_producto= $row->producto_id;
                $detalle->precio_venta= $row->precio;
                $detalle->cantidad= $row->cantidad;
                $detalle->descuento= $row->descuento;
                $detalle->total= $row->total;
                $detalle->item= $i;
                $detalle->save();
                $i++;
                $carr = Carritorogercode ::find($row->id);
                $carr->delete();
            }

            $datacliente = Customersrogercode::select('telefono', 'email')->where('id','=',$request->id_cliente)->get();
            $apagar = $request->total - $request->abono;

            DB::commit();

            return response()->json([
            'status' => 1,
            "message" => "Se realizo la cotizacion con exito",
            'id' => $cotizacion->id,
            'newserie' => $request->serie+1,
            'numcotizacion' => 'COT-'.$request->serie,
            'cod'=> 'COT-'.$request->serie+1,
            'totalcotizacion' => $request->total,
            'abonocotizacion'=>$request->abono,
            'apagarcotizacion' => $apagar,
            'apagarcotizacion' => $apagar,
            'datacustomer' => $datacliente
            ]); 
        
        } catch (\Throwable $th) {
            DB::rollback();
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                "data"=> $th,
                'error' => (array) $m
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
            $data = Productsrogercode::all();
            return Datatables::of($data)->addIndexColumn()
                ->addColumn('status', function($data){
                    if ($data->estado == 1) {
                        $status = '<span class="badge bg-success">Activo</span>';
                    }else{
                        $status= '<span class="badge bg-danger">Inactivo</span>';
                    }
                    return $status;
                })
                ->addColumn('pstock', function($data){
                    $stock= '<span class="badge bg-info">'.$data->stock.'</span>';
                    return $stock;
                })
                ->addColumn('pcant', function($data){
                    $cant= '<input type="number" class="form-control" id="cant'.$data->id.'" value="1">';
                    return $cant;
                })
                ->addColumn('precioventa', function($data){
                    $pventa = '$'.number_format($data->precio_venta, 0, ',', '.');
                    return $pventa;
                })
                ->addColumn('action', function($data){
                    //$btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm">View</a>';
                    //$btn = '<i onclick="Addcar('.$data->id.','."$data->codigo".','."$data->nombre".','.$data->precio_venta.');" class=" btn btn-success bi bi-plus"></i>';
                    $btn = '<i  id="addProd'.$data->id.'" onclick="Addcar('.$data->id.','."'$data->codigo'".','."'$data->nombre'".','.$data->precio_venta.');" class=" btn btn-success"><i class="bi bi-plus"></i></i>';
                    return $btn;
                })
                ->rawColumns(['status','pstock','precioventa','pcant','action'])
                ->make(true);
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
    public function destroy(Request $request)
    {
        $id_user = Auth::user()->id;
        $carrito = Carritorogercode::find($request->id);
        if ($carrito->delete()) {
            $car = Carritorogercode::where('id_user',$id_user)->get();
            return response()->json([
                "message" => "success",
                "carrito" => $car,
            ]);
        }else{
            return response()->json([
                "message" => "error",
                "data" => "No se elimino el registro",
            ]);
        }
    }

    public function showquotation(Request $request)
    {

        if ($request->ajax()) {
            $id_user = Auth::user()->id;
            $getAccessUser = new settingsrogercodeController();
            $access = $getAccessUser->getAccessRolUser($id_user);
            if ($access == 'yes') {
                $data = DB::table('cotizaciones')
                ->join('users', 'cotizaciones.id_user', '=', 'users.id')
                ->join('clientes', 'cotizaciones.id_cliente', '=', 'clientes.id')
                ->select('users.name as nomuser', 'clientes.nombres as nomcliente','cotizaciones.id as idcotizacion' ,'cotizaciones.serie as seriecotizacion' ,'cotizaciones.created_at as fechacotizacion','cotizaciones.total as totalcotizacion','cotizaciones.estado')
                ->where('cotizaciones.estado', true)->where('cotizaciones.tipo_registro', false)
                ->orderBy('idcotizacion','desc')
                ->get();
            }else{
                $data = DB::table('cotizaciones')
                ->join('users', 'cotizaciones.id_user', '=', 'users.id')
                ->join('clientes', 'cotizaciones.id_cliente', '=', 'clientes.id')
                ->select('users.name as nomuser', 'clientes.nombres as nomcliente','cotizaciones.id as idcotizacion' ,'cotizaciones.serie as seriecotizacion' ,'cotizaciones.created_at as fechacotizacion','cotizaciones.total as totalcotizacion','cotizaciones.estado')
                //->where('cotizaciones.estado', true)->where('cotizaciones.tipo_registro', false)
                ->where([['cotizaciones.estado',true],['cotizaciones.tipo_registro',false],['cotizaciones.id_user',$id_user]])
                ->orderBy('idcotizacion','desc')
                ->get();

            }
            return Datatables::of($data)->addIndexColumn()
                ->addColumn('status', function($data){
                    if ($data->estado == 1) {
                        $status = '<span class="badge bg-success">Activo</span>';
                    }else{
                        $status= '<span class="badge bg-danger">Inactivo</span>';
                    }
                    return $status;
                })
                ->addColumn('cotizaciontotal', function($data){
                    $total = '$'.number_format($data->totalcotizacion, 0, ',', '.');
                    return $total;
                })
                ->addColumn('date', function($data){
                    $date = Carbon::parse($data->fechacotizacion);
                     $onlyDate = $date->toDateString();
                    return $onlyDate;
                })
                ->addColumn('action', function($data){
                    //$btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm">View</a>';
                    $btn = '
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots-vertical"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li><a class="dropdown-item" type="button" onclick="verCotizacion('.$data->idcotizacion.');"><i class="bi bi-eye"></i>Ver</a></li>
                    <li><a class="dropdown-item" href="/quotation/print/'.$data->idcotizacion.'"><i class="bi bi-file-earmark-pdf"></i>Imprimir</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-trash"></i>Eliminar</a></li>
                  </ul>
                    ';
                    return $btn;
                })
                ->rawColumns(['status','date','cotizaciontotal','action'])
                ->make(true);
        }
    }

    public function showdetalle($id)
    {
        $getcotizacion = DB::table('cotizaciones')
        ->join('users', 'cotizaciones.id_user', '=', 'users.id')
        ->join('clientes', 'cotizaciones.id_cliente', '=', 'clientes.id')
        ->select('users.name as nomuser', 'clientes.nombres as nomcliente','cotizaciones.id as idcotizacion' ,'cotizaciones.serie as seriecotizacion','cotizaciones.created_at as fechacotizacion','cotizaciones.total as totalcotizacion','cotizaciones.estado','cotizaciones.cod','cotizaciones.numero_cotizacion_manual', 'cotizaciones.abono')
        ->where('cotizaciones.id','=', $id)
        ->get();
        $detalles=DB::table('detalles_cotizacion as dc')
        ->join('productos as p','dc.id_producto','=','p.id')
        ->select('p.nombre','dc.cantidad','dc.precio_venta','dc.total')
        ->where('dc.id_cotizacion','=',$id)
        ->get();
        //return response()->json(['result'=>$getventadetalle,'detalles'=>$detalles]);
        return response()->json([
            "cotizacion" => $getcotizacion,
            "detalle" => $detalles
        ]);
    }

    public function generatePdf($id)
    {
        $cotizacion = DB::table('cotizaciones')
        ->join('users', 'cotizaciones.id_user', '=', 'users.id')
        ->join('clientes', 'cotizaciones.id_cliente', '=', 'clientes.id')
        ->select('users.name as nomuser', 'clientes.nombres as nomcliente','clientes.direccion','clientes.telefono','clientes.email','cotizaciones.id as idcotizacion' ,'cotizaciones.serie as seriecotizacion' ,'cotizaciones.created_at as fechacotizacion','cotizaciones.total as totalcotizacion','cotizaciones.estado','cotizaciones.cod','cotizaciones.serie','cotizaciones.validez','cotizaciones.abono','cotizaciones.servicio')
        ->where('cotizaciones.id','=', $id)
        ->get();
        $detalle=DB::table('detalles_cotizacion as dc')
        ->join('productos as p','dc.id_producto','=','p.id')
        ->select('p.codigo', 'p.nombre','dc.cantidad','dc.precio_venta','dc.total')
        ->where('dc.id_cotizacion','=',$id)
        ->get();
        $vendedor = $cotizacion[0]->nomuser;
        $servicio = $cotizacion[0]->servicio;
        $totalcotizacion = $cotizacion[0]->totalcotizacion;
        $abonocotizacion = $cotizacion[0]->abono;
        $apagar = $totalcotizacion - $abonocotizacion;
        $numDays = $cotizacion[0]->validez;
        //$fechacot = $cotizacion[0]->fechacotizacion;
        //$date_end = $fechacot->subDays(5);  
        $current_date = new Carbon($cotizacion[0]->fechacotizacion);
        $date_format = $current_date->toDateString();
        $initial_date = new Carbon($date_format);
        $end_format = $initial_date->addDays($numDays)->toDateString();
        $transform_date = new carbon($end_format);
        $date_end= $transform_date->format('d-m-Y');
        //$pdf = PDF::loadView('pdf', compact('ventas', 'detalle'));
        $pdf = PDF::loadView('sales/quotations/pdfcotizacion', compact('id','cotizacion','detalle','totalcotizacion','abonocotizacion','apagar','vendedor','servicio','date_end'));
        return $pdf->download('ejemplo.pdf'); 
        //https://www.digitalocean.com/community/tutorials/easier-datetime-in-laravel-and-php-with-carbon
    }
}
