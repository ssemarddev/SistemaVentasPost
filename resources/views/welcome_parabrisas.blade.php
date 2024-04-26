 <!DOCTYPE html>
<head> 
    <title>La Casa del Parabrisas Curicó - Bienvenido!</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
	<meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700,800' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="{{asset('portalweb/css/font-awesome.min.css')}}">
    <link rel="stylesheet" href="{{asset('portalweb/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('portalweb/css/templatemo_misc.css')}}">
    <link rel="stylesheet" href="{{asset('portalweb/css/templatemo_style.css')}}">
    <!-- JavaScripts -->   
    <script src="{{asset('portalweb/js/jquery-1.11.1.min.js')}}"></script> <!-- lightbox -->
    <script src="{{asset('portalweb/js/templatemo_custom.js')}}"></script> <!-- lightbox -->
    <script src="{{asset('portalweb/js/jquery.lightbox.js')}}"></script>
    <script src="{{asset('portalweb/js/bootstrap-collapse.js')}}"></script> 
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v5.0"></script>
    <!-- JavaScripts -->  
</head>
<body>
    <div id="templatemo_home" class="templatemo_headerimg"><img src="{{asset('portalweb/images/templatemo_header.jpg')}}" alt="La Casa del Parabrisas Curico"></div>
    <div class="templatemo_headerimg_cover"><img src="{{asset('portalweb/images/templatemo_header.png')}}" alt="templatemo header"></div>
    <div class="templatemo_headerwrapper">
        <div class="templatemo_menu">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div id="top-menu">
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li><a class="menu first" href="#templatemo_home"><span>INICIO</span></a></li>
                                <li><a class="menu" href="#templatemo_service"><span>PRODUCTOS</span></a></li>
                                <li><a class="menu" href="#templatemo_packages"><span>NOSOTROS</span></a></li>
                                <li><a class="menu" href="#templatemo_about"><span>HORARIOS</span></a></li>
                                <li><a class="menu" href="#templatemo_contact"><span>UBICACION</span></a></li>
                                @if (Route::has('login'))
                                <li> 
                                    @auth
                                        <a href="{{ url('/dashboard') }}" class="text-sm text-gray-700 dark:text-gray-500 underline"><span>ADMINISTRADOR</span></a>
                                    @else
                                        <a href="{{ route('login') }}" class="text-sm text-gray-700 dark:text-gray-500 underline"><span>INGRESAR</span></a> 
                                    @endauth 
                                </li>
                                @endif
                            </ul>
                        </div>
                    </div>
                    <!-- /.navbar-collapse --> 
                </div>
                <!-- /.container-fluid --> 
            </nav>
            <div class="templatemo_socialmedia">
                <div class="templatemo_social"><a target="_blank" href="https://www.facebook.com/LaCasadelParabrisa.CL/"><img src="{{asset('portalweb/images/facebook.png')}}" alt="templatemo facebook"></a></div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="container templatemo_wrapper">
            <!-- home start -->
            <div class="row">
                <div class="col-sm-6">
                    <div class="templatemo_title"><span>LA</span>CASA<span>DEL</span>PARABRISAS</div>
                    <div class="templatemo_subtitle">Bienvenidos a LaCasadelParabisa.cl</div>
                </div>
                <div class="col-sm-6 templatemo_home">
                    <div class="templatemo_headertitle">LA CASA DEL PARABRISAS</div>
                    <div class="clear"></div>
                    <div class="templatemmo_subheader">ESTAMOS PRESENTES EN DIFERENTES CIUDADES DE CHILE</div>
                    <div class="clear"></div>
                    <div class="templatemo_hometext">
                        <p>Contamos con vidrios originales e importados para automóviles camiones camionetas buses y maquinaria pesada y con el personal especializado para su instalación. Mantenemos el liderazgo, prestigio y excelencia de atención en el mercado con el objetivo que nuestros clientes se sientan completamente satisfechos.</p>
                            Préstamos servicios a particulares, compañías de seguros, talleres, agencias automotrices y flotas terrestres con una atención rápida y óptima. Además nuestros precios son altamente competitivos ya que importamos en forma directa. 
                    </div>
                    <div class="clear"></div>
                    <div class="templatemo_homebuton"><a target="_blank" href="https://api.whatsapp.com/send?phone=56954218607&amp;text=Hola, necesito cotizar parabrisas para mi vehículo.">COTIZA AQUÍ</a></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <div class="templatemo_separater">
                        <span class="page">1</span>
                    </div>
                </div>
            </div>
            <!-- home end -->   
        </div>
        <!-- service start --> 
        <div id="templatemo_service" class="container">

            <div class="row">
            	<div class="col-md-12">
                    <div class="templatemo_contacttitle">PRODUCTOS</div>
                    <div class="templatemo_sub_contacttitle">AUTOS | BUSES | MAQUINARIA PESADA | FURGONES | CAMIONES | CAMIONETAS | AUTOMOVILES</div>
                </div>
                <div class="col-md-6 templatemo_service">
                    <div class="gallery-item">
                        <img src="{{asset('portalweb/images/service/auto.png')}}" alt="gallery 1">
                        <div class="templatemo_service_frame"><img src="{{asset('portalweb/images/templatemo_serviceimg.png')}}" alt="templatemo_frame"></div>
                        <div class="overlay">
                            <div class="templatemo_service_frame"><img src="{{asset('portalweb/images/templatemo_serviceimg1.png')}}" alt="templatemo_frame"></div>
                            <a href="{{asset('portalweb/images/service/auto.png')}}" data-rel="lightbox" class="fa fa-search-plus"></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 templatemo_service">
                    <div class="templatemo_service_title">VIDRIOS PARA AUTOS</div>
                    <div class="templatemo_service_subtitle">Experiencia en Vidrios para Autos y Colectivos</div>
                    <div class="templatemo_service_text">
                        <p>Descubre más sobre lo mejor en vidrios con técnicos experimentados.
						Visitanos y  Solicita presupuesto en La Casa del Parabrisas con atención personalizada</p>
                        <div class="clear"></div>
                    </div>
                    <div class="templatemo_morebutton"><a target="_blank" href="https://api.whatsapp.com/send?phone=56954218607&amp;text=Hola, necesito cotizar parabrisas para Autos.">COTIZAR VIDRIOS PARA AUTOS</a></div>
                </div>
            </div>
            <hr />
            <div class="row templatemo_ordering">
                <div class="col-md-6 templatemo_service one">
                    <div class="templatemo_service_title">VIDRIOS PARA BUSES</div>
                    <div class="templatemo_service_subtitle">Experiencia en Vidrios para Buses</div>
                    <div class="templatemo_service_text">
                        <p>Descubre más sobre lo mejor en vidrios con técnicos experimentados.
						Visitanos y  Solicita presupuesto en La Casa del Parabrisas con atención personalizada</p>
                        <div class="clear"></div>
                    </div>

                    <div class="templatemo_morebutton"><a target="_blank" href="https://api.whatsapp.com/send?phone=56954218607&amp;text=Hola, necesito cotizar parabrisas para Buses.">COTIZAR VIDRIOS PARA BUSES</a></div>
                </div>
                <div class="col-md-6 templatemo_service two">
                    <div class="gallery-item">
                        <img src="{{asset('portalweb/images/service/buses.png')}}" alt="gallery 2">
                        <div class="templatemo_service_frame"><img src="{{asset('portalweb/images/templatemo_serviceimg.png')}}" alt="templatemo_frame"></div>
                        <div class="overlay">
                            <div class="templatemo_service_frame"><img src="{{asset('portalweb/images/templatemo_serviceimg1.png')}}" alt="templatemo_frame"></div>
                            <a href="{{asset('portalweb/images/service/buses.png')}}" data-rel="lightbox" class="fa fa-search-plus"></a>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6 templatemo_service">
                    <div class="gallery-item">
                        <img src="{{asset('portalweb/images/service/camion.png')}}" alt="gallery 3">
                        <div class="templatemo_service_frame"><img src="{{asset('portalweb/images/templatemo_serviceimg.png')}}" alt="templatemo_frame"></div>
                        <div class="overlay">
                            <div class="templatemo_service_frame"><img src="{{asset('portalweb/images/templatemo_serviceimg1.png')}}" alt="templatemo_frame"></div>
                            <a href="{{asset('portalweb/images/service/camion.png')}}" data-rel="lightbox" class="fa fa-search-plus"></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 templatemo_service">
                    <div class="templatemo_service_title">VIDRIOS PARA CAMIONES</div>
                    <div class="templatemo_service_subtitle">Experiencia en Vidrios para variedad de Camniones</div>
                    <div class="templatemo_service_text">
                        <p>Descubre más sobre lo mejor en vidrios con técnicos experimentados.
						Visitanos y  Solicita presupuesto en La Casa del Parabrisas con atención personalizada</p>
                        <div class="clear"></div>
                    </div>
                    <div class="templatemo_morebutton"><a target="_blank" href="https://api.whatsapp.com/send?phone=56954218607&amp;text=Hola, necesito cotizar parabrisas para Camiones.">COTIZAR VIDRIOS PARA CAMIONES</a></div>
                </div>
            </div>
            <hr />
            <div class="row templatemo_ordering">
                <div class="col-md-6 templatemo_service one">
                    <div class="templatemo_service_title">VIDRIOS PARA MAQUINARIAS</div>
                    <div class="templatemo_service_subtitle">Experiencia en Vidrios para todo tipo de Maquinarias Pesas</div>
                    <div class="templatemo_service_text">
                        <p>Descubre más sobre lo mejor en vidrios con técnicos experimentados.
						Visitanos y  Solicita presupuesto en La Casa del Parabrisas con atención personalizada</p>
                        <div class="clear"></div>
                    </div>
                    <div class="templatemo_morebutton"><a target="_blank" href="https://api.whatsapp.com/send?phone=56954218607&amp;text=Hola, necesito cotizar parabrisas para Maquinaria Pesada.">COTIZAR VIDRIOS PARA MAQUINARIAS</a></div>
                </div>
                <div class="col-md-6 templatemo_service two">
                    <div class="gallery-item">
                        <img src="{{asset('portalweb/images/service/maquinaria.png')}}" alt="gallery 2">
                        <div class="templatemo_service_frame"><img src="{{asset('portalweb/images/templatemo_serviceimg.png')}}" alt="templatemo_frame"></div>
                        <div class="overlay">
                            <div class="templatemo_service_frame"><img src="{{asset('portalweb/images/templatemo_serviceimg1.png')}}" alt="templatemo_frame"></div>
                            <a href="{{asset('portalweb/images/service/maquinaria.png')}}" data-rel="lightbox" class="fa fa-search-plus"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <div class="templatemo_separater">
                        <span class="page">2</span>
                    </div>
                </div>
            </div>
            <!-- service end -->
            <!-- promotion start -->
            <div id="templatemo_packages" class="row">
                <div class="col-md-12">
                    <div class="templatemo_pricing_title">NOSOTROS</div>
                    <div class="templatemo_pricing_subtitle">LA CASA DEL PARABRISAS CURICO, MAS DE 30 AÑOS EN EL MERCADO.</div>
                    <p>Estamos presentes en diferentes ciudades de chile , contamos con vidrios originales e importados para automóviles, buses, camionetas, camiones y maquinaria pesada y con el personal especializado para su instalación</p>
                </div>
                <div class="col-sm-4">
                    <div class="templatemo_pricing_table">
                        <div class="templatemo_pricingbg">
                            <img src="{{asset('portalweb/images/templatemo_pricing_bg.png')}}" alt="templatemo price img">
                        </div>
                        <div class="templatemo_pricing_box">
                            <span class="price_title">NOSOTROS</span>
                            
                        </div>
                        <div class="templatemo_pricing_list">
                            <ul>
                            	<li>Nos especializamos en una variada cartera de clientes: maquinaria pesada, camiones, buses, automóviles hasta los provenientes de la exigente maquinaria pesada.</li>
                            	<li>Vidrios</li>
                            	<li>Parabrisas y Lunetas</li>
                            	<li>Laminas de Seguridad</li>
                            	<li>Vidrios Laterales</li>

                            </ul>
                        </div>
                        
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="templatemo_pricing_table">
                        <div class="templatemo_pricingbg">
                            <img src="{{asset('portalweb/images/templatemo_pricing_bg.png')}}" alt="templatemo price img">
                        </div>
                        <div class="templatemo_pricing_box">
                            <span class="price_title">SERVICIO</span>
                            
                        </div>
                        <div class="templatemo_pricing_list">
                            <ul>
                            	<li>Contamos con personal especializado para su instalación, manteniendo el liderazgo, prestigio y excelencia de atención en el mercado con el objetivo que nuestros clientes se sientan completamente satisfechos con el Servicio</li>

                            </ul>
                        </div>
                       
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="templatemo_pricing_table">
                        <div class="templatemo_pricingbg">
                            <img src="{{asset('portalweb/images/templatemo_pricing_bg.png')}}" alt="templatemo price img">
                        </div>
                        <div class="templatemo_pricing_box">
                            <span class="price_title">CONFIANZA</span>
                            
                        </div>
                        <div class="templatemo_pricing_list">
                            <ul>
                            	<li>Contamos con la tecnología, capital humano y productos de altísima calidad, para ofrecer una asesoría integral, de manera que nuestros clientes se retiren con sus vehículos particulares o comerciales, plenamente equipados en todo lo relativo al delicado aspecto de los vidrios automotrices.</li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <div class="templatemo_separater">
                        <span class="page">3</span>
                    </div>
                </div>
            </div>
            <!-- promotion end -->
            <!-- work start -->
            <div id="templatemo_about" class="row">
                <div class="col-md-4 templatemo_work"><img src="{{asset('portalweb/images/templatemo_workicon.png')}}" alt="templatemo work"></div>
                <div class="col-md-8">
                    <div class="templatemo_worktitle">NUESTROS HORARIOS DE ATENCIÓN</div>
                    <div class="templatemo_sub_worktitle">La casa del Parabrisas Curicó: Experiencia en vidrios para maquinaria pesada. También nos puedes contactar al ✆ +56 9 5421 8607</div>
                    <ul>
                        <li><b>LUNES:</b> 09:00 a 13:00 - 15:00 a 19:00</li>
                        <li><b>MARTES:</b> 09:00 a 13:00 - 15:00 a 19:00</li>
                        <li><b>MIERCOLES:</b> 09:00 a 13:00 - 15:00 a 19:00</li>
                        <li><b>JUEVES:</b> 09:00 a 13:00 - 15:00 a 19:00</li>
                        <li><b>VIERNES:</b> 09:00 a 13:00 - 15:00 a 19:00</li>
                        <li><b>SABADO:</b> 09:00 a 13:30</li>
                        <li><b>DOMINGO:</b> CERRADO</li>

                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <div class="templatemo_separater">
                        <span class="page">4</span>
                    </div>
                </div>
            </div>
            <!-- work end -->
            <!-- contact start -->
            <div id="templatemo_contact" class="row templatemo_contact">
                <div class="col-md-12">
                    <div class="templatemo_contacttitle">UBICACION</div>
                    <div class="templatemo_sub_contacttitle">AV. MANSO DE VELASCO N°520, CURICÓ</div>
                </div>
                <div class="col-md-4 templatemo_contactform">
                <div class="fb-page" data-href="https://www.facebook.com/LaCasadelParabrisa.CL/" data-tabs="timeline" data-width="350" data-height="400" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/LaCasadelParabrisa.CL/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/LaCasadelParabrisa.CL/">La Casa del Parabrisas</a></blockquote></div>    
                </div>
                <div class="col-md-8">
                    <div class="templatemo_contactmap">
                        <iframe src="https://www.google.com/maps/embed?pb=!4v1573279084493!6m8!1m7!1sTl6f0cgTEt_Ny99_blUTBg!2m2!1d-34.98515492379084!2d-71.23377666313208!3f81.33286532351664!4f-7.788678185614415!5f0.7820865974627469" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                    </div>
                </div>
            </div>
            <!-- contact end -->
        </div>
        <div class="templatemo_footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                    	Copyright &copy; 2019 - By miCompu <a href="#">La Casa Del Parabrisas Curicó</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
