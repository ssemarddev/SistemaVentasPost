<header id="header" class="header fixed-top d-flex align-items-center bg-secondary ">

    <div class="d-flex align-items-center justify-content-between" >
      <a href="#" class="logo d-flex align-items-center">
        <!--img src="{{asset('images/logo_parabrisas.png')}}" alt="">-->
        <!--img src="{{asset('images/tellos/LOGOCIRCULAR.png')}}" alt="">-->
        <div>
          
        </div>
        <img id="img-logo-circular-header" alt="">
        <!--img src="{{asset('images/real_bendita_uno/logocircularbenditoreal.png')}}" alt="">-->
        <img src="{{asset('images/tellos/LOGOCIRCULAR.png')}}" alt="">
        <span class="d-none d-lg-block">Ventas</span>
	      <i class="ms-auto bi bi-list toggle-sidebar-btn"></i>
      </a>
    </div>
    <!-- End Logo -->

    <div class="search-bar flex-grow-1">
	<div class="position-relative text-center">
           <span class="fecha" id="fechasinicio"></span>
           <br>
           <span class="tiempo"></span>
	</div>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto ">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

     

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="{{asset('images/header/vert.png')}}" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">{{substr(Auth::user()->name,0,10)}}</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <!--li class="dropdown-header">
              <h6>Kevin Anderson</h6>
              <span>Web Designer</span>
            </li>-->
            <li>
              <hr class="dropdown-divider">
            </li>

            <!--li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>-->

            <li>
              <!--a type="submit" class="dropdown-item d-flex align-items-center">
                <i class="bi bi-box-arrow-right"></i>
                <span>Cerrar cesion</span>
              </a>-->
              <a class="dropdown-item d-flex align-items-center" href="{{ route('logout') }}"
                onclick="event.preventDefault();
                document.getElementById('logout-form').submit();">
                <i class="bi bi-box-arrow-right"></i>
                {{ __('Cerrar cesion') }}
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                    @csrf
                </form>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header>