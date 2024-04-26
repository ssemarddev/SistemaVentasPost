<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>SISTEMA DE VENTAS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <!--link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">-->

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="{{asset('theme/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
  <link href="{{asset('theme/bootstrap-icons/bootstrap-icons.css')}}" rel="stylesheet">
  <link href="{{asset('theme/boxicons/css/boxicons.min.css')}}" rel="stylesheet">
  <link href="{{asset('theme/quill/quill.snow.css')}}" rel="stylesheet">
  <link href="{{asset('theme/quill/quill.bubble.css')}}" rel="stylesheet">
  <link href="{{asset('theme/remixicon/remixicon.css')}}" rel="stylesheet">
  <!--link href="{{asset('theme/simple-datatables/style.css')}}" rel="stylesheet">-->

  <!-- Template Main CSS File -->
  <link href="{{asset('theme/css/style.css')}}" rel="stylesheet">

  <!-- datatables -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.13.1/datatables.min.css"/>
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css">
  <!-- select 2 -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />

	<link rel="stylesheet" href="{{asset('dist/css/rogercode-main.css')}}">
  <!-- =======================================================
  * Template Name: NiceAdmin - v2.4.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
 		@include('layouts.header')
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
 		@include('layouts.sidebar')
  <!-- End Sidebar-->

  <main id="main" class="main">


    <section class="section dashboard">
      @yield('content')
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>Ventas</span></strong>. Todos los derechos reservados
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="{{asset('theme/apexcharts/apexcharts.min.js')}}"></script>
  <script src="{{asset('theme/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  <script src="{{asset('theme/chart.js/chart.min.js')}}"></script>
  <script src="{{asset('theme/echarts/echarts.min.js')}}"></script>
  <script src="{{asset('theme/quill/quill.min.js')}}"></script>
  <!--script src="{{asset('theme/simple-datatables/simple-datatables.js')}}"></script>-->
  <script src="{{asset('theme/tinymce/tinymce.min.js')}}"></script>
  <script src="{{asset('theme/php-email-form/validate.js')}}"></script>

  <!-- Template Main JS File -->
  <script src="{{asset('theme/js/main.js')}}"></script>
  <!--script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
  <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.13.1/datatables.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
  <!-- select2 -->
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  <!-- datatables -->
  <script src="{{asset('dist/js/rogercode-main.js')}}"></script>
  <script src="{{asset('dist/js/rogercode-settings.js')}}"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  @yield('showProd')
  @yield('script')
</body>

</html>
