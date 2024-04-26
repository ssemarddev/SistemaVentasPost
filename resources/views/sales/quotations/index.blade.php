@extends("layouts.app")
@section("content")
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>LISTA COTIZACION</h4> </a>
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
          <table class="table table-striped table-bordered" id="quotationsList">
            <thead>
              <tr>
                <th></th> 
                <th>Factura</th> 
                <th>Fecha</th> 
                <th>Cliente</th> 
                <th>Usuario</th> 
                <th>Estado</th> 
                <th>Total</th>  
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
	@include('sales.quotations.modal_detail_quotation') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/sales/rogercode-quotation-list.js')}}"></script>
@endsection