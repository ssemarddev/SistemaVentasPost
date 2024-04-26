
@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>CATEGORIAS</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
		  <div class="card-header border-0">
			  <div style="float:right; margin-right: 6px;">
				  <button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#newcategory">
            <i class="bi bi-person"></i> Agregar categoria
				  </button>
			  </div>
		  </div>
      <div class="card-body">
        <!--h5 class="card-title">Recent Sales <span>| Today</span></h5>-->
        <div class="table-responsive">
          <table class="table table-striped table-bordered" id="tableCategory">
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
	@include('warehouse.category.formulario') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/warehouse/rogercode-category-index.js')}}"></script>
  <script src="{{asset('dist/js/warehouse/rogercode-modul-category.js')}}" type="module"></script>
@endsection