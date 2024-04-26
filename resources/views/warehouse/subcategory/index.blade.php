
@extends("layouts.app")
@section("content")
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>SUB CATEGORIAS</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
		  <div class="card-header border-0">
			  <div style="float:right; margin-right: 6px;">
				  <button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#newsubcategory">
            <i class="bi bi-person"></i> Agregar sub categoria
				  </button>
			  </div>
		  </div>
      <div class="card-body">
        <!--h5 class="card-title">Recent Sales <span>| Today</span></h5>-->
        <div class="table-responsive">
          <table class="table table-striped table-bordered" id="tableSubcategory">
            <thead>
              <tr>
                <th>Nombre</th> 
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
	@include('warehouse.subcategory.formulario') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/warehouse/rogercode-subcategory-index.js')}}"></script>
@endsection