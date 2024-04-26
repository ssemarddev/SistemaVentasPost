<?php

namespace App\Http\Controllers\Sales;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use Mike42\Escpos\Printer;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\CapabilityProfile;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;

use PDF;

use App\Http\Controllers\Metodosgenerales\metodosrogercodeController;

class PrinterrogercodeController extends Controller
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
        //
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
   {    try {
            //$namePrinter = "POS-58";//localhost
            $namePrinter = "POS-80";//Test
            //// Create a new printer object
            $connector = new WindowsPrintConnector($namePrinter);
            $printer = new Printer($connector);

            //// Print ticket content
            $getventa=DB::table('ventas as v')
            ->join('clientes as c', 'v.cliente_id','=','c.id')
            ->select('v.id','c.nombres','v.tipo_comprobante','v.efectivo','v.transferencia','v.tdebito','v.tcredito','v.abono','v.tipo_abono','v.tipo_pago','v.num_comprobante','v.total_venta','v.numero_venta_manual', 'v.created_at as fechaventa')
            ->where('v.id','=',$request->ventaId)
            ->get();
            $detalles=DB::table('detalle_ventas as d')
            ->join('productos as p','d.producto_id','=','p.id')
            ->select('p.nombre','p.codigo','d.cantidad','d.precio_venta','d.subtotal')
            ->where('d.venta_id','=',$request->ventaId)
            ->get();
            // Print header
            //$printer->text("Ticket of Sale\n");
            $printer->text("Importadora y distribuidora bendito emporio uno spa\n");
            $printer->text("COLON 989 - CURICO\n");
            $printer->text($getventa[0]->fechaventa. "\n");

            $printer->text("-----------------------------\n");
            $printer->setJustification(Printer::JUSTIFY_LEFT);
            $printer->text("Cantidad   Nombre   Importe\n");
            // Set maximum widths for each column
            $quantityWidth = 8;
            $productWidth = 15;
            $priceWidth = 8;
            // Print items
            foreach ($detalles as $item) {
                /*$printer->setJustification(Printer::JUSTIFY_LEFT);
                $printer->text(sprintf(
                    "%-10s%-10s%s\n",
                    $item->cantidad,
                    $item->nombre,
                    $item->subtotal
                ));*/
                /*$printer->text(
                    str_pad($item->cantidad, 6, ' ', STR_PAD_RIGHT) .
                    str_pad($item->nombre, 8, ' ', STR_PAD_RIGHT) .
                    $item->subtotal . "\n"
                );*/
                $quantity = str_pad($item->cantidad, $quantityWidth, ' ', STR_PAD_RIGHT);
                $product = str_pad($item->nombre, $productWidth, ' ', STR_PAD_RIGHT);
                $price = str_pad($item->subtotal, $priceWidth, ' ', STR_PAD_RIGHT);

                $printer->text("$quantity $product    $price\n");
            }
            // Print footer
            $printer->text("-----------------------------\n");
            $printer->text("Total: $" . number_format($getventa[0]->total_venta, 0) . "\n");
            $printer->text("-----------------------------\n");
            $printer->feed(2); //Agregamos 2 saltos de linea

            //// Cut the ticket
            $printer->cut();
            //// Close the printer connection
            $printer->close();

            return response()->json([
                'status' => 1,
                "message" => "El ticket se genero con exito",
               // "test" => $request->ventaId,
            ]); 
        } catch (\Throwable $th) {
            $m = 'Excepción capturada: '.$th->getMessage(). "\n";
            return response()->json([
                'status'=>0,
                'message'=>'Ocurrio un error, Vuelve a intentarlo',
                "data"=> $th,
                'error' => (array) $m
            ]);
        }
    }

    public function generatePdf($ventaId)
    {
        try {
            
            $getventa=DB::table('ventas as v')
            ->join('clientes as c', 'v.cliente_id','=','c.id')
            ->select('v.id','c.nombres','v.tipo_comprobante','v.efectivo','v.transferencia','v.tdebito','v.tcredito','v.abono','v.tipo_abono','v.tipo_pago','v.num_comprobante','v.total_venta','v.numero_venta_manual', 'v.created_at as fechaventa', 'v.cambio','v.recibido')
            ->where('v.id','=',$ventaId)
            ->get();
            $detalles=DB::table('detalle_ventas as d')
            ->join('productos as p','d.producto_id','=','p.id')
            ->select('p.nombre','p.codigo',DB::raw("FORMAT(d.cantidad, 0, 'es_CL') AS cantidad"),'d.precio_venta',DB::raw("FORMAT(d.subtotal, 0, 'es_CL') AS subtotal"))
            ->where('d.venta_id','=',$ventaId)
            ->get();

            $dataEmpresa = [
                "nombre" => "Importadora y Distribuidora Bendito Emporio uno spa",
                "direccion" => "COLON 989 - CURICO",
                "telefono" => "",
                "email" => "lmillao@hotmail.com",
                "fecha" => $getventa[0]->fechaventa,
                "numcomprobante" => $getventa[0]->numero_venta_manual,
                "tipocomprobante" => $getventa[0]->tipo_comprobante,
                "cliente" => $getventa[0]->nombres,
            ];
            $formatCantidad = new metodosrogercodeController();
            $totales = [
                "totalventa" => $formatCantidad->format_cantidad($getventa[0]->total_venta),
                "efectivo" => $formatCantidad->format_cantidad($getventa[0]->efectivo),
                "transferencia" => $formatCantidad->format_cantidad($getventa[0]->transferencia),
                "tdebito" => $formatCantidad->format_cantidad($getventa[0]->tdebito),
                "tcredito" => $formatCantidad->format_cantidad($getventa[0]->tcredito),
                "cambio" => $formatCantidad->format_cantidad($getventa[0]->cambio),
                "recibido" => $formatCantidad->format_cantidad($getventa[0]->recibido),
            ];
            //dd($dataEmpresa);
            $pdf = PDF::loadView('sales/sale/pdfticket',compact('getventa','detalles','dataEmpresa','totales'));
            // Set the paper size for the ticket
            $pdf->setPaper([0, 0, 226.772, 566.929]); //// Width: 80mm, Height: 297mm
            //$pdf->setPaper([0, 0, 178.474, 279.4]); // Width: 78mm, Height: 279.4mm (Approximately 11 inches)
            //Set the paper size for the ticket
            //$pdf->setPaper([0, 0, 74.8, 279.4], 'portrait'); // Width: 78mm, Height: 297mm
            $pdf->render();
            //return $pdf->download('ejemplo.pdf');
            return $pdf->stream('sales_ticket.pdf'); 
            // Save the PDF file
            //$pdf->stream('ticket.pdf', ['Attachment' => false]);
        } catch (\Throwable $th) {
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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
