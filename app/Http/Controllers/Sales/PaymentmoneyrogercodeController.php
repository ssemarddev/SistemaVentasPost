<?php

namespace App\Http\Controllers\Sales;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Sales\Paymentmoneyrogercode;
use App\Models\Sales\Paymentmoneydetailrogercode;
use Illuminate\Support\Facades\Auth;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use App\Models\Sales\Carritosalerogercode;
use App\Models\Cash\Cash_registerrogercode;
use App\Models\Sales\Salesrogercode;

class PaymentmoneyrogercodeController extends Controller
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
        return view('sales.paymentmoney.index');
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
        try{
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

            $id_cliente = $request->id_cliente;
            $numComprobante = "";
            $tipoComparobante = $request->tipoComprobante; 
            $numeroabonomanual = $request->numeroVentaManual;
            $tipoPago = $request->tipoPago;
            $dinero = $request->apagar;
            $total = $request->total;
            //$otroMetodoPago = $request->otroTipoPago;
            //$cantTarjeta = $request->cantPagoTarjeta;
            if ($total == 0) {
                return response()->json([
                    'status'=>0,
                    "message" => "No tiene productos agregados para el abono",
                    "action" => "payment",
                ]);
            }
            if ($tipoComparobante != "" && $numeroabonomanual == "" ) {
                return response()->json([
                    'status'=>0,
                    "message" => "Debes de ingresar el numero de abono manual",
                    "action" => "payment",
                ]);
            }
            if ($id_cliente == "" || $id_cliente == null) {
                return response()->json([
                    'status'=>0,
                    "message" => "Debe de seleccionar un cliente",
                    "action" => "payment",
                ]);
            }
            /************************************************************** */
            $cantEfectivo = 0;
            $cantTransfererncia = 0;
            $cantTdebito = 0;
            $cantTcredito = 0;
            switch ($tipoPago) {
                case 'EFECTIVO':
                    $cantEfectivo = $dinero;
                    break;
                case 'TRANSFERENCIA':
                    $cantTransfererncia = $dinero;
                    break;
                case 'T.DEBITO':
                    $cantTdebito = $dinero;
                    break;
                case 'T.CREDITO':
                    $cantTcredito = $dinero;
                    break;
                default:
                    # code...
                    break;
            }

            $numabono = Paymentmoneyrogercode::select()->first();
            if ($numabono === null) {
                $numComprobante = "ABONO-1";
            }else {
                $abonoUltimo = Paymentmoneyrogercode::select()->latest()->first()->toArray();
                $serie = $abonoUltimo['id']+1;
                $numComprobante = "ABONO-".$serie;
            }

            DB::beginTransaction();

            $abono = new Paymentmoneyrogercode();
            $abono->user_id = $id_user;
            $abono->cliente_id = $id_cliente;
            $abono->aperturacaja_id = $id_apertura;
            $abono->tipo_comprobante = $tipoComparobante;
            $abono->num_comprobante = $numComprobante;
            $abono->numero_abono_manual = $numeroabonomanual;
            $abono->tipo_pago = $tipoPago;

            $abono->efectivo = $cantEfectivo;
            $abono->transferencia = $cantTransfererncia;
            $abono->tdebito = $cantTdebito;
            $abono->tcredito = $cantTcredito;

            $abono->total = $total;
            $abono->total_abono = $dinero;
            $abono->status_abono = "Pendiente";
            $abono->status = true;
            $abono->save();     

            $carritoVenta = Carritosalerogercode::where('id_user',$id_user)->get();
            $i=1;
            foreach ($carritoVenta as $row) {  
                $detalle = new Paymentmoneydetailrogercode();
                $detalle->abono_id= $abono->id;
                $detalle->producto_id= $row->producto_id;
                $detalle->aperturacaja_id = $id_apertura;
                $detalle->precio_venta= $row->precio;
                $detalle->cantidad= $row->cantidad;
                $detalle->descuento= 0;//$row->descuento;
                $detalle->subtotal= $row->total;
                $detalle->save();
                $i++;
                $carr = Carritosalerogercode::find($row->id);
                $carr->delete();
            }
            $apagar = $total - $dinero;

            /****The comprobante sale*/
            $newnumComprobante = "";
            $vent = Salesrogercode::select()->first();
            if ($vent === null) {
                $newnumComprobante = "COMP-1";
            }else {
                $ventUltimo = Salesrogercode::select()->latest()->first()->toArray();
                $serie = $ventUltimo['id']+1;
                $newnumComprobante = "COMP-".$serie;
            }
            DB::commit();

            return response()->json([
                'status'=>1,
                "message" => "Se realizo el abono con exito",
                "numComp" => $newnumComprobante,
                "totalAbono" => $total,
                "abono" => $dinero,
                "apagar" => $apagar,
                "codabono" => $numComprobante,
                "action" => "payment",
                "aperturacajaId" => $id_apertura,
                "tipoAbonoPago" => $tipoPago,
            ]);
        }
        catch (\Throwable $th ) {
            DB::rollback();
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                "data"=> $th,
                'error' => (array) $m,
                "action" => "payment",
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
            $datat = DB::table('abonos as a')
            ->join('clientes as c', 'a.cliente_id', '=', 'c.id')
            ->join('users as u', 'a.user_id', '=', 'u.id')
            ->select('a.id','a.num_comprobante', 'u.name as usernom', 'a.tipo_comprobante','a.numero_abono_manual', 'a.tipo_pago', 'a.status', 'a.total','a.total_abono','c.nombres','a.created_at','a.status_abono')
            //->where('a.status_abono', "Pendiente")
            //->where('a.status_abono','!=', "Finalizado")
            ->orderBy('a.id','desc')
            ->get();
            $data = $datat->map(function($abono){ 
                $totalProd=DB::table('detalle_abonos as d')
                ->join('productos as p','d.producto_id','=','p.id')
                ->where('d.abono_id','=',$abono->id)
                ->sum('d.cantidad');
                return [ 
                'id' => $abono->id,
                'num_comprobante' => $abono->num_comprobante,
                'usernom' => $abono->usernom,
                'tipo_comprobante' => $abono->tipo_comprobante,
                'numero_abono_manual' => $abono->numero_abono_manual,
                'tipo_pago' => $abono->tipo_pago,
                'status' => $abono->status,
                'total' => $abono->total,
                'total_abono' => $abono->total_abono,
                'nombres' => $abono->nombres,
                'created_at' => $abono->created_at,
                'totalProd' => $totalProd,
                'status_abono' => $abono->status_abono,
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
                ->addColumn('totalgeneral', function($data){
                    $total = '$'.number_format($data['total'], 0, ',', '.');
                    return $total;
                })
                ->addColumn('totalabono', function($data){
                    $total = '$'.number_format($data['total_abono'], 0, ',', '.');
                    return $total;
                })
                ->addColumn('apagar', function($data){
                    $apagar = $data['total'] - $data['total_abono'];
                    $totalapagar = '$'.number_format($apagar, 0, ',', '.');
                    return $totalapagar;
                })
                ->addColumn('statusAbono', function($data){
                    if ($data['status_abono'] == 'Finalizado') {
                        $statu = '<span class="badge bg-success">'.$data['status_abono'].'</span>';
                    }
                    if ($data['status_abono'] == 'Pendiente') {
                        $statu = '<span class="badge bg-warning">'.$data['status_abono'].'</span>';
                    }
                    if ($data['status_abono'] == 'Agregado') {
                        $statu = '<span class="badge bg-warning">Pendiente</span>';
                    }
                    return $statu;
                })
                ->addColumn('date', function($data){
                    $date = Carbon::parse($data['created_at']);
                     $onlyDate = $date->toDateString();
                    return $onlyDate;
                })
                ->addColumn('action', function($data){
                    if ($data['status_abono'] !== 'Finalizado') {
                        $btn = '
                        <button class="btn btn-warning btn-sm" id="addpayment'.$data['id'].'" name="btnAddAbono" data-id="'.$data['id'].'" type="button">Pagar</button>
                        ';
                    }else{
                        $btn = '<span class="badge bg-success">Pagado</span>';
                    }
                    return $btn;

                    //<button class="btn btn-success btn-sm btnAd" type="button" onclick="addAbono('.$data['id'].');"><i class="bi bi-cash"></i> Pagar</button>
                })
                ->rawColumns(['status','statusAbono','totalgeneral','totalabono','apagar','sumTotal','date','action'])
                ->make(true);
        }
    }


    /**
     * @param $id
     * @return data array
    */
    public function get_reg_abono($id)
    {
        try{

            $id_user = Auth::user()->id;

            $getabono=DB::table('abonos as a')
            ->join('clientes as c', 'a.cliente_id','=','c.id')
            ->select('a.id','c.id as clienteId','c.nombres','a.tipo_pago','a.tipo_comprobante','a.num_comprobante','a.total','a.total_abono','a.numero_abono_manual', 'a.created_at as fechaabono')
            ->where('a.id','=',$id)
            ->first();
            $detalles=DB::table('detalle_abonos as d')
            ->join('productos as p','d.producto_id','=','p.id')
            ->select('p.id as productoId','p.nombre','p.codigo','d.cantidad','d.precio_venta','d.subtotal')
            ->where('d.abono_id','=',$id)
            ->get();

            DB::beginTransaction();

            foreach ($detalles as $reg) {
                $addcarrito = new Carritosalerogercode();
                $addcarrito->id_user = $id_user;
                $addcarrito->producto_id = $reg->productoId;
                $addcarrito->codigo = $reg->codigo;
                $addcarrito->nombre = $reg->nombre;
                $addcarrito->cantidad = $reg->cantidad;
                $addcarrito->precio = $reg->precio_venta;
                $addcarrito->total= $reg->subtotal;
                $addcarrito->save();
            }

            $abono = Paymentmoneyrogercode::find($id);
            $abono->status_abono = "Agregado";
            $abono->save();

            $cardata = Carritosalerogercode::all();

            DB::commit();
            return response()->json([
                "status" => 1,
                "reg" => $cardata,
                "regabono" => $getabono,
                "detalle" => $detalles,
                "typeSale" => "Payment-".$id,
            ]);

        }catch(\Throwable $th){
            DB::rollback();
            return response()->json([
                "status" =>0,
                "error" => $th,
            ]);

        }
    }
    
    /**
     * @param $id
     * 
     * 
     */
    public function get_detail_abono($id)
    {
        try{

            $getabono=DB::table('abonos as a')
            ->join('clientes as c', 'a.cliente_id','=','c.id')
            ->select('a.id','c.id as clienteId','c.nombres','c.telefono','c.direccion','c.email','a.tipo_comprobante','a.num_comprobante','a.total','a.total_abono','a.numero_abono_manual','a.efectivo','a.transferencia','a.tdebito','a.tcredito','a.created_at as fechaabono')
            ->where('a.id','=',$id)
            ->first();
            $detalles=DB::table('detalle_abonos as d')
            ->join('productos as p','d.producto_id','=','p.id')
            ->select('p.id as productoId','p.nombre','p.codigo','d.cantidad','d.precio_venta','d.subtotal')
            ->where('d.abono_id','=',$id)
            ->get();

            return response()->json([
                "status" => 1,
                "regabono" => $getabono,
                "detalle" => $detalles,
            ]);
        }catch(\Throwable $th){
            return response()->json([
                "status" =>0,
                "error" => $th,
            ]);

        }
    }
     /** Show the form for editing the specified resource.
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
