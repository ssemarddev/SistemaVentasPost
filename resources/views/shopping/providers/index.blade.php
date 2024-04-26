@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>PROVEEDORES</h4> </a>
  </div>

  <div class="col-12">
    <div class="card overflow-auto">
		  <div class="card-header border-0">
			  <div style="float:right; margin-right: 6px;">
				  <button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#newproveedor">
            <i class="bi bi-person"></i> Agregar proveedor
				  </button>
			  </div>
		  </div>
      <div class="card-body">
        <!--h5 class="card-title">Recent Sales <span>| Today</span></h5>-->
        <div class="table-responsive">
          <table class="table table-striped table-bordered" id="tableCustomers">
            <thead>
              <tr>
                  <!--th>Id</th>--> 
                  <th>Empresa</th> 
                  <th>Rut</th> 
                  <th>Telefono</th> 
                  <th>Email</th> 
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
	@include('shopping.providers.formulario') 
	@include('shopping.providers.modal_show_provider') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/shopping/rogercode-provider-index.js')}}"></script>
  <script src="{{asset('dist/js/shopping/rogercode-modul-provider.js')}}" type="module"></script>
@endsection