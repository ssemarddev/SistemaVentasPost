@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>CLIENTES</h4> </a>
  </div>
<!--div class="card mt-2">
	<div class="card-header">
	    <div class="page-breadcrumb d-none d-sm-flex align-items-center">
        <div class="breadcrumb-title pe-3">CLIENTES </div>
        <div class="ms-auto">
            <div class="btn-group"> 
                <a class="btn btn-success form-control" onclick="Nuevo();" data-bs-toggle="modal" data-bs-target="#newclient"><i class="fa fa-user-plus"></i>AGREGAR</a>
            </div>
        </div>
    </div> 
	</div>
	<div class="card-body">
		<table class="table table-bordered" id="tableCustomers">
  		<thead>
    		<tr>
      		<th scope="col">#</th>
      		<th scope="col">First</th>
      		<th scope="col">Last</th>
    		</tr>
  		</thead>
		</table>
	</div>
</div>-->
<!--div class="card overflow-auto">
<div class="card-header border-0">
<h3 class="card-title">Products</h3>
</div>
<div class="card-body table-responsive p-0">
<table class="table table-striped table-valign-middle" id="tableCustomers">
<thead>
<tr>
<th>Product</th>
<th>Price</th>
<th>Sales</th>
</tr>
</thead>

</table>
</div>
</div>

</div>-->
<!-- Recent Sales -->
            <div class="col-12">
              <div class="card overflow-auto">
		<div class="card-header border-0">
			<div style="float:right; margin-right: 6px;">
				<button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#newclient">
          				<i class="bi bi-person"></i> Agregar cliente
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
                            <th>Nombre</th> 
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
            </div><!-- End Recent Sales -->
</section>
<section>
	@include('customers.formulario') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/cutomers/rogercode-index.js')}}"></script>
  <script src="{{asset('dist/js/cutomers/rogercode-modul-customer.js')}}" type="module"></script>
@endsection