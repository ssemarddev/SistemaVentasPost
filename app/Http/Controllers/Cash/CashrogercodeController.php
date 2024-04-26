<?php

namespace App\Http\Controllers\Cash;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cash\Cash_registerrogercode;
use App\Models\Cash\Cash_courtrogercode;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use App\Models\Sales\Salesrogercode;
use App\Models\Sales\Paymentmoneyrogercode;
use App\Models\Cash\Cash_withdrawalsrogercode;
use Illuminate\Support\Facades\Validator;
use PDF;
use App\Http\Controllers\Settings\settingsrogercodeController;
use App\Http\Controllers\Metodosgenerales\metodosrogercodeController;
use Illuminate\Support\Facades\Gate;

class CashrogercodeController extends Controller
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
        Gate::authorize('hasAccess','caja_abrir.index');
        return view('cashRegister.open.index');
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
            $id_user= Auth::user()->id;
            $cashReg = Cash_registerrogercode::where([
                ['user_id', $id_user],
                ['status_apertura', "Abierta"],
            ])->first();
            if ($cashReg !== null) {
                return response()->json([
                    'status'=>0,
                    'message'=>'Ocurrio un error, Ya existe una caja abierta para el usuario.',
                    'class'=>'danger',
                    'test'=>$cashReg
                ]);
            }
            
            DB::beginTransaction();
            $cash = $request->cantapertura;

            $cashregister = new Cash_registerrogercode(); 
            $cashregister->user_id = $id_user;
            $cashregister->cantidad_inicial = $cash;
            $cashregister->cantidad_final = 0;
            $cashregister->status_apertura = "Abierta";
            $cashregister->status = true;
            $cashregister->save();

            $cashier = new Cash_courtrogercode();
            $cashier->apertura_id = $cashregister->id;
            $cashier->ventaefectivo = 0;
            $cashier->ventatransferencia = 0;
            $cashier->ventatdebito = 0;
            $cashier->ventatcredito = 0;
            $cashier->abonoefectivo = 0;
            $cashier->abonotransferencia = 0;
            $cashier->abonotdebito = 0;
            $cashier->abonotcredito = 0;
            $cashier->abono = 0;
            $cashier->status = true;
            $cashier->save();
            DB::commit();
            return response()->json([
                'status'=>1,
                'cash'=> $cash,
                'message'=>'Se genero la aperura de la caja con exito',
                'class'=>'success',
                'test'=>$cashReg,
            ]);
        } catch (\Throwable $th) {
            DB::rollback();
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                'class'=>'danger',
                'error' => (array) $m
            ]);    
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        //Or alternatively, you could convert this to an array ==> $currentTime->toArray();
        //If you used dd($currentTime->toArray()); you would get the following output:
        //$data = Cash_registerrogercode::all();
        //https://devdojo.com/bobbyiliev/how-to-get-the-current-date-and-time-in-laravel
        $id_user = Auth::user()->id;
        $getAccessUser = new settingsrogercodeController();
        $access = $getAccessUser->getAccessRolUser($id_user);
        if ($access == 'yes') {
            $data = DB::table('aperturacajas as ap')
            ->join('users as us', 'ap.user_id', '=', 'us.id')
            ->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
            ->select('us.name','ap.status_apertura','ap.cantidad_inicial','ap.cantidad_final','ap.id as aperturaId', 'ap.created_at','ap.status','ap.fecha_hora_cierre','cor.ventaefectivo','cor.ventatransferencia','cor.ventatdebito','cor.ventatcredito','cor.abono')
            ->orderBy('ap.id','desc')
            ->get();
        }else{
            $data = DB::table('aperturacajas as ap')
            ->join('users as us', 'ap.user_id', '=', 'us.id')
            ->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
            ->select('us.name','ap.status_apertura','ap.cantidad_inicial','ap.cantidad_final','ap.id as aperturaId', 'ap.created_at','ap.status','ap.fecha_hora_cierre','cor.ventaefectivo','cor.ventatransferencia','cor.ventatdebito','cor.ventatcredito','cor.abono')
            ->where('ap.user_id',$id_user)
            ->orderBy('ap.id','desc')
            ->get();
        }
        return Datatables::of($data)->addIndexColumn()
            ->addColumn('ventas', function($data){
                $total  = ($data->ventaefectivo + $data->ventatransferencia + $data->ventatdebito + $data->ventatcredito + $data->abono); 
                $vent = '$'.number_format($total, 0, ',', '.');
                return $vent;
            })
            ->addColumn('abierta', function($data){
                $cant = '<span class="badge bg-success"> $'.number_format($data->cantidad_inicial, 0, ',', '.').'</span>';
                return $cant;
            })
            ->addColumn('end_hour', function($data){
                if ($data->fecha_hora_cierre != null) {
                $date = Carbon::parse($data->fecha_hora_cierre);
                    $date_end = $date->toTimeString();
                }else{
                    $date_end = "";
                }
                return $date_end;
            })
            ->addColumn('date', function($data){
                $date = Carbon::parse($data->created_at);
                    $onlyDate = $date->toDateString();
                return $onlyDate;
            })
            ->addColumn('hour', function($data){
                $date = Carbon::parse($data->created_at);
                    $onlyDate = $date->toTimeString();
                return $onlyDate;
            })
            ->addColumn('close', function($data){
               // $btnClose = '<span class="btn badge bg-warning">Cerrar</span>';
                if ($data->status_apertura != "Cerrada") {
                    $btnClose = '<button type="button" class="btn btn-warning btn-sm" onclick="editCash('.$data->aperturaId.');" >
                        Cerrar
                    </button>';
                }else{
                    //$total = $data->cantidad_inicial + $data->cantidad_final;
                    $total  = ($data->ventaefectivo + $data->ventatransferencia + $data->ventatdebito + $data->ventatcredito + $data->abono) + $data->cantidad_inicial; 
                    $btnClose = '<span class="badge bg-danger">$'.number_format($total, 0, ',', '.').'</span>';
                }
                return $btnClose;
            })
            ->addColumn('action', function($data){
                //$btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm">View</a>';
                $btn = '
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots-vertical"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li><a class="dropdown-item" type="button" onclick="verCash('.$data->aperturaId.');"><i class="bi bi-eye"></i>Ver</a></li>
                </ul>
                ';
                return $btn;
            })
            ->rawColumns(['abierta','ventas','date','end_hour','hour','action','close'])
            ->make(true);
    }


    public function closecash(Request $request)
    {
        try {

            $dateEnd = Carbon::now();

            $apert = Cash_registerrogercode::find($request->pertId);
            $apert->cantidad_final =  $request->cantclose;
            $apert->fecha_hora_cierre = $dateEnd->toDateTimeString();
            $apert->status_apertura = "Cerrada";
            $apert->save();

            return response()->json([
                'status'=>1,
                'data' => $request->cantclose,
                'message'=>'La caja se cerro con exito',
            ]);
        } catch (\Throwable $th) {
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                'class'=>'danger',
                'error' => (array) $m
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

    public function getdetalle($id)
    {
        $data = DB::table('aperturacajas as ap')
        ->join('users as us', 'ap.user_id', '=', 'us.id')
        ->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
        ->select('us.name','ap.status_apertura','ap.cantidad_inicial','ap.cantidad_final',
        'ap.id as aperturaId', 'ap.created_at','ap.status','ap.fecha_hora_cierre','cor.ventaefectivo',
        'cor.ventatransferencia','cor.ventatdebito','cor.ventatcredito','cor.abono',
        'cor.abonoefectivo','cor.abonotransferencia','cor.abonotdebito','cor.abonotcredito')
        ->where('ap.id','=',$id)
        ->get();
        /************* COUNT VENTAS TOTAL *******************/
        /*$count_sale_efectivo = Salesrogercode::select(DB::raw("COUNT(efectivo) as CountOfEfectivo"))
        ->where([
            ['aperturacaja_id', $id],
            ['efectivo','!=' , 0],
            ['status','=', 1]
        ])->get()->toArray();
        $count_sale_transferencia = Salesrogercode::select(DB::raw("COUNT(transferencia) as CountOfTransferencia"))
        ->where([
            ['aperturacaja_id', $id],
            ['transferencia','!=' , 0],
            ['status','=', 1]
        ])->get()->toArray();
        $count_sale_tdebito = Salesrogercode::select(DB::raw("COUNT(tdebito) as CountOfTdebito"))
        ->where([
            ['aperturacaja_id', $id],
            ['tdebito','!=' , 0],
            ['status','=', 1]
        ])->get()->toArray();
        $count_sale_tcredito = Salesrogercode::select(DB::raw("COUNT(tcredito) as CountOfTcredito"))
        ->where([
            ['aperturacaja_id', $id],
            ['tcredito','!=' , 0],
            ['status','=', 1]
        ])->get()->toArray();*/

        /************* COUNT ABONOS TOTAL *******************/
        /*$count_abono_efectivo = Paymentmoneyrogercode::select(DB::raw("COUNT(efectivo) as CountOfEfectivo"))
        ->where([
            ['aperturacaja_id', $id],
            ['efectivo','!=' , 0],
        ])->get()->toArray();
        $count_abono_transferencia = Paymentmoneyrogercode::select(DB::raw("COUNT(transferencia) as CountOfTransferencia"))
        ->where([
            ['aperturacaja_id', $id],
            ['transferencia','!=' , 0],
        ])->get()->toArray();
        $count_abono_tdebito = Paymentmoneyrogercode::select(DB::raw("COUNT(tdebito) as CountOfTdebito"))
        ->where([
            ['aperturacaja_id', $id],
            ['tdebito','!=' , 0],
        ])->get()->toArray();
        $count_abono_tcredito = Paymentmoneyrogercode::select(DB::raw("COUNT(tcredito) as CountOfTcredito"))
        ->where([
            ['aperturacaja_id', $id],
            ['tcredito','!=' , 0],
        ])->get()->toArray();*/
        /**************************RETIROS DE EFECTIVO********************************************************* */
        /*$SumRetiros = Cash_withdrawalsrogercode::where([
            ['aperturacaja_id', $id],
            ['status','=' , 1],
        ])->sum('cantidad');
        $count_retiros = Cash_withdrawalsrogercode::select(DB::raw("COUNT(aperturacaja_id) as CountOfretiros"))
        ->where([
            ['aperturacaja_id', $id],
            ['cantidad','!=' , 0],
            ['status','=' , 1],
        ])->get()->toArray();*/
        /****************************************************************************************************** */
        $totalesGlobal = $this->getTotales($id);
        //$sumRetiros = $formatCantidad->format_cantidad($showTotales['retirosSum']);
        /****************************************************************************************************** */
        return response()->json([
            'status'=>1,
            'message'=>'success',
            'data'=>$data,
            'countsaleefectivo'=> $totalesGlobal['countSaleEfectivo'],//$count_sale_efectivo,
            'countsaletransferencia'=> $totalesGlobal['countSaleTransferencia'],//$count_sale_transferencia,
            'countsaletdebito'=> $totalesGlobal['countSaleTdebito'],//$count_sale_tdebito,
            'countsaletcredito' => $totalesGlobal['countSaleTcredito'],//$count_sale_tcredito,
            'countabonoefectivo'=> $totalesGlobal['countAbonoEfectivo'],//$count_abono_efectivo,
            'countabonotransferencia'=> $totalesGlobal['countAbonoTransferencia'],//$count_abono_transferencia,
            'countabonotdebito'=> $totalesGlobal['countAbonoTdebito'],//$count_abono_tdebito,
            'countabonotcredito' => $totalesGlobal['countAbonoTcredito'],//$count_abono_tcredito,
            'sumaRetiros'=> $totalesGlobal['retirosSum'], //$SumRetiros,
            'countRetiros'=> $totalesGlobal['countRetiros'],// $count_retiros
        ]);    
    }

    public function generateCashDetailPdf($cajaId) 
    {
        try {
            $caja = $cajaId;
            $data = DB::table('aperturacajas as ap')
            ->join('users as us', 'ap.user_id', '=', 'us.id')
            ->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
            ->select('us.name','ap.status_apertura','ap.cantidad_inicial','ap.cantidad_final',
            'ap.id as aperturaId', 'ap.created_at','ap.status','ap.fecha_hora_cierre','cor.ventaefectivo',
            'cor.ventatransferencia','cor.ventatdebito','cor.ventatcredito','cor.abono',
            'cor.abonoefectivo','cor.abonotransferencia','cor.abonotdebito','cor.abonotcredito')
            ->where('ap.id','=',$caja)
            ->get();
            $totales = $data->map(function($tot){
                $formatCantidad = new metodosrogercodeController();
                $moneytotal = $tot->cantidad_inicial+$tot->ventaefectivo+$tot->ventatransferencia+$tot->ventatdebito+$tot->ventatcredito+$tot->abono;
                $onlytotal = $tot->ventaefectivo+$tot->ventatransferencia+$tot->ventatdebito+$tot->ventatcredito+$tot->abono;
                return [
                    'usernamecash' => $tot->name,
                    'created_at' => Carbon::parse($tot->created_at)->toDateString(),
                    'cantidad_inicial' => $formatCantidad->format_cantidad($tot->cantidad_inicial),
                    'ventaefectivo' => $formatCantidad->format_cantidad($tot->ventaefectivo),
                    'ventatransferencia' => $formatCantidad->format_cantidad($tot->ventatransferencia),
                    'ventatdebito' => $formatCantidad->format_cantidad($tot->ventatdebito),
                    'ventatcredito' => $formatCantidad->format_cantidad($tot->ventatcredito),
                    'abonoefectivo' => $formatCantidad->format_cantidad($tot->abonoefectivo),
                    'abonotransferencia' => $formatCantidad->format_cantidad($tot->abonotransferencia),
                    'abonotdebito' => $formatCantidad->format_cantidad($tot->abonotdebito),
                    'abonotcredito' => $formatCantidad->format_cantidad($tot->abonotcredito),
                    'moneyTotal' => $formatCantidad->format_cantidad($moneytotal),
                    'onlytotal' => $formatCantidad->format_cantidad($onlytotal),
                    //'sumAbonoDebito' => $formatCantidad->format_cantidad($tot->sumAbonoDebito),
                ];
            });
            $formatCantidad = new metodosrogercodeController();
            $showTotales = $this->getTotales($caja);
            $sumRetiros = $formatCantidad->format_cantidad($showTotales['retirosSum']);
            /**************'********************************* */           
            //$formatCantidad = new settingsrogercodeController();
            //dd($formatCantidad->company());
            ///$data = $formatCantidad->company();
            ///$data['cliente'] = "new cliente";
            //dd($data);
            //dd($data['nombre']);
            $pdf = PDF::loadView('cashRegister/pdf/pdfcashdetail', compact('caja','totales','showTotales','sumRetiros'));//,compact('getventa','detalles','dataEmpresa','totales'));
            $pdf->setPaper([0, 0, 226.772, 566.929]); //// Width: 80mm, Height: 297mm
            $pdf->render();
            return $pdf->stream('reporte_caja.pdf'); 
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function getTotales($id)
    {
        /************* COUNT ABONOS TOTAL *******************/
        $count_sale_efectivo = Salesrogercode::select(DB::raw("COUNT(efectivo) as CountOfEfectivo"))
        ->where([
            ['aperturacaja_id', $id],
            ['efectivo','!=' , 0],
            ['status','=', 1]
        ])->get();
        $count_sale_transferencia = Salesrogercode::select(DB::raw("COUNT(transferencia) as CountOfTransferencia"))
        ->where([
            ['aperturacaja_id', $id],
            ['transferencia','!=' , 0],
            ['status','=', 1]
        ])->get();
        $count_sale_tdebito = Salesrogercode::select(DB::raw("COUNT(tdebito) as CountOfTdebito"))
        ->where([
            ['aperturacaja_id', $id],
            ['tdebito','!=' , 0],
            ['status','=', 1]
        ])->get();
        $count_sale_tcredito = Salesrogercode::select(DB::raw("COUNT(tcredito) as CountOfTcredito"))
        ->where([
            ['aperturacaja_id', $id],
            ['tcredito','!=' , 0],
            ['status','=', 1]
        ])->get();
        /************* COUNT ABONOS TOTAL *******************/
        $count_abono_efectivo = Paymentmoneyrogercode::select(DB::raw("COUNT(efectivo) as CountOfEfectivo"))
        ->where([
            ['aperturacaja_id', $id],
            ['efectivo','!=' , 0],
        ])->get();
        $count_abono_transferencia = Paymentmoneyrogercode::select(DB::raw("COUNT(transferencia) as CountOfTransferencia"))
        ->where([
            ['aperturacaja_id', $id],
            ['transferencia','!=' , 0],
        ])->get();
        $count_abono_tdebito = Paymentmoneyrogercode::select(DB::raw("COUNT(tdebito) as CountOfTdebito"))
        ->where([
            ['aperturacaja_id', $id],
            ['tdebito','!=' , 0],
        ])->get();
        $count_abono_tcredito = Paymentmoneyrogercode::select(DB::raw("COUNT(tcredito) as CountOfTcredito"))
        ->where([
            ['aperturacaja_id', $id],
            ['tcredito','!=' , 0],
        ])->get();
        /**************************RETIROS DE EFECTIVO********************************************************* */
        $countRetiros = Cash_withdrawalsrogercode::select(DB::raw("COUNT(aperturacaja_id) as CountOfretiros"))
        ->where([
            ['aperturacaja_id', $id],
            ['cantidad','!=' , 0],
            ['status','=' , 1],
        ])->get();
        $SumRetiros = Cash_withdrawalsrogercode::where([
            ['aperturacaja_id', $id],
            ['status','=' , 1],
        ])->sum('cantidad');
        
        $array = [
            "retirosSum" => $SumRetiros,
            "countRetiros" => $countRetiros[0]->CountOfretiros,
            "countSaleEfectivo" => $count_sale_efectivo[0]->CountOfEfectivo,
            "countSaleTransferencia" => $count_sale_transferencia[0]->CountOfTransferencia,
            "countSaleTdebito" => $count_sale_tdebito[0]->CountOfTdebito,
            "countSaleTcredito" => $count_sale_tcredito[0]->CountOfTcredito,
            "countAbonoEfectivo" => $count_abono_efectivo[0]->CountOfEfectivo,
            "countAbonoTransferencia" => $count_abono_transferencia[0]->CountOfTransferencia,
            "countAbonoTdebito" => $count_abono_tdebito[0]->CountOfTdebito,
            "countAbonoTcredito" => $count_abono_tcredito[0]->CountOfTcredito,
        ];

        return $array;

    }

}
