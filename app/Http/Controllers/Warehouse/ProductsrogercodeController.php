<?php

namespace App\Http\Controllers\Warehouse;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Warehouse\Productsrogercode;
use App\Models\Warehouse\Categoryrogercode;
use App\Models\Warehouse\Subcategoryrogercode;
use App\Models\Shopping\Providersrogercode;
use App\Models\Sales\Tipounidadrogercode;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class ProductsrogercodeController extends Controller
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
        $categ= Categoryrogercode::all();
        $subcateg= Subcategoryrogercode::all();
        $proveedor= Providersrogercode ::all();
        $tipoUnidad = Tipounidadrogercode::all();
        return view('warehouse.products.index',["categ"=>$categ, "subcateg"=>$subcateg, "proveedor"=>$proveedor,"tipoUnidad"=>$tipoUnidad]);  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $rules = [
            'codigo' => 'required',
            'nombre' => 'required',
            //'descripcion' => 'required',
            'id_categ' => 'required',
            'id_subcateg' => 'required',
            'id_proveedor' => 'required',
            'precio_costo' => 'required',
            'precio_venta' => 'required',
            'stock' => 'required',
            'stock_min' => 'required',
        ];
        $messages = [
            'nombre.required' => 'El nombre es requerido',
            'id_categ.required' => 'La categoria es requerida',
            'id_subcateg.required' => 'La subcategoria es requerida',
            'codigo.required' => 'El codigo del producto es requerido',
            'id_proveedor.required' => 'El proveedor es requerido',
            //'codigo.unique' => 'EL codigo para el producto ya existe, agrege otro nuevo codigo para el producto',
            'precio_costo.required' => 'El precio de costo es requerido',
            'precio_venta.required' => 'El precio de venta es requerido',
            'stock.required' => 'El stock del producto es requerido',
            'stock_min.required' => 'El stock minimo es producto es requerido',
            'articulo_des.required' => 'Debes de poner el descuento, si este no lleva descuento solo agrega un 0' 
        ];
            
        $validator = Validator::make($request->all(), $rules, $messages);
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                "message" => "Ocurrio un error",
                "errores" => $validator->errors()->all(),
            ]);
        }

        $url = '';
        if ($request->file('image')) {
            $archivo = $request->file('image');
            $url = 'pro'.Str::random(10).'.png';
            $path = public_path('/images/products');
            $archivo->move($path, $url); 
        }

        $pcant2 = 0;
        $pventa2 = 0;
        if ($request->mayoreoCantidad2 != null) {
            $pcant2 = $request->mayoreoCantidad2;
        }
        if ($request->mayoreoPrecioVenta2 != null) {
            $pventa2 = $request->mayoreoPrecioVenta2;
        }

        $id_user= Auth::user()->id;
        if ($request->id>0) { 
            $producto= Productsrogercode::find($request->id);
            $producto->codigo= $request->codigo;
            $producto->id_categ= $request->id_categ;
            $producto->id_proveedor= $request->id_proveedor;
            $producto->id_subcateg= $request->id_subcateg;
            $producto->tipounidad_id = $request->tipoUnidad;
            $producto->nombre= $request->nombre;
            $producto->descripcion= $request->descripcion;
            $producto->impuestos= $request->impuestos;
            //$producto->estado= $request->estado;
            $producto->precio_costo= $request->precio_costo;
            $producto->precio_venta= $request->precio_venta;
            $producto->stock= $request->stock;
            $producto->stock_min= $request->stock_min;
            $producto->mayoreo_cantidad = $request->mayoreoCantidad;
            $producto->mayoreo_pventa = $request->mayoreoPrecioVenta;
            $producto->mayoreo_cantidad2 = $pcant2;//$request->mayoreoCantidad2;
            $producto->mayoreo_pventa2 = $pventa2;//$request->mayoreoPrecioVenta2;
            //$producto->maneja_inventario= $request->maneja_inventario; 
            $producto->imagen= $url;
            $producto->save();
        }else{
            $producto= new Productsrogercode();
            $producto->user_id = $id_user;
            $producto->codigo= $request->codigo;
            $producto->id_categ= $request->id_categ;
            $producto->id_proveedor= $request->id_proveedor;
            $producto->id_subcateg= $request->id_subcateg;
            $producto->tipounidad_id = $request->tipoUnidad;
            $producto->nombre= $request->nombre;
            $producto->descripcion= $request->descripcion;
            $producto->impuestos= $request->impuestos;
            $producto->estado= true;//$request->estado;
            $producto->precio_costo= $request->precio_costo;
            $producto->precio_venta= $request->precio_venta;
            $producto->stock= $request->stock;
            $producto->stock_min= $request->stock_min;
            $producto->mayoreo_cantidad = $request->mayoreoCantidad;
            $producto->mayoreo_pventa = $request->mayoreoPrecioVenta;
            $producto->mayoreo_cantidad2 = $pcant2; //$request->mayoreoCantidad2;
            $producto->mayoreo_pventa2 = $pventa2; //$request->mayoreoPrecioVenta2;
            $producto->maneja_inventario= $request->maneja_inventario;
            $producto->imagen= $url;
            $producto->save();
        } 
        //return  redirect()->back();  
        return response()->json([
            'status'=>1,
            "message" => "Se agrego el producto con exito",
        ]);


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
            $data = Productsrogercode::orderBy('id','desc');
            return Datatables::of($data)->addIndexColumn()
                ->addColumn('status', function($data){
                    if ($data->estado == 1) {
                        $status = '<span class="badge bg-success">Activo</span>';
                    }else{
                        $status= '<span class="badge bg-danger">Inactivo</span>';
                    }
                    return $status;
                })
                ->addColumn('costo', function($data){
                    $precio  = $data->precio_costo; 
                    $cost = '$'.number_format($precio, 0, ',', '.');
                    return $cost;
                })
                ->addColumn('venta', function($data){
                    $ve  = $data->precio_venta; 
                    $vent = '$'.number_format($ve, 0, ',', '.');
                    return $vent;
                })
                ->addColumn('pstock', function($data){
                    if ($data->stock <= $data->stock_min) {
                        $stock= '<span class="badge bg-danger">'.$data->stock.'</span>';
                    }else{
                        $stock= '<span class="badge bg-info">'.$data->stock.'</span>';
                    }
                    return $stock;
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
                ->rawColumns(['status','costo','venta','pstock','date','action'])
                ->make(true);
        }
    }

    public function getById(Request $request) {
        if ($request->ajax()) {
            $provider = Productsrogercode::find($request->id);
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
