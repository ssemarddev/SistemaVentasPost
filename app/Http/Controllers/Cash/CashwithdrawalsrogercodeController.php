<?php

namespace App\Http\Controllers\Cash;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cash\Cash_withdrawalsrogercode;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Cash\Cash_registerrogercode;
use App\Models\Cash\Cash_courtrogercode;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Facades\Gate;

class CashwithdrawalsrogercodeController extends Controller
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
        //$getApertura = DB::table('aperturacajas as ape')
        //->join('users as us', 'ape.user_id', '=', 'us.id')
        //->join('corte_cajero_dia as cor', 'ape.id', '=', 'cor.apertura_id')
        //->select('ape.*', 'us.name', 'cor.ventaefectivo')
        //->where([
            //["ape.status_apertura","=","Abierta"]
        //])
        //->get();
        Gate::authorize('hasAccess','caja_retiros.index');
        $getApertura = $this->getRegApertura(0);
        return view('cashRegister.cashWithdrawals.index',compact('getApertura'));
    }

    public function getRegApertura($aparturaId)
    {
        if ($aparturaId == 0) {
            $getApertura = DB::table('aperturacajas as ape')
            ->join('users as us', 'ape.user_id', '=', 'us.id')
            ->join('corte_cajero_dia as cor', 'ape.id', '=', 'cor.apertura_id')
            ->select('ape.*', 'us.name', 'cor.ventaefectivo')
            ->where([
                //["cor.fecha","=","$this->datenow"],
                ["ape.status_apertura","=","Abierta"]
            ])
            ->get();
        }
        if ($aparturaId != 0) {
            $getApertura = DB::table('aperturacajas as ape')
            ->join('users as us', 'ape.user_id', '=', 'us.id')
            ->join('corte_cajero_dia as cor', 'ape.id', '=', 'cor.apertura_id')
            ->select('ape.*', 'us.name', 'cor.ventaefectivo')
            ->where([
                //["cor.fecha","=","$this->datenow"],
                ["ape.id","=",$aparturaId],
                ["ape.status_apertura","=","Abierta"]
            ])
            ->get();
        }
        return $getApertura;
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
                'apertura' => 'required',
                'cash' => 'required',
                'concepto' => 'required',
            ];
            $messages = [
                'apertura.required' => 'El id apertura es requerido',
                'cash.required' => 'La cantidad es requerida',
                'concepto.required' => 'El concepto es requerido',
            ];
            
            $validator = Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 0,
                    "message" => "Tienes campos vacios",
                    "errores" => $validator->errors()->all(),
                ]);
            }

            $getApertura = $this->getRegApertura($request->apertura);

            if ($request->cash > $getApertura[0]->ventaefectivo ) {
                return response()->json([
                    'status'=>0,
                    'message'=>'Ocurrio un error, La cantidad que ingreso supera a la cantidad que en caja hay',
                ]);
            }

            DB::beginTransaction();

            $id_user= Auth::user()->id;
            $currentDateTime = Carbon::now();
            $currentDateTimeString = $currentDateTime->toDateTimeString();
            $currentDateString = $currentDateTime->toDateString();
            $currentTimeString = $currentDateTime->toTimeString();

            $cashwith = new Cash_withdrawalsrogercode(); 
            $cashwith->user_id = $id_user;
            $cashwith->aperturacaja_id = $request->apertura;
            $cashwith->cantidad = $request->cash;
            $cashwith->concepto = $request->concepto;
            $cashwith->fecha = $currentDateString;
            $cashwith->hora = $currentTimeString;
            $cashwith->status = true;
            $cashwith->save();

            /*$cashUpdateReg = Cash_courtrogercode::where([
                ['apertura_id', $request->apertura],
                ['status', 1],
            ])->first();
            $newCashEfecivo = $cashUpdateReg->ventaefectivo - $request->cash;
            $cashUpdateReg->ventaefectivo =  $newCashEfecivo;
            $cashUpdateReg->save();*/

            DB::commit();
            return response()->json([
                "status" => 1,
                "message" => "Retiro realizado con exito"
                //"total" => $getApertura[0]->ventaefectivo,
                //"apertura" => $newCashEfecivo
            ]);
        } catch (\Throwable $th) {
            DB::rollback();
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
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
        $data = DB::table('cash_withdrawals as cas')
        //->join('users as us', 'ap.user_id', '=', 'us.id')
        //->join('corte_cajero_dia as cor', 'ap.id', '=', 'cor.apertura_id')
        ->select('cas.*')
        ->orderBy('cas.id','desc')
        ->get();
        return Datatables::of($data)->addIndexColumn()
            ->addColumn('showcantidad', function($data){
                $cant = '<span class="badge bg-success"> $'.number_format($data->cantidad, 0, ',', '.').'</span>';
                return $cant;
            })
            ->rawColumns(['showcantidad'])
            ->make(true);
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
