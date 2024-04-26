@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>REPORTE DE VENTAS</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
		  <div class="card-header border-0">
            <form id="get-date-form">
            @csrf
            <div class="row">
                <div class="col-md-5">
                    <label for="" class="form-label text-black">Fecha inicio</label>
                    <input type="date" class="form-control" name="date_start" id="">
                </div>
                <div class="col-md-5">
                    <label for="" class="form-label text-black">Fecha final</label>
                    <input type="date" class="form-control" name="date_end" id="">
                </div>
                <div class="col-md-2">
                    <div style="margin-top:30px;">
                        <button type="button" class="btn btn-primary" id="btn-send-date">Aceptar</button>
                    </div>
                </div>
            </div>
            </form>
			  <!--div style="float:right; margin-right: 6px;">
				  <button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#newproduct">
            <i class="bi bi-person"></i> Agregar producto 
				  </button>
			  </div>-->
		  </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="">
            <thead>
              <tr>
                <th class="text-center"><i class="bi bi-gear"></i></th>
                <th scope="col">Venta efectivo</th>
                <th scope="col">Venta credito</th>
                <th scope="col">Venta debito</th>
                <th scope="col">Venta ransferencia</th>
                <th scope="col">Abono</th>
                <th scope="col">Abono efectivo</th>
                <th scope="col">Abono credito</th>
                <th scope="col">Abono debito</th>
                <th scope="col">Abono ransferencia</th>
              </tr>
            </thead>
            <tbody id="tbody">
            </tbody>
            <tfoot id="tfoot">
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/reports/report-sale-index.js')}}" type="module"></script>
@endsection