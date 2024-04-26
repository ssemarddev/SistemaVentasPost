
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>Ventas</title>

  <!-- Vendor CSS Files -->
  <link href="{{asset('theme/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
  <link href="{{asset('theme/bootstrap-icons/bootstrap-icons.css')}}" rel="stylesheet">
  <link href="{{asset('theme/boxicons/css/boxicons.min.css')}}" rel="stylesheet">
  <link href="{{asset('theme/quill/quill.snow.css')}}" rel="stylesheet">

</head>
<body>
  <main id="main" class="main">
    <section class="section dashboard">
      @yield('content')
    </section>
  </main><!-- End #main -->
  <!-- Vendor JS Files -->

</body>
</html>