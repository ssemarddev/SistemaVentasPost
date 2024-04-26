

@extends("layouts.app")
@section("content")
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>INVENTARIO</h4> </a>
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
          <table class="table table-striped table-bordered" id="tableInventory">
            <thead>
              <tr>
                <th>Codigo</th> 
                <th>Nombre</th> 
                <th>Stock actual</th>  
                <th>Vendidos</th>  
                <th>Venta acumulada</th>  
                <th>Estado</th>  
                <!--th><i class="bi bi-gear"></i></th>--> 
              </tr>
            </thead>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/warehouse/rogercode-inventory-index.js')}}"></script>
@endsection