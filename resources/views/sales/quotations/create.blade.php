@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>NUEVA COTIZACION</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
      <div class="card-body">
        <div class="row mt-2">
          <div class="col-md-8">
            <div class="d-grid d-md-flex">
              <input type="text" class="form-control me-md-3" placeholder="Codigo" aria-label="State">
              <button class="btn btn-secondary me-md-2" type="button" disabled><i class="bi bi-upc"></i></button>
              <button class="btn btn-success me-md-2" type="button" data-bs-toggle="modal" data-bs-target="#search_products"><i class="bi bi-search"></i></button>
              <button class="btn btn-primary" type="button" disabled><i class="bi bi-plus-circle-fill"></i></button>
            </div>
            <!--div class="row">
              <div class="col-md-5">
                <input type="text" class="form-control" placeholder="Codigo" aria-label="State">
              </div>
              <div class="col-md-2 text-end">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#search_products" ><i class="bi bi-plus-circle-fill"></i></button>
              </div>
            </div>-->
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
                        <td>{{$row->cod}}</td>
                        <td> 
                          <input type="text" id="cantidad{{$row->id}}" class="form-control" size="4" onkeydown="fnInputEnter(event,'{{$row->id}}')" onchange="UpdateCarrito('{{$row->id}}');" value="{{$row->cantidad}}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
                        </td>
                        <td>{{$row->nombre}}</td> 
                        <td>
                          <input type="text" id="precio{{$row->id}}" class="form-control" size="5" onkeydown="fnInputEnter(event,'{{$row->id}}')" onchange="UpdateCarrito('{{$row->id}}');" value="{{$row->precio}}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"> 
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
            </div>

          </div>
          <div class="col-md-4">
            <div class="">
              <div class="">
                <form class="row g-3" id="my_form" action="{{route('quotations.create')}}" method="POST">
                  @csrf
                  <!--div class="col-md-12">
                    <div class="d-grid gap-2 d-flex ">
                    <select class="form-select select-single me-md-2" name="id_cliente" id="id_cliente"  aria-label="Default select example" >
                      <option value="">Buscar Cliente...</option>
                      @foreach ($clientes as $row)
                      <option value="{{$row->id}}" >{{$row->nombres}}</option> 
                      @endforeach 
                    </select>
                    <button class="btn btn-primary" type="button"><i class="bi bi-plus-square-fill"></i></button>
                    </div>
                  </div>-->
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
                    <input type="text" name="celular_cliente" id="celular_cliente" class="form-control" placeholder="Celular cliente" disabled>
                  </div>
                  <div class="col-md-6">
                    @php
                      $cod='COT';$serie=1; 
                      ($codserie>0)? $serie=$codserie+1: null;
                    @endphp
                    <input type="hidden" id="serie" name="serie" value="{{$serie}}">
                    <input type="text" class="form-control" name="n_cotizacion" id="n_cotizacion" value="{{$cod}}-{{$serie}}" placeholder="N° cotización..." readonly>
                  </div>
                  <div class="col-md-6">
                    <input type="text" class="form-control" name="numeroCotizacionManual" id="numeroCotizacionManual" placeholder="Ingresar numero ..." >
                  </div>
                  <div class="col-md-12">
                    <select name="validez" id="validez"  class="form-control" required>
                      <option value="">Validez...</option>
                      <option value="5">5 DÍAS</option> 
                      <option value="10">10 DÍAS</option> 
                      <option value="15">15 DÍAS</option> 
                      <option value="20">20 DÍAS</option> 
                    </select> 
                  </div>
                  <div class="col-md-12">
                    <label for=""><b>Servicio</b> </label>
                    <input type="text" class="form-control " name="servicio" id="servicio"  placeholder="servicio..." >
                  </div>
                  <div class="col-md-6">
                    <label for=""><b>Abono</b> </label>
                    <input type="text" class="form-control " name="abono" id="abono"  placeholder="0" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" requied>
                  </div>
                  <div class="col-md-6">
                    <label for=""><b>A pagar</b> </label>
                    <input type="text" class="form-control " name="total" id="total" value="{{$totalp}}" readonly placeholder="0" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" hidden required>
                    <input type="text" class="form-control " name="apagar" id="apagar" placeholder="0" readonly onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" required>
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
	@include('sales.quotations.modal_products') 
	@include('sales.quotations.modal_quotation_exit') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/sales/rogercode-quotation-index.js')}}"></script>
@endsection