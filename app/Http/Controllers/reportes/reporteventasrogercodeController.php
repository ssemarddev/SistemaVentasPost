<?php

namespace App\Http\Controllers\reportes;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use App\Models\Sales\Salesrogercode;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use PDF;
use App\Http\Controllers\Metodosgenerales\metodosrogercodeController;

class reporteventasrogercodeController extends Controller
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
        return view('reportes.ventas.index');
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
        //
    }

    /**
     * Display the specified resource.
     *date_start
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        try {
            $rules = [
                'date_start' => 'required|date',
                'date_end' => 'required|date',
            ];
            $messages = [
                'date_start.required' => 'La fecha inicial es requerida',
                'date_end.required' => 'La fecha final es requerida',
            ];

            $validator = Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {  
                return response()->json([
                    'status' => 0,
                    'error'=> $validator->errors()->all(),
                    'message' => 'Debes de seleccionar fecha inicial y final'
                ]);
            }
            $data = DB::table('aperturacajas as ap')
            ->join('users as us', 'ap.user_id', '=', 'us.id')
            ->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
            ->select('us.name','ap.status_apertura','ap.cantidad_inicial','ap.cantidad_final',
            'ap.id as aperturaId', 'ap.created_at','ap.status','ap.fecha_hora_cierre','cor.ventaefectivo',
            'cor.ventatransferencia','cor.ventatdebito','cor.ventatcredito','cor.abono',
            'cor.abonoefectivo','cor.abonotransferencia','cor.abonotdebito','cor.abonotcredito')
            ->whereDate('ap.created_at', '>=', $request->date_start)
            ->whereDate('ap.created_at', '<=', $request->date_end)
            //->where('ap.id','=',$id)
            ->get();

            $dataTotales = DB::table('aperturacajas as ap')
            ->join('users as us', 'ap.user_id', '=', 'us.id')
            ->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
            ->selectRaw('SUM(ap.cantidad_inicial) AS sumCantidadInicial, SUM(cor.ventaefectivo) AS sumVentaEfectivo,
            SUM(cor.ventatransferencia) AS sumVentaTransferencia, SUM(cor.ventatdebito) AS sumVentaDebito, SUM(cor.ventatcredito) AS sumVentaCredito,
            SUM(cor.abono) AS sumAbono, SUM(cor.abonoefectivo) AS sumAbonoEfectivo, SUM(cor.abonotransferencia) AS sumAbonoTransferencia,
            SUM(cor.abonotdebito) AS sumAbonoDebito, SUM(cor.abonotcredito) AS sumAbonoCredito')
            ->whereDate('ap.created_at', '>=', $request->date_start)
            ->whereDate('ap.created_at', '<=', $request->date_end)
            ->get();

            //$sums = YourModel::selectRaw('SUM(column1) as sum1, SUM(column2) as sum2, SUM(column3) as sum3')
            //->get();
            //$total = DB::table('your_table')
            //->whereBetween('created_at', [$startDate, $endDate])
            //->sum('column_to_sum');

            /*$count_sale_efectivo = Salesrogercode::select(DB::raw("COUNT(efectivo) as CountOfEfectivo"))
            ->where([
                ['efectivo','!=' , 0],
            ])->get()->toArray();*/
            return response()->json([
                'status'=>1,
                "reg"=> $data,
                "total" => $dataTotales,
                "dateStart"=>$request->date_start,
                "dateEnd"=>$request->date_end,
            ]);
        } catch (\Throwable $th) {
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
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
    public function generateReportPdf($start,$end)
    {
        $date_start = $start;
        $date_end = $end;
        $datat = DB::table('aperturacajas as ap')
        ->join('users as us', 'ap.user_id', '=', 'us.id')
        ->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
        ->select('us.name','ap.status_apertura','ap.cantidad_inicial','ap.cantidad_final',
        'ap.id as aperturaId', 'ap.created_at','ap.status','ap.fecha_hora_cierre','cor.ventaefectivo',
        'cor.ventatransferencia','cor.ventatdebito','cor.ventatcredito','cor.abono',
        'cor.abonoefectivo','cor.abonotransferencia','cor.abonotdebito','cor.abonotcredito')
        ->whereDate('ap.created_at', '>=', $date_start)
        ->whereDate('ap.created_at', '<=', $date_end)
        ->get();
        //$formatCantidad = new metodosrogercodeController();
        $data = $datat->map(function($resp){ 
        $formatCantidad = new metodosrogercodeController();
            return [ 
            'name' => $resp->name,
            'status_apertura' => $resp->status_apertura,
            'cantidad_inicial' => $resp->cantidad_inicial,
            'cantidad_final' => $resp->cantidad_final,
            'id as aperturaId' => $resp->aperturaId,
            'created_at' => $resp->created_at,
            'status' => $resp->status,
            'fecha_hora_cierre' => $resp->fecha_hora_cierre,
            'ventaefectivo' => $formatCantidad->format_cantidad($resp->ventaefectivo),
            'ventatransferencia' => $formatCantidad->format_cantidad($resp->ventatransferencia),
            'ventatdebito' => $formatCantidad->format_cantidad($resp->ventatdebito),
            'ventatcredito' => $formatCantidad->format_cantidad($resp->ventatcredito),
            'abono' => $formatCantidad->format_cantidad($resp->abono),
            'abonoefectivo' => $formatCantidad->format_cantidad($resp->abonoefectivo),
            'abonotransferencia' => $formatCantidad->format_cantidad($resp->abonotransferencia),
            'abonotdebito' => $formatCantidad->format_cantidad($resp->abonotdebito),
            'abonotcredito' => $formatCantidad->format_cantidad($resp->abonotcredito)
            ];
        });

        //dd($data);
        $dataTotales = DB::table('aperturacajas as ap')
        ->join('users as us', 'ap.user_id', '=', 'us.id')
        ->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
        ->selectRaw('SUM(ap.cantidad_inicial) AS sumCantidadInicial, SUM(cor.ventaefectivo) AS sumVentaEfectivo,
        SUM(cor.ventatransferencia) AS sumVentaTransferencia, SUM(cor.ventatdebito) AS sumVentaDebito, SUM(cor.ventatcredito) AS sumVentaCredito,
        SUM(cor.abono) AS sumAbono, SUM(cor.abonoefectivo) AS sumAbonoEfectivo, SUM(cor.abonotransferencia) AS sumAbonoTransferencia,
        SUM(cor.abonotdebito) AS sumAbonoDebito, SUM(cor.abonotcredito) AS sumAbonoCredito')
        ->whereDate('ap.created_at', '>=', $date_start)
        ->whereDate('ap.created_at', '<=', $date_end)
        ->get();
        $totales = $dataTotales->map(function($tot){
            $formatCantidad = new metodosrogercodeController();
            return [
                'sumCantidadInicial' => $tot->sumCantidadInicial,
                'sumVentaEfectivo' => $formatCantidad->format_cantidad($tot->sumVentaEfectivo),
                'sumVentaTransferencia' => $formatCantidad->format_cantidad($tot->sumVentaTransferencia),
                'sumVentaDebito' => $formatCantidad->format_cantidad($tot->sumVentaDebito),
                'sumVentaCredito' => $formatCantidad->format_cantidad($tot->sumVentaCredito),
                'sumAbono' => $formatCantidad->format_cantidad($tot->sumAbono),
                'sumAbonoEfectivo' => $formatCantidad->format_cantidad($tot->sumAbonoEfectivo),
                'sumAbonoTransferencia' => $formatCantidad->format_cantidad($tot->sumAbonoTransferencia),
                'sumAbonoCredito' => $formatCantidad->format_cantidad($tot->sumAbonoCredito),
                'sumAbonoDebito' => $formatCantidad->format_cantidad($tot->sumAbonoDebito),
            ];
        });

        $pdf = PDF::loadView('reportes/ventas/pdfreport', compact('date_start','date_end','data','totales'));//,compact('id','cotizacion','detalle','totalcotizacion','abonocotizacion','apagar','vendedor','servicio','date_end'));
    
        return $pdf->stream('reporte_ventas.pdf'); 
    }
}
