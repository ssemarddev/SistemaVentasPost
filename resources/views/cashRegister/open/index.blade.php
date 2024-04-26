@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>CAJAS</h4> </a>
  </div>
  <!-- Recent Sales -->
    <div class="col-12">
      <div class="card overflow-auto">
		    <div class="card-header border-0">
			    <div style="float:right; margin-right: 6px;">
				    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#openCaja">
              <i class="bi bi-person"></i> Abrir caja
				    </button>
			    </div>
		    </div>
        <div class="card-body">
          <!--h5 class="card-title">Recent Sales <span>| Today</span></h5>-->
          <div class="table-responsive">
            <table class="table table-striped table-bordered" id="tableCash">
              <thead>
                <tr>
                    <th>Usuario</th> 
                    <th>Fecha</th> 
                    <th>Inicio</th> 
                    <th>Abierta</th> 
                    <th>Fin</th> 
                    <th>Cerrada</th> 
                    <th>Ventas</th> 
                    <th><i class="bi bi-gear"></i></th> 
                </tr>
              </thead>
            </table>
          </div>
        </div>
      </div>
    </div><!-- End Recent Sales -->
</section>
<section>
	@include('cashRegister.open.modal_register_open') 
	@include('cashRegister.open.modal_close_cashregister') 
</section>
@endsection
@section("script")
  <script src="{{asset('dist/js/cash/rogercode-cash-register.js')}}" ></script>
@endsection