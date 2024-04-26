<?php

namespace App\Http\Controllers\Sales;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customers\Customersrogercode;
use App\Models\Sales\Carritosalerogercode;
use App\Models\Sales\Saledetailrogercode;
use App\Models\Sales\Salesrogercode;
use App\Models\Warehouse\Productsrogercode;
use App\Models\Cash\Cash_registerrogercode;
use App\Models\Warehouse\Categoryrogercode;
use App\Models\Warehouse\Subcategoryrogercode;
use App\Models\Shopping\Providersrogercode;
use App\Models\Sales\Paymentmoneyrogercode;
use App\Models\Sales\Tipounidadrogercode;

use App\Http\Controllers\Settings\settingsrogercodeController;

use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Gate;
use PDF;

class SalesrogercodeController extends Controller
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
        Gate::authorize('hasAccess','venta_lista.index');
        return view('sales.sale.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('hasAccess','venta.index');
        $id_user = Auth::user()->id;

        $comprobante = "";
        $comp = Salesrogercode::select()->first();
        if ($comp === null) {
            $comprobante = "COMP-1";
        }else {
            $compUltimo = Salesrogercode::select()->latest()->first()->toArray();
            $serie = $compUltimo['id']+1;
            $comprobante = "COMP-".$serie;
        }
        //return view('sales.sale.create',compact('productos','clientes','carrito', 'codserie'));  
        $productos = Productsrogercode::all();
        $clientes= Customersrogercode::all();
        $carrito = Carritosalerogercode::where('id_user',$id_user)->get();
        $categ= Categoryrogercode::all();
        $subcateg= Subcategoryrogercode::all();
        $proveedor= Providersrogercode ::all();
        $tipoUnidad = Tipounidadrogercode::all();
        $typeSale = "Sale";
        return view('sales.sale.create',compact('productos','clientes','carrito', 'comprobante','categ','subcateg','proveedor','typeSale','tipoUnidad'));  
        //return view('sales.sale.create');  
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

    public function create_carrito(Request $request)
    {   
        //return response()->json([
            //"codigo" => $request->codigo
        //]);
        try {
            $id_user= Auth::user()->id;
            $msg = "";
            $cantidad = 0;
            if ($request->ajax()) {
                $carrito = Carritosalerogercode::firstWhere([['producto_id', $request->id],['id_user',$id_user]]);
                if($carrito==null){ 
                    $subtotal = 0;
                    $precio = 0;
                    if ($request->tipo_unidad == 2) {
                        if ($request->mayoreo_cantidad != 0 && $request->mayoreo_cantidad2 == 0) {
                            if (($request->cantidad >= $request->mayoreo_cantidad)) {
                                $subtotal = $request->cantidad*$request->mayoreo_pventa;
                                $precio = $request->mayoreo_pventa; 
                                $msg = "nivel 2 : primer pventa 1 SECCION 1";
                            }else{
                                $msg = "cantidad no supera la cantidad de venta 1";
                                $subtotal = $request->cantidad*$request->precio_venta; 
                                $precio = $request->precio_venta; 
                            }
                        }
                        if ($request->mayoreo_cantidad2 != 0) {
                            if (($request->cantidad >= $request->mayoreo_cantidad) && ($request->cantidad < $request->mayoreo_cantidad2)) {
                                $subtotal = $request->cantidad*$request->mayoreo_pventa;
                                $precio = $request->mayoreo_pventa; 
                                $msg = "nivel 2 : primer pventa 1 seccion 2";
                            }else if ($request->cantidad >= $request->mayoreo_cantidad2) {
                                $subtotal= $request->cantidad*$request->mayoreo_pventa2;
                                $precio = $request->mayoreo_pventa2; 
                                $msg = "nivel 2 : primer pventa 2 seccion 2";
                            }else{
                                $msg = "salta nivel 1 y nivel 2 seccion 2";
                                $subtotal = $request->cantidad*$request->precio_venta; 
                                $precio = $request->precio_venta; 
                            }
                        }
                    }else{
                        $subtotal = $request->cantidad*$request->precio_venta; 
                        $precio = $request->precio_venta; 
                        $msg = "none";
                    }
                    $total = $subtotal; 
                    $carrito = new Carritosalerogercode();
                    $carrito->id_user = $id_user;
                    $carrito->producto_id = $request->id;
                    $carrito->codigo = $request->codigo;
                    $carrito->nombre= $request->nombre;
                    $carrito->cantidad= $request->cantidad;
                    //$carrito->precio = $request->precio_venta;
                    $carrito->precio = $precio;
                    $carrito->precio_menudeo = $request->precio_venta;
                    $carrito->precio_mayoreo = $request->mayoreo_pventa;
                    $carrito->precio_mayoreo2 = $request->mayoreo_pventa2;
                    $carrito->tipo_unidad= $request->tipo_unidad;
                    $carrito->mayoreo_cantidad = $request->mayoreo_cantidad;
                    $carrito->mayoreo_cantidad2 = $request->mayoreo_cantidad2;
                    //$carrito->total= $request->total;
                    $carrito->total = $total;
                    $carrito->product_stock = $request->stock;
                    $carrito->save();
                }else{
                    $carrito = Carritosalerogercode::firstWhere([['producto_id', $request->id],['id_user',$id_user]]);
                    $cantidad=$carrito->cantidad + $request->cantidad;
                    $subtotal = 0;
                    $precio = 0;
                    if ($carrito->tipo_unidad == 2) {
                        if ($carrito->mayoreo_cantidad != 0 && $carrito->mayoreo_cantidad2 == 0) {
                            if (($cantidad >= $carrito->mayoreo_cantidad)) {
                                $subtotal= $cantidad*$carrito->precio_mayoreo;
                                $precio = $carrito->precio_mayoreo; 
                                $msg = "update seccion 1 prod  nivel 1:".$carrito->precio_mayoreo;
                            }else{
                                $subtotal= $cantidad*$request->precio_venta; 
                                $precio = $carrito->precio_menudeo; 
                                $msg = "update seccion 1 prod :".$carrito->precio_mayoreo;
                            }
                        }
                        if ($carrito->mayoreo_cantidad2 != 0) {
                            if (($cantidad >= $carrito->mayoreo_cantidad) && ($cantidad < $carrito->mayoreo_cantidad2)) {
                                $subtotal= $cantidad*$carrito->precio_mayoreo;
                                $precio = $carrito->precio_mayoreo; 
                                $msg = "update seccion 2 prod nivel 1 :".$carrito->precio_mayoreo;
                            }else if ($cantidad >= $carrito->mayoreo_cantidad2) {
                                $subtotal= $cantidad*$carrito->precio_mayoreo2;
                                $precio = $carrito->precio_mayoreo2; 
                                $msg = "update seccion 2 prod nivel 2 :".$carrito->precio_mayoreo;
                            }else{
                                $subtotal= $cantidad*$carrito->precio; 
                                $precio = $carrito->precio; 
                                $msg = "update sin nivel:".$carrito->precio_mayoreo;
                            }
                        }

                    }else{
                        $subtotal= $cantidad*$carrito->precio_menudeo;
                        $precio = $carrito->precio_menudeo; 
                    }
                    $total = $subtotal; 
                    $carrito->id_user = $id_user;
                    $carrito->producto_id = $request->id;
                    $carrito->codigo = $request->codigo;
                    $carrito->nombre= $request->nombre;
                    $carrito->precio = $precio;
                    $carrito->cantidad= $cantidad;
                    $carrito->total= $total;
                    $carrito->save();
                }
            }

            //$car = Carritosalerogercode::all();
            $car = Carritosalerogercode::where('id_user',$id_user)->get();
            
            $array = [
                "car" => $car,
                "msg" => $msg,
                "cantidad" => $cantidad,
                "subtotal" => $subtotal,
            ];
            //return response()->json($car); 
            return response()->json($array); 

        } catch (\Throwable $th) {
            //throw $th;
            return response()->json([$th]); 
        }
    }


    public function update_carrito(Request $request)
    {   
        try {
            $id_user= Auth::user()->id;
            
            $rules = [
                'id' => 'required',
                'cantidad' => 'required',
                'precio' => 'required',
                'currentStock' => 'required',
            ];
            $messages = [
                'id.required'=>'El id es requerido',
                'cantidad.required'=>'La cantidad es requerida',
                'precio.required'=>'El precio es requerido',
            ];
            $validator = Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {
                 return response()->json([
                    'status' => 0,
                    'mensaje'=> $validator->errors()->all(),
                ]);
            }
            if ($request->cantidad > $request->currentStock) {
                $validator->errors()->add('quantity', 'The quantity exceeds the available stock.');
                return response()->json([
                    'status' => 0,
                    'mensaje'=> 'Error: La cantidad supera el stock del producto: ' . 'stock actual ' . $request->currentStock,
                ]);
            }
            if ($request->ajax()) { 
                $carrito=Carritosalerogercode::find($request->id);
                $subtotsl=  $request->cantidad * $request->precio;  
                $total= $subtotsl;
                $carrito->cantidad = $request->cantidad;
                $carrito->precio =  $request->precio;   
                $carrito->total= $total;
                $carrito->save();   
                $car = Carritosalerogercode::where('id_user',$id_user)->get();
                //$car = Carritosalerogercode::all();
                return response()->json($car); 
            } 
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
                ->addColumn('preciocosto', function($data){
                    $pcosto = '$'.number_format($data->precio_costo, 0, ',', '.');
                    return $pcosto;
                })
                ->addColumn('action', function($data){
                    $prodData = [
                        (object) [
                        "id" => $data->id,
                        "codigo" => $data->codigo,
                        "nombre" => $data->nombre,
                        "precio_venta" => $data->precio_venta,
                        "precio_costo" => $data->precio_costo,
                        "tipo_unidad" => $data->tipounidad_id,
                        "mayoreo_cantidad" => $data->mayoreo_cantidad,
                        "mayoreo_pventa" => $data->mayoreo_pventa,
                        "mayoreo_cantidad2" => $data->mayoreo_cantidad2,
                        "mayoreo_pventa2" => $data->mayoreo_pventa2,
                        "stock" => $data->stock,
                        ],
                    ];
                    $transform = json_encode($prodData);
                    //$dd = json_decode($transform);
                    //$btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm">View</a>';
                    //$btn = '<i onclick="Addcar('.$data->id.','."$data->codigo".','."$data->nombre".','.$data->precio_venta.');" class=" btn btn-success bi bi-plus"></i>';
                    //production $btn = '<i  id="addProd'.$data->id.'" onclick="Addcar('.$data->id.','."'$data->codigo'".','."'$data->nombre'".','.$data->precio_venta.','.$data->precio_costo.');" class=" btn btn-success"><i class="bi bi-plus"></i></i>';
                    //$btn = '<i  id="addProd'.$data->id.'" onclick="Addcar('."'$data->nombre'".');" class=" btn btn-success"><i class="bi bi-plus"></i></i>';
                    $btn = "<button id='addProd$data->id' onclick='Addcar(".$transform.");' class='btn btn-success'><i class='bi bi-plus'></i></button>";
                    return $btn;
                })
                ->rawColumns(['status','pstock','precioventa','preciocosto','pcant','action'])
                ->make(true);
        }
    }

    public function createVentaWithAbono(Request $request)
    {
        try {
            $id_user= Auth::user()->id;
            
            $cashReg = Cash_registerrogercode::where([
                ['user_id', $id_user],
                ['status_apertura', "Abierta"],
            ])->first();
            if ($cashReg === null) {
                return response()->json([
                    'status'=>0,
                    'message'=>'Ocurrio un error, No existe una caja abierta para el usuario.',
                    'class'=>'danger',
                    'test'=>$cashReg
                ]);
            }
            $id_apertura = 0;
            if ($cashReg !== null) {
              $id_apertura = $cashReg['id'];
            }

            $typeSale = $request->typesale;
            $id_cliente = $request->id_cliente;
            $numComprobante = "";//$request->numComprobante;
            $tipoComparobante = $request->tipoComprobante; 
            $numeroventamanual = $request->numeroVentaManual;
            $tipoPago = $request->tipoPago;
            $cantPago = $request->apagar;
            $total = $request->total;
            $otroMetodoPago = $request->otroTipoPago;
            $cantTarjeta = $request->cantPagoTarjeta;
            $tipoAbono = $request->showTipoAbono;
            $cantAbono = $request->showCantAbono;

            if ($total == 0) {
                return response()->json([
                    'status'=>0,
                    "message" => "No tiene productos agregados para la venta",
                    "action" => "sale",
                    "type" => $typeSale, 
                ]);
            }

            if ($tipoComparobante != "" && $numeroventamanual == "" ) {
                return response()->json([
                    'status'=>0,
                    "message" => "Debes de ingresar el numero de venta manual",
                    "action" => "sale",
                ]);
            }

            $dinero = $cantAbono + $cantPago;
            $suma = 0;
            $cambio = 0;
            if ($tipoPago === "EFECTIVO") {
                if ($otroMetodoPago != null && $cantTarjeta != null) {
                    $suma = $suma + ($dinero + $cantTarjeta);

                }else {
                    $suma = $suma + $dinero;
                }
                $cambio = $cambio + ($suma - $total);
                if ($suma < $total) {
                    return response()->json([
                        'status'=>0,
                        "message" => "El dinero que ingreso no es suficiente",
                        "action" => "sale",
                        "dinero"=>$dinero,
                        "cantarjeta"=>$cantTarjeta,
                        //"otroPago"=>$otroMetodoPago,
                        "suma"=>$suma
                    ]);
                }
            }

            if ($id_cliente == "" || $id_cliente == null) {
                return response()->json([
                    'status'=>0,
                    "message" => "Debe de seleccionar un cliente",
                    "action" => "sale",
                ]);
            }

            $cantTransfererncia = 0;
            $cantTdebito = 0;
            $cantTcredito = 0;
            $cantEfectivo = 0;
            //$cantAbono = 0;
            if ($tipoPago === "EFECTIVO") {
                $cantEfectivo = $cantEfectivo + $cantPago;
                switch ($otroMetodoPago) {
                    case 'TRANSFERENCIA':
                        $cantTransfererncia = $cantTransfererncia + $cantTarjeta;
                        break;
                    case 'T.DEBITO':
                        $cantTdebito = $cantTdebito + $cantTarjeta;
                        break;
                    case 'T.CREDITO':
                        $cantTcredito = $cantTcredito + $cantTarjeta;
                        break;
                    default:
                        # code...
                        break;
                }
            }else{
                switch ($tipoPago) {
                    case 'TRANSFERENCIA':
                        $cantTransfererncia = $cantTransfererncia + $cantPago;
                        break;
                    case 'T.DEBITO':
                        $cantTdebito = $cantTdebito + $cantPago;
                        break;
                    case 'T.CREDITO':
                        $cantTcredito = $cantTcredito + $cantPago;
                        break;
                    default:
                        # code...
                        break;
                }
            }

            $comp = Salesrogercode::select()->first();
            if ($comp === null) {
                $numComprobante = "COMP-1";
            }else {
                $compUltimo = Salesrogercode::select()->latest()->first()->toArray();
                $serie = $compUltimo['id']+1;
                $numComprobante = "COMP-".$serie;
            }

            DB::beginTransaction();

            $ventas = new Salesrogercode();
            $ventas->user_id = $id_user;
            $ventas->cliente_id = $id_cliente;
            $ventas->aperturacaja_id = $id_apertura;
            $ventas->tipo_comprobante = $tipoComparobante;
            $ventas->numero_venta_manual = $numeroventamanual;
            $ventas->num_comprobante = $numComprobante;
            $ventas->tipo_pago = $tipoPago;
            $ventas->efectivo = $cantEfectivo;
            $ventas->transferencia = $cantTransfererncia;
            $ventas->tdebito = $cantTdebito;
            $ventas->tcredito = $cantTcredito;
            $ventas->abono = $cantAbono;
            $ventas->tipo_abono = $tipoAbono;
            $ventas->total_venta = $total;
            $ventas->status = true;
            $ventas->save();     

            $carritoVenta = Carritosalerogercode::where('id_user',$id_user)->get();
            $i=1;
            foreach ($carritoVenta as $row) {  
                $detalle = new Saledetailrogercode();
                $detalle->venta_id= $ventas->id;
                $detalle->producto_id= $row->producto_id;
                $detalle->aperturacaja_id= $id_apertura;
                $detalle->precio_venta= $row->precio;
                $detalle->cantidad= $row->cantidad;
                $detalle->descuento= 0;//$row->descuento;
                $detalle->subtotal= $row->total;
                $detalle->save();
                $i++;
                $carr = Carritosalerogercode::find($row->id);
                $carr->delete();
            }

            /*********if payment sale************ */
            $tipo = explode("-",$typeSale);
            $serieAbono = "";
            if ($tipo[0] === "Payment") {
                $abono = Paymentmoneyrogercode::find($tipo[1]);
                $abono->status_abono = "Finalizado";
                $abono->save();
                $serieAbono = $abono->num_comprobante;
            }

            /****new num comprobante*/
            $newnumComprobante = "";
            $newcomp = Salesrogercode::select()->first();
            if ($newcomp === null) {
                $newnumComprobante = "COMP-1";
            }else {
                $newcompUltimo = Salesrogercode::select()->latest()->first()->toArray();
                $newserie = $newcompUltimo['id']+1;
                $newnumComprobante = "COMP-".$newserie;
            }

            DB::commit();

            return response()->json([
                'status'=>1,
                "message" => "success",
                "data" => "Se realizo la venta con exito",
                "numComp" => $newnumComprobante,
                "otrotipopago" => $otroMetodoPago,
                "otrocantidadpago" => $cantTarjeta,
                "totalventa" => $total,
                "tipopago" => $tipoPago,
                "dinero" => $cantPago,
                "cambio" => $cambio,
                "cantAbono" => $cantAbono,
                "action" => "sale",
                "typeSale" => "Sale",
                "serieAbono" => $serieAbono,
            ]);
            
        } catch (\Throwable $th) {
            DB::rollback();
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                "data"=> $th,
                'error' => (array) $m,
                "action" => "sale",
            ]);
        }

    }

    public function createventa(Request $request)
    {   
        try {
            $id_user= Auth::user()->id;
            
            $cashReg = Cash_registerrogercode::where([
                ['user_id', $id_user],
                ['status_apertura', "Abierta"],
            ])->first();
            if ($cashReg === null) {
                return response()->json([
                    'status'=>0,
                    'message'=>'Ocurrio un error, No existe una caja abierta para el usuario.',
                    'class'=>'danger',
                    'test'=>$cashReg
                ]);
            }
            $id_apertura = 0;
            if ($cashReg !== null) {
              $id_apertura = $cashReg['id'];
            }
            
            $typeSale = $request->typesale;
            $id_cliente = $request->id_cliente;
            $numComprobante = "";//$request->numComprobante;
            $tipoComparobante = $request->tipoComprobante; 
            $numeroventamanual = $request->numeroVentaManual;
            $tipoPago = $request->tipoPago;
            $dinero = $request->apagar;
            $total = $request->total;
            $otroMetodoPago = $request->otroTipoPago;
            $cantTarjeta = $request->cantPagoTarjeta;
            if ($total == 0) {
                return response()->json([
                    'status'=>0,
                    "message" => "No tiene productos agregados para la venta",
                    "action" => "sale",
                    "type" => $typeSale, 
                ]);
            }
            if ($tipoComparobante != "" && $numeroventamanual == "" ) {
                return response()->json([
                    'status'=>0,
                    "message" => "Debes de ingresar el numero de venta manual",
                    "action" => "sale",
                ]);
            }

            $suma = 0;
            $cambio = 0;
            if ($tipoPago === "EFECTIVO") {

                if ($otroMetodoPago != null && $cantTarjeta != null) {
                    $suma = $suma + ($dinero + $cantTarjeta);

                }else {
                    $suma = $suma + $dinero;
                }
                $cambio = $cambio + ($suma - $total);
                if ($suma < $total) {
                    return response()->json([
                        'status'=>0,
                        "message" => "El dinero que ingreso no es suficiente",
                        "action" => "sale",
                        //"dinero"=>$dinero,
                        //"otroPago"=>$otroMetodoPago,
                        //"cantarjeta"=>$cantTarjeta,
                        //"suma"=>$suma
                    ]);
                }
            }

            if ($id_cliente == "" || $id_cliente == null) {
                return response()->json([
                    'status'=>0,
                    "message" => "Debe de seleccionar un cliente",
                    "action" => "sale",
                ]);
            }

            $cantTransfererncia = 0;
            $cantTdebito = 0;
            $cantTcredito = 0;
            $cantEfectivo = 0;
            $cantAbono = 0;
            if ($tipoPago === "EFECTIVO") {
                //$cantEfectivo = $cantEfectivo + $dinero;
                if ($otroMetodoPago != null && $cantTarjeta != null) {
                    $cantEfectivo = $cantEfectivo + $dinero;
                }else {
                    $cantEfectivo = $cantEfectivo + $total;
                }
                switch ($otroMetodoPago) {
                    case 'TRANSFERENCIA':
                        $cantTransfererncia = $cantTransfererncia + $cantTarjeta;
                        break;
                    case 'T.DEBITO':
                        $cantTdebito = $cantTdebito + $cantTarjeta;
                        break;
                    case 'T.CREDITO':
                        $cantTcredito = $cantTcredito + $cantTarjeta;
                        break;
                    default:
                        # code...
                        break;
                }
            }else{
                switch ($tipoPago) {
                    case 'TRANSFERENCIA':
                        $cantTransfererncia = $cantTransfererncia + $total;
                        break;
                    case 'T.DEBITO':
                        $cantTdebito = $cantTdebito + $total;
                        break;
                    case 'T.CREDITO':
                        $cantTcredito = $cantTcredito + $total;
                        break;
                    default:
                        # code...
                        break;
                }

            }
            
            /********************************************** */
            $comp = Salesrogercode::select()->first();
            if ($comp === null) {
                $numComprobante = "COMP-1";
            }else {
                $compUltimo = Salesrogercode::select()->latest()->first()->toArray();
                $serie = $compUltimo['id']+1;
                $numComprobante = "COMP-".$serie;
            }

            DB::beginTransaction();

            $ventas = new Salesrogercode();
            $ventas->user_id = $id_user;
            $ventas->cliente_id = $id_cliente;
            $ventas->aperturacaja_id = $id_apertura;
            $ventas->tipo_comprobante = $tipoComparobante;
            $ventas->numero_venta_manual = $numeroventamanual;
            $ventas->num_comprobante = $numComprobante;
            $ventas->tipo_pago = $tipoPago;
            $ventas->efectivo = $cantEfectivo;
            $ventas->transferencia = $cantTransfererncia;
            $ventas->tdebito = $cantTdebito;
            $ventas->tcredito = $cantTcredito;
            $ventas->abono = $cantAbono;
            $ventas->total_venta = $total;
            $ventas->cambio = $cambio;
            $ventas->recibido= $suma;
            $ventas->status = true;
            $ventas->save();     

            $carritoVenta = Carritosalerogercode::where('id_user',$id_user)->get();
            $i=1;
            $ventaId = $ventas->id;
            foreach ($carritoVenta as $row) {  
                $detalle = new Saledetailrogercode();
                $detalle->venta_id= $ventaId; 
                $detalle->producto_id= $row->producto_id;
                $detalle->aperturacaja_id= $id_apertura;
                $detalle->precio_venta= $row->precio;
                $detalle->cantidad= $row->cantidad;
                $detalle->descuento= 0;//$row->descuento;
                $detalle->subtotal= $row->total;
                $detalle->save();
                $i++;
                $carr = Carritosalerogercode::find($row->id);
                $carr->delete();
            }
            /****new num comprobante*/
            $newnumComprobante = "";
            $newcomp = Salesrogercode::select()->first();
            if ($newcomp === null) {
                $newnumComprobante = "COMP-1";
            }else {
                $newcompUltimo = Salesrogercode::select()->latest()->first()->toArray();
                $newserie = $newcompUltimo['id']+1;
                $newnumComprobante = "COMP-".$newserie;
            }

            DB::commit();
            return response()->json([
                'status'=>1,
                "message" => "success",
                "data" => "Se realizo la venta con exito",
                "numComp" => $newnumComprobante,
                "otrotipopago" => $otroMetodoPago,
                "otrocantidadpago" => $cantTarjeta,
                "totalventa" => $total,
                "tipopago" => $tipoPago,
                "dinero" => $dinero,
                "cambio" => $cambio,
                "action" => "sale",
                "typeSale" => "Sale",
                "aperturacajaId" => $id_apertura,
                "ventaId" => $ventaId
            ]);
        } catch (\Throwable $th) {
            DB::rollback();
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                "data"=> $th,
                'error' => (array) $m,
                "action" => "sale",
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
    public function destroy(Request $request)
    {
        $id_user= Auth::user()->id;
        $carrito = Carritosalerogercode::find($request->id);
        if ($carrito->delete()) {
            $car = Carritosalerogercode::where('id_user',$id_user)->get();
            //$car = Carritosalerogercode::all();
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

    public function showsales(Request $request)
    {

        if ($request->ajax()) {
        $id_user = Auth::user()->id;
        $getAccessUser = new settingsrogercodeController();
        $access = $getAccessUser->getAccessRolUser($id_user);
            if ($access == 'yes') {
                $datat = DB::table('ventas as v')
                ->join('clientes as c', 'v.cliente_id', '=', 'c.id')
                ->join('users as u', 'v.user_id', '=', 'u.id')
                //->join('detalle_ventas as dv', 'v.id', '=', 'dv.venta_id')
                ->select('v.id','v.num_comprobante', 'u.name as usernom', 'v.tipo_comprobante','v.numero_venta_manual', 'v.tipo_pago', 'v.status', 'v.total_venta', 'c.nombres','v.created_at')
                ->where('v.status',1)
                ->orderBy('v.id','desc')
                ->get();
            }else{
                $datat = DB::table('ventas as v')
                ->join('clientes as c', 'v.cliente_id', '=', 'c.id')
                ->join('users as u', 'v.user_id', '=', 'u.id')
                //->join('detalle_ventas as dv', 'v.id', '=', 'dv.venta_id')
                ->select('v.id','v.num_comprobante', 'u.name as usernom', 'v.tipo_comprobante','v.numero_venta_manual', 'v.tipo_pago', 'v.status', 'v.total_venta', 'c.nombres','v.created_at')
                ->where([['v.user_id',$id_user],['v.status',1]])
                ->orderBy('v.id','desc')
                ->get();
            }
            $countReg = count($datat);
            if ($countReg =! 0) {
                $data = $datat->map(function($vent){ 
                    $totalProd=DB::table('detalle_ventas as d')
                    ->join('productos as p','d.producto_id','=','p.id')
                    ->where('d.venta_id','=',$vent->id)
                    ->sum('d.cantidad');
                    return [ 
                    'id' => $vent->id,
                    'usernom' => $vent->usernom,
                    'tipo_comprobante' => $vent->tipo_comprobante,
                    'numero_venta_manual' => $vent->numero_venta_manual,
                    'tipo_pago' => $vent->tipo_pago,
                    'status' => $vent->status,
                    'total_venta' => $vent->total_venta,
                    'nombres' => $vent->nombres,
                    'created_at' => $vent->created_at,
                    'totalProd' => $totalProd,
                    ];
                });
            }else{
                $data = [];
            }
            return Datatables::of($data)->addIndexColumn()
                ->addColumn('status', function($data){
                    if ($data['status'] == 1) {
                        $status = '<span class="badge bg-success">Activo</span>';
                    }else{
                        $status= '<span class="badge bg-danger">Inactivo</span>';
                    }
                    return $status;
                })
                ->addColumn('sumTotal', function($data){
                    $sum = '<span class="badge bg-primary">'.number_format($data['totalProd'], 0, ',', '').'</span>';
                    return $sum;
                })
                ->addColumn('totalventa', function($data){
                    $total = '$'.number_format($data['total_venta'], 0, ',', '.');
                    return $total;
                })
                ->addColumn('date', function($data){
                    $date = Carbon::parse($data['created_at']);
                     $onlyDate = $date->toDateString();
                    return $onlyDate;
                })
                ->addColumn('action', function($data){
                    $btn = '
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots-vertical"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li><a class="dropdown-item" type="button" onclick="verVenta('.$data['id'].');"><i class="bi bi-eye"></i>Ver</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-trash"></i>Eliminar</a></li>
                  </ul>
                    ';
                    return $btn;
                })
                ->rawColumns(['status','totalventa','sumTotal','date','action'])
                ->make(true);
        }
    }

    public function showdetalle($id)
    {
        $getventa=DB::table('ventas as v')
        ->join('clientes as c', 'v.cliente_id','=','c.id')
        ->select('v.id','c.nombres','v.tipo_comprobante','v.efectivo','v.transferencia','v.tdebito','v.tcredito','v.abono','v.tipo_abono','v.tipo_pago','v.num_comprobante','v.total_venta','v.numero_venta_manual', 'v.created_at as fechaventa')
        ->where('v.id','=',$id)
        ->first();
        $detalles=DB::table('detalle_ventas as d')
        ->join('productos as p','d.producto_id','=','p.id')
        ->select('p.nombre','p.codigo','d.cantidad','d.precio_venta','d.subtotal')
        ->where('d.venta_id','=',$id)
        ->get();
        return response()->json([
            "venta" => $getventa,
            "detalle" => $detalles
        ]);
    }

    public function generatePdfDay(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'dateday' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $id_user = Auth::user()->id;
        $getAccessUser = new settingsrogercodeController();
        $access = $getAccessUser->getAccessRolUser($id_user);
        
        $day = $request->dateday;

        if ($access == 'yes') {
            $datat = DB::table('ventas as v')
            ->join('clientes as c', 'v.cliente_id', '=', 'c.id')
            ->join('users as u', 'v.user_id', '=', 'u.id')
            //->join('detalle_ventas as dv', 'v.id', '=', 'dv.venta_id')
            ->select('v.id','v.num_comprobante', 'u.name as usernom', 'v.tipo_comprobante','v.numero_venta_manual', 'v.tipo_pago', 'v.status', 'v.total_venta', 'c.nombres','v.created_at')
            ->where('v.status',1)
            ->whereDate('v.created_at', $day)
            ->orderBy('v.id','desc')
            ->get();

            $getSumaVenta = Salesrogercode::where('status',1)->whereDate('created_at', $day)->sum('total_venta');
            $sumSalesDay = $getAccessUser->formattedNumber($getSumaVenta);
        }else{
            $datat = DB::table('ventas as v')
            ->join('clientes as c', 'v.cliente_id', '=', 'c.id')
            ->join('users as u', 'v.user_id', '=', 'u.id')
            //->join('detalle_ventas as dv', 'v.id', '=', 'dv.venta_id')
            ->select('v.id','v.num_comprobante', 'u.name as usernom', 'v.tipo_comprobante','v.numero_venta_manual', 'v.tipo_pago', 'v.status', 'v.total_venta', 'c.nombres','v.created_at')
            ->where([['v.user_id',$id_user],['v.status',1]])
            ->whereDate('v.created_at', $day)
            ->orderBy('v.id','desc')
            ->get();

            $getSumaVenta = Salesrogercode::where([['user_id',$id_user],['status',1]])->whereDate('created_at', $day)->sum('total_venta');
            $sumSalesDay = $getAccessUser->formattedNumber($getSumaVenta);
        }

        $data = $datat->map(function($vent){ 
            $getSettings = new settingsrogercodeController();
            $totalProd=DB::table('detalle_ventas as d')
            ->join('productos as p','d.producto_id','=','p.id')
            ->where('d.venta_id','=',$vent->id)
            ->sum('d.cantidad');
            $totalCantidad = 0;
            $totalCantidad = $totalCantidad + $totalProd;
            return [ 
            'id' => $vent->id,
            'usernom' => $vent->usernom,
            'tipo_comprobante' => $vent->tipo_comprobante,
            'numero_venta_manual' => $vent->numero_venta_manual,
            'tipo_pago' => $vent->tipo_pago,
            'status' => $vent->status,
            'total_venta' => $getSettings->formattedNumber($vent->total_venta),
            'nombres' => $vent->nombres,
            'created_at' => $vent->created_at,
            'totalProd' => $getSettings->formattedNumber($totalProd),
            ];
        });

        $pdf = PDF::loadView('sales/sale/pdf_detail_sale_day', compact('day','data','sumSalesDay'));//, compact('id','cotizacion','detalle','totalcotizacion','abonocotizacion','apagar','vendedor','servicio','date_end'));
        return $pdf->download('reporte_detail_sale.pdf'); 
    }
}
