<?php

namespace App\Http\Controllers\Warehouse;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;

class InventoryrogercodeController extends Controller
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
        
        return view('warehouse.inventory.index');  
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
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        //$products = Productos::all();
        //return view("admin.productos.inventory.inventory-list.index", ["products"=>$prod]);

        if ($request->ajax()) {
            $data= DB::table('productos as pr')
            ->leftJoin('detalle_ventas as de', 'pr.id', '=', 'de.producto_id')
            ->select('pr.id', 'pr.codigo', 'pr.nombre', 'pr.stock', DB::raw('SUM(de.cantidad) as vendidos'), DB::raw('SUM(de.subtotal) as venta_acumulada'), 'pr.estado', 'de.producto_id')
            ->groupBy('pr.id')
            ->get();
            return Datatables::of($data)
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
                ->addColumn('pvendidos', function($data){
                    if ($data->vendidos == "") {
                        $vent = '<span class="">0</span>';
                    }else{
                        $vent= '<span class="">'.number_format($data->vendidos).'</span>';
                    }
                    return $vent;
                })
                ->addColumn('pventa_acumulada', function($data){
                    if ($data->venta_acumulada == "") {
                        $acom = '<span class="">0</span>';
                    }else{
                        $acom = '<span class="">'.number_format($data->venta_acumulada, 0, ',', '').'</span>';
                    }
                    return $acom;
                })
               /*->addColumn('action', function($data){
                    $btn = '
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots-vertical"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li><a class="dropdown-item" type="button" onclick="Editar('.$data->id.');"><i class="bi bi-pen"></i>Editar</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-trash"></i>Eliminar</a></li>
                  </ul>
                    ';
                    return $btn;
                })*/
                ->rawColumns(['status','pstock','pvendidos','pventa_acumulada'])
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
    public function destroy($id)
    {
        //
    }
}
