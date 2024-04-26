@extends("layouts.app")
@section("content")
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>LISTA VENTAS</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
		  <div class="card-header border-0">
			  <div style="float:right; margin-right: 6px;">
				  <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#generatepdfModal">
            <i class="bi bi-filetype-pdf"></i> Generar reporte 
				  </button>
			  </div>
		  </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-striped table-bordered" id="salesList">
            <thead>
              <tr>
                <th scope="col"></th>
                <th scope="col">Tipo</th>
                <th scope="col">Num</th>
                <th scope="col">Cliente</th>
                <th scope="col">Cant</th>
                <th scope="col">Total</th>
                <th scope="col">usuario</th>
                <th scope="col">Estado</th>
                <th scope="col">Fecha</th>
                <th><i class="bi bi-gear"></i></th>
              </tr>
            </thead>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
	@include('sales.sale.modal_detail_sale') 
  @include('sales.components.generatepdfsales')
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/sales/rogercode-sales-list.js')}}"></script>
@endsection