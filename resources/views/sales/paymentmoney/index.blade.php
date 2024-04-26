
@extends("layouts.app")
@section("content")
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>VENTAS CON ABONO</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
		  <div class="card-header border-0">
			  <!--div style="float:right; margin-right: 6px;">
				  <button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#newproduct">
            <i class="bi bi-person"></i> Agregar producto 
				  </button>
			  </div>-->
		  </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-striped table-bordered" id="paymentMoney">
            <thead>
              <tr>
                <th scope="col"></th>
                <th scope="col">Codido.</th>
                <th scope="col">Cliente</th>
                <th scope="col">Cantidad</th>
                <th scope="col">Total</th>
                <th scope="col">Abono</th>
                <th scope="col">Por pagar</th>
                <th scope="col">Estado</th>
                <th scope="col">Usuario</th>
                <th scope="col">Fecha</th>
              </tr>
            </thead>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
	@include('sales.paymentmoney.modal_show_detail') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/sales/rogercode-payment-sale-index.js')}}" ></script>
@endsection