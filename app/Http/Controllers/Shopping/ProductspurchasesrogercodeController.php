<?php

namespace App\Http\Controllers\Shopping;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shopping\Providersrogercode;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Shopping\Carritocomprasrogercode;
use App\Models\Shopping\Purchaseproductsrogercode;
use App\Models\Shopping\Purchaseproductsdetailrogercode;
use Illuminate\Support\Facades\Gate;
use App\Http\Controllers\Settings\settingsrogercodeController;

class ProductspurchasesrogercodeController extends Controller
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
        Gate::authorize('hasAccess','compra_lista.index');
        return view('shopping.productspurchases.index');
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        Gate::authorize('hasAccess','compra.index');
        $id_user = Auth::user()->id;
        $comprobante = "";
        $comp = Purchaseproductsrogercode::select()->first();
        if ($comp === null) {
            $comprobante = "ING-1";
        }else {
            $compUltimo = Purchaseproductsrogercode::select()->latest()->first()->toArray();
            $serie = $compUltimo['id']+1;
            $comprobante = "ING-".$serie;
        }
        $provider = Providersrogercode::Where('estado',1)->get();
        $carrito = Carritocomprasrogercode::where('id_user',$id_user)->get();
        return view('shopping.productspurchases.create', compact('provider','carrito','comprobante'));
        //return view('shopping.productspurchases.create');
    }

    public function carrito(Request $request)
    {
        try {
            $id_user= Auth::user()->id;
                $carrito = Carritocomprasrogercode::firstWhere([['producto_id', (int)$request->id],['id_user',$id_user]]);
                if($carrito==null){ 
                    $carrito = new Carritocomprasrogercode();
                    $carrito->id_user = $id_user;
                    $carrito->producto_id = (int)$request->id;
                    $carrito->codigo = $request->cod;
                    $carrito->nombre= $request->nombre;
                    $carrito->cantidad= $request->cantidad;
                    $carrito->precio_costo = $request->pcosto;
                    $carrito->precio_venta = $request->pventa;
                    $carrito->total= $request->total;
                    $carrito->save();
                }else{
                    $carrito = Carritocomprasrogercode::firstWhere([['producto_id', (int)$request->id],['id_user',$id_user]]);
                    $cantidad=$carrito->cantidad + $request->cantidad;
                    $subtotal= $cantidad*$request->pcosto; 
                    $total= $subtotal; 
                    $carrito->id_user = $id_user;
                    $carrito->producto_id = (int)$request->id;
                    $carrito->codigo = $request->cod;
                    $carrito->nombre= $request->nombre;
                    $carrito->cantidad= $cantidad;
                    $carrito->precio_costo = $request->pcosto;
                    $carrito->precio_venta = $request->pventa;
                    $carrito->total= $total;
                    $carrito->save();
                }

            //$car = Carritocomprasrogercode::all();
            $car = Carritocomprasrogercode::where('id_user',$id_user)->get();
            return response()->json($car); 

        /*return response()->json([
            "status" => 1,
            "id" => 1, $id_user,
            "status" => (int)$request->id,

        ]);*/
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json([$th]); 
        }
    }

    public function update_carrito(Request $request)
    {
        try {
            $id_user= Auth::user()->id;
            $carrito=Carritocomprasrogercode::find($request->id);
            $subtotsl=  $request->cantidad * $request->precio;  
            $total= $subtotsl;
            $carrito->cantidad = $request->cantidad;
            $carrito->precio_costo =  $request->precio;   
            $carrito->total= $total;
            $carrito->save();   
            $car = Carritocomprasrogercode::where('id_user',$id_user)->get();
            return response()->json($car); 
            /*return response()->json([
                'status'=>1,
                "success" => true,
                "id"=>$request->get('id'),
            ]);*/
            
        } catch (\Throwable $th) {
            //throw $th;
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
        try {
            
            $id_user= Auth::user()->id;
            $id_proveedor = $request->id_proveedor;
            $numComprobante = "";//$request->numComprobante;
            $tipoComparobante = $request->tipoComprobante; 
            $numerocompramanual = $request->numeroCompraManual;
            $tipoPago = $request->tipoPago;
            $dinero = $request->apagar;
            $total = $request->total;
            $otroMetodoPago = $request->otroTipoPago;
            $cantTarjeta = $request->cantPagoTarjeta;


            if ($id_proveedor == "" || $id_proveedor == null) {
                return response()->json([
                    'status'=>0,
                    "message" => "Debe de seleccionar un proveedor",
                    "action" => "sale",
                ]);
            }
            if ($total == 0) {
                return response()->json([
                    'status'=>0,
                    "message" => "No tiene productos agregados para la compra",
                    "action" => "",
                ]);
            }
            if ($tipoComparobante != "" && $numerocompramanual == "" ) {
                return response()->json([
                    'status'=>0,
                    "message" => "Debes de ingresar el numero de compra manual",
                    "action" => "",
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
                        "action" => "",
                        //"dinero"=>$dinero,
                        //"otroPago"=>$otroMetodoPago,
                        //"cantarjeta"=>$cantTarjeta,
                        //"suma"=>$suma
                    ]);
                }
            }
            
            $cantTransfererncia = 0;
            $cantTdebito = 0;
            $cantTcredito = 0;
            $cantEfectivo = 0;
            $cantAbono = 0;
            if ($tipoPago === "EFECTIVO") {
                $cantEfectivo = $cantEfectivo + $dinero;
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

            $comp = Purchaseproductsrogercode::select()->first();
            if ($comp === null) {
                $numComprobante = "ING-1";
            }else {
                $compUltimo = Purchaseproductsrogercode::select()->latest()->first()->toArray();
                $serie = $compUltimo['id']+1;
                $numComprobante = "ING-".$serie;
            }

            $compras = new Purchaseproductsrogercode();
            $compras->user_id = $id_user;
            $compras->proveedor_id = $id_proveedor;
            $compras->tipo_comprobante = $tipoComparobante;
            $compras->numero_compra_manual = $numerocompramanual;
            $compras->num_comprobante = $numComprobante;
            $compras->tipo_pago = $tipoPago;
            $compras->efectivo = $cantEfectivo;
            $compras->transferencia = $cantTransfererncia;
            $compras->tdebito = $cantTdebito;
            $compras->tcredito = $cantTcredito;
            $compras->abono = 0;
            $compras->total_compra = $total;
            $compras->status = true;
            $compras->save();     

            $carritoCompra = Carritocomprasrogercode::where('id_user',$id_user)->get();
            foreach ($carritoCompra as $row) {  
                $detalle = new Purchaseproductsdetailrogercode();
                $detalle->compra_id= $compras->id;
                $detalle->producto_id= $row->producto_id;
                $detalle->precio_compra = $row->precio_costo;
                $detalle->precio_venta= $row->precio_venta;
                $detalle->cantidad= $row->cantidad;
                $detalle->descuento= 0;//$row->descuento;
                $detalle->subtotal= $row->total;
                $detalle->status = true;
                $detalle->save();
                $carr = Carritocomprasrogercode::find($row->id);
                $carr->delete();
            }
            /****new num comprobante*/
            $newnumComprobante = "";
            $newcomp = Purchaseproductsrogercode::select()->first();
            if ($newcomp === null) {
                $newnumComprobante = "ING-1";
            }else {
                $newcompUltimo = Purchaseproductsrogercode::select()->latest()->first()->toArray();
                $newserie = $newcompUltimo['id']+1;
                $newnumComprobante = "ING-".$newserie;
            }

            return response()->json([
                'status'=>1,
                "message" => "success",
                "data" => "Se realizo la compra con exito",
                "numComp" => $newnumComprobante,
                "otrotipopago" => $otroMetodoPago,
                "otrocantidadpago" => $cantTarjeta,
                "totalventa" => $total,
                "tipopago" => $tipoPago,
                "dinero" => $dinero,
                "cambio" => $cambio,
                "action" => "",
                //"typeSale" => "Sale",
                //"aperturacajaId" => $id_apertura,

            ]);

        } catch (\Throwable $th) {
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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }


    public function showprductspurchases(Request $request)
    {

        $id_user = Auth::user()->id;
        $getAccessUser = new settingsrogercodeController();
        $access = $getAccessUser->getAccessRolUser($id_user);
        if ($access == 'yes') {
            $datat = DB::table('compras as c')
            ->join('proveedores as p', 'c.proveedor_id', '=', 'p.id')
            ->join('users as u', 'c.user_id', '=', 'u.id')
            //->join('detalle_ventas as dv', 'v.id', '=', 'dv.venta_id')
            ->select('c.id','c.num_comprobante', 'u.name as usernom', 'c.tipo_comprobante','c.numero_compra_manual', 'c.tipo_pago', 'c.status', 'c.total_compra', 'p.nombre_empresa','c.created_at')
            ->where('c.status',1)
            ->orderBy('c.id','desc')
            ->get();
        }else{
            $datat = DB::table('compras as c')
            ->join('proveedores as p', 'c.proveedor_id', '=', 'p.id')
            ->join('users as u', 'c.user_id', '=', 'u.id')
            //->join('detalle_ventas as dv', 'v.id', '=', 'dv.venta_id')
            ->select('c.id','c.num_comprobante', 'u.name as usernom', 'c.tipo_comprobante','c.numero_compra_manual', 'c.tipo_pago', 'c.status', 'c.total_compra', 'p.nombre_empresa','c.created_at')
            ->where([['c.user_id',$id_user],['c.status',1]])
            ->orderBy('c.id','desc')
            ->get();
        }

        $data = $datat->map(function($comp){ 
            $totalProd=DB::table('detalle_compras as d')
            ->join('productos as p','d.producto_id','=','p.id')
            ->where('d.compra_id','=',$comp->id)
            ->sum('d.cantidad');
            return [ 
            'id' => $comp->id,
            //'num_comprobante' => $vent->num_comprobante,
            'usernom' => $comp->usernom,
            'tipo_comprobante' => $comp->tipo_comprobante,
            'numero_compra_manual' => $comp->numero_compra_manual,
            'tipo_pago' => $comp->tipo_pago,
            'status' => $comp->status,
            'total_compra' => $comp->total_compra,
            'nombres' => $comp->nombre_empresa,
            'created_at' => $comp->created_at,
            'totalProd' => $totalProd,
            ];
        });
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
            ->addColumn('totalcompra', function($data){
                $total = '$'.number_format($data['total_compra'], 0, ',', '.');
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
                <li><a class="dropdown-item" type="button" onclick="verCompra('.$data['id'].');"><i class="bi bi-eye"></i>Ver</a></li>
                <li><a class="dropdown-item" href="#"><i class="bi bi-trash"></i>Eliminar</a></li>
                </ul>
                ';
                return $btn;
            })
            ->rawColumns(['status','totalcompra','sumTotal','date','action'])
            ->make(true);
    }


    public function showdetalle($id)
    {
        $getcompra=DB::table('compras as c')
        ->join('proveedores as p', 'c.proveedor_id','=','p.id')
        ->select('c.id','p.nombre_empresa','c.tipo_comprobante','c.efectivo','c.transferencia','c.tdebito','c.tcredito','c.abono','c.tipo_abono','c.tipo_pago','c.num_comprobante','c.total_compra','c.numero_compra_manual', 'c.created_at as fechacompra')
        ->where('c.id','=',$id)
        ->first();
        $detalles=DB::table('detalle_compras as d')
        ->join('productos as p','d.producto_id','=','p.id')
        ->select('p.nombre','p.codigo','d.cantidad','d.precio_compra','d.subtotal')
        ->where('d.compra_id','=',$id)
        ->get();
        return response()->json([
            "compra" => $getcompra,
            "detalle" => $detalles
        ]);
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
        $carrito = Carritocomprasrogercode::find($request->id);
        if ($carrito->delete()) {
            $car = Carritocomprasrogercode::where('id_user',$id_user)->get();
            return response()->json([
                "message" => 1,
                "carrito" => $car,
            ]);
        }else{
            return response()->json([
                "message" => 0,
                "data" => "No se elimino el registro",
            ]);
        }
    }
}
