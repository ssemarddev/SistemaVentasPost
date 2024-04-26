@extends("layouts.app")
@section("content")
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>LISTA COMPRAS</h4> </a>
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
          <table class="table table-striped table-bordered" id="salesList">
            <thead>
              <tr>
                <th scope="col"></th>
                <th scope="col">Tipo</th>
                <th scope="col">Num</th>
                <th scope="col">Proveedor</th>
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
	@include('shopping.productspurchases.modal_detail_productspurchase') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/shopping/products-purchases/rogercode-products-purchases-list.js')}}"></script>
@endsection