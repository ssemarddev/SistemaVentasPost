@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>RETIROS DE EFECTIVO</h4> </a>
  </div>
  <!-- Recent Sales -->
    <div class="col-12">
      <div class="card overflow-auto">
		    <div class="card-header border-0">
			    <div style="float:right; margin-right: 6px;">
				    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#openCaja">
              <i class="bi bi-cash"></i> Retiro de efectivo
				    </button>
			    </div>
		    </div>
        <div class="card-body">
          <!--h5 class="card-title">Recent Sales <span>| Today</span></h5>-->
          <div class="table-responsive">
            <table class="table table-striped table-bordered" id="tableCashWithdrawals">
              <thead>
                <tr>
                    <th>#</th> 
                    <th>Cantidad</th> 
                    <th>Fecha</th> 
                    <th>Hora</th> 
                </tr>
              </thead>
            </table>
          </div>
        </div>
      </div>
    </div><!-- End Recent Sales -->
</section>
<section>
	@include('cashRegister.cashWithdrawals.modal_register_cash') 
</section>
@endsection
@section("script")
  <script src="{{asset('dist/js/cash/rogercode-cash-withdrawals-index.js')}}" ></script>
  <script src="{{asset('dist/js/cash/rogercode-cash-withdrawals.js')}}" type="module"></script>
@endsection

