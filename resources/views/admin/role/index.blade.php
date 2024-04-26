
@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>ROLES</h4> </a>
  </div>

<!-- Recent Sales -->
            <div class="col-12">
              <div class="card overflow-auto">
		<div class="card-header border-0">
			<div style="float:right; margin-right: 6px;">
				<button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#ModalRolCreate">
          				<i class="bi bi-person"></i> Agregar Rol
				</button>
			</div>
		</div>
                <div class="card-body">
                  <!--h5 class="card-title">Recent Sales <span>| Today</span></h5>-->
		  <div class="table-responsive">
                  <table class="table table-striped table-bordered" id="tableRoles">
                    <thead>
                      <tr>
                            <th>#</th> 
                            <th>Nombre</th> 
                            <th>Access</th> 
                            <th>Estado</th> 
                            <th>Fecha</th> 
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
	@include('admin.role.formulario') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/user/rogercode-rol-index.js')}}"></script>
  <script src="{{asset('dist/js/user/rogercode-rol.js')}}" type="module"></script>
@endsection