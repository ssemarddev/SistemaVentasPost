@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>NUEVA VENTA</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
      <div class="card-body">
        <div class="row mt-2">
          <div class="col-md-8">
            <div class="d-grid d-md-flex">
              <input type="text" class="form-control me-md-3" placeholder="Codigo" aria-label="State">
              <button class="btn btn-secondary me-md-2" type="button" disabled><i class="bi bi-upc"></i></button>
              <button class="btn btn-primary me-md-2" type="button" data-bs-toggle="modal" data-bs-target="#search_products" title="Buscar producto"><i class="bi bi-search"></i></button>
              <button class="btn btn-warning me-md-2 text-white" type="button" data-bs-toggle="modal" data-bs-target="#showPaymentModal" title="Pagar abono"><b>A</b></button>
              <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#addProductModal" title="Agregar producto"><i class="bi bi-plus-circle-fill"></i></button>
            </div>
            <div class="table-responsive mt-2"> 
              <table id="tabla" class="table table-bordered table-striped table-hover table-sm">
                  <thead>
                      <tr>  
                          <th>Cod</th> 
                          <th>Cant</th> 
                          <th>Producto</th>  
                          <th>Unidad</th> 
                          <th>Total</th> 
                          <th class="text-center"><i class="bi bi-trash text-danger"></i></th>
                      </tr>
                  </thead>
                  <tbody id="tbody"> 
                    @php $totalp=0; @endphp 
                    @foreach ($carrito as $row)
                    @php  $totalp+=$row->total; @endphp  
                      <tr> 
                        <td>{{$row->codigo}}</td>
                        <td> 
                          <!--input type="text" id="cantidad{{$row->id}}" onkeydown="inputChanged(event,'{{$row->id}}')" class="form-control" size="4" onchange="UpdateCarrito('{{$row->id}}');" value="{{$row->cantidad}}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >-->
                          <input type="text" id="cantidad{{$row->id}}" onkeydown="fnInputEnter(event,'{{$row->id}}','cantidad')" data="{{$row}}" class="form-control" size="4" value="{{$row->cantidad}}" onchange="UpdateCarrito('{{$row->id}}','cantidad');" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
                        </td>
                        <td>{{$row->nombre}}</td> 
                        <td>
                          <input type="text" id="precio{{$row->id}}" onkeydown="fnInputEnter(event,'{{$row->id}}','precio')" class="form-control" size="5" onchange="UpdateCarrito('{{$row->id}}','precio');" value="{{$row->precio}}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"> 
                        </td> 
                        <td>${{number_format($row->total, 0, ',', '.') }}</td> 
                        <td> 
                          <button onclick="deleteProd('{{$row->id}}');" class=" btn btn-danger btn-sm bi bi-trash"></button>
                        </td>
                      </tr>
                    @endforeach
                  </tbody> 
              </table>
              <div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  <ul class="list-group d-md-flex">
                     <li class="list-group-item">
                      <span  class=" fw-bold">TOTA: </span><span class="fw-bold" id="totalp">${{number_format($totalp, 0, ',', '.') }}</span>
                     </li>
                  </ul>
                </div>
              </div>
              <!--div class="mt-1">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end ">
                  <ul class="list-group d-md-flex ">
                     <li class="list-group-item ">
                      <span  class=" fw-bold">Transferencia: </span><span class="fw-bold" id="totalp">300.00</span>
                     </li>
                  </ul>
                </div>
              </div>-->
            </div>

          </div>
          <div class="col-md-4">
            <div class="">
              <div class="">
                <form class="row g-3" id="my_form" action="{{route('sales.createventa')}}" method="POST">
                  @csrf
                  <input type="hidden" name="typesale" id="typesale" value="{{$typeSale}}" required>
                  <div class="col-md-10">
                    <select class="form-select select-single" name="id_cliente" id="id_cliente"  required>
                      <option value="">Buscar Cliente...</option>
                      @foreach ($clientes as $row)
                      <option value="{{$row->id}}" data="{{$row}}">{{$row->nombres}}</option> 
                      @endforeach 
                    </select>
                  </div>
                  <div class="col-md-2 text-end">
                    <button class=" btn btn-success bi bi-plus-square-fill" disabled></button>
                  </div>
                  <div class="col-md-12">
                    <input type="email" name="email_cliente" id="email_cliente" class="form-control"  placeholder="Email" disabled>
                  </div>
                  <div class="col-md-6">
                    <input type="text" name="rut_cliente" id="rut_cliente" class="form-control" placeholder="Rut cliente" disabled>
                  </div>
                  <div class="col-md-6">
                    <input type="text" class="form-control" readonly name="numComprobante" id="numComprobante" value="{{$comprobante}}" placeholder="No. Comprobante">
                  </div>
                  <div class="col-md-6">
                    <select name="tipoComprobante" id="tipoComprobante" class="form-select">
                      <option value="" >Seleccionar</option>
                      <option value="COMPROBANTE">COMPROBANTE</option>
                      <option value="BOLETA">BOLETA</option>
                      <option value="FACTURA">FACTURA</option>
                    </select>
                  </div>
                  <div class="col-md-6">
                    <input type="text" class="form-control" name="numeroVentaManual" id="numeroVentaManual" placeholder="Ingresar numero ...">
                  </div>
                  <div class="col-md-12 mt-1">
                    <label for="TipoVenta" class="form-label"><b><small>Tipo de venta</small></b></label>
                    <select id="TipoVenta" class="form-select">
                    <option value="VENTA NORMAL" selected>VENTA NORMAL</option>
                    <option value="CREAR ABONO">CREAR ABONO</option>
                    <option value="PAGAR ABONO" disabled>PAGAR ABONO</option>
                    </select>
                  </div>

                  <div class="col-md-6" id="divContentTipoAbono" style="display: none;"><input type="text" class="form-control" name="showTipoAbono" id="showTipoAbono" placeholder="Tipo de abono"></div>
                  <div class="col-md-6" id="divContentCantAbono" style="display: none;"><input type="text" class="form-control" name="showCantAbono" id="showCantAbono" placeholder="Cantidad"></div>

                  <span class="mt-1"><b><small>Pagos</small></b></span>
                  <div class="col-md-6 mt-2">
                    <select name="tipoPago" id="tipoPago" class="form-select" onchange="changePagos()" required>
                      <option value="EFECTIVO" >EFECTIVO</option>
                      <option value="TRANSFERENCIA">TRANSFERENCIA</option>
                      <option value="T.DEBITO">T.DEBITO</option>
                      <option value="T.CREDITO">T.CREDITO</option>
                      <!--option value="CREAR ABONO">CREAR ABONO</option>
                      <option value="PAGAR ABONO" disabled>PAGAR ABONO</option>-->
                    </select>
                    <select name="otroTipoPago" id="otroTipoPago" class="form-select mt-2" onchange="changeOtroTipoPagos()" style="display: none;">
                      <option value="" >Seleccionar</option>
                      <option value="TRANSFERENCIA">TRANSFERENCIA</option>
                      <option value="T.DEBITO">T.DEBITO</option>
                      <option value="T.CREDITO">T.CREDITO</option>
                    </select>
                  </div>
                  <div class="col-md-6 mt-1">
                    <input type="text" class="form-control " name="total" id="total" value="{{$totalp}}" readonly placeholder="0" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" hidden required>
                    <input type="text" class="form-control " name="apagar" id="apagar" placeholder="0" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" required>
                    <input type="text" class="form-control mt-2" name="cantPagoTarjeta" id="cantPagoTarjeta" placeholder="0" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" style="display: none;" readonly>
                  </div>
                  <div class="col-md-12 mt-1">
                  <button type="button" id="btnAddTipoPago" onclick="addPago();" class="btn badge bg-light text-dark"><i class="bi bi-plus"></i>Agregar pago</button>
                  </div>
                  <div class="d-grid gap-2 col-6 mx-auto">
                    <button type="submit" id="btnSave" class="btn btn-success"><i class="bi bi-folder-plus"></i> Guardar</button>
                  </div>
                </form><!-- End No Labels Form -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <!-- Modal -->
  <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="addProductModalLabel">Nuevo producto</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="saveProduct"> 
            @include('sales.components.addproduct') 
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" id="btnCloseProduct" data-bs-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-primary" id="saveNewProduct">Guardar</button>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
	@include('sales.sale.modal_products') 
	@include('sales.sale.modal_sale_exit') 
	@include('sales.sale.modal_sale_payment_exit') 
	@include('sales.paymentmoney.modal_show_payment_money') 

</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/sales/rogercode-sale-index.js')}}"></script>
  <script src="{{asset('dist/js/sales/rogercode-sale.js')}}" type="module"></script>
  <script src="{{asset('dist/js/sales/rogercode-payment-sale.js')}}" type="module"></script>
@endsection