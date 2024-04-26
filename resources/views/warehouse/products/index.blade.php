
@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>PRODUCTOS</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
		  <div class="card-header border-0">
			  <div style="float:right; margin-right: 6px;">
				  <button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#newproduct">
            <i class="bi bi-person"></i> Agregar producto 
				  </button>
			  </div>
		  </div>
      <div class="card-body">
        <!--h5 class="card-title">Recent Sales <span>| Today</span></h5>-->
        <div class="table-responsive">
          <table class="table table-striped table-bordered" id="tableProducts">
            <thead>
              <tr>
                <th>Codigo</th> 
                <th>Producto</th> 
                <th>Stock</th>  
                <th>Costo</th>  
                <th>Venta</th>  
                <th>Estado</th>  
                <th>Añadido</th> 
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
	@include('warehouse.products.formulario') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/warehouse/rogercode-products-index.js')}}"></script>
  <script src="{{asset('dist/js/warehouse/rogercode-modul-products.js')}}" type="module"></script>
@endsection