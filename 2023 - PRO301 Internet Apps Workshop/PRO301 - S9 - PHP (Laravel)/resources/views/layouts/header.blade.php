    <!-- Header -->
    <header class="header container rounded shadow">
        <div class="row p-4">
            <div class="col-4 col-md-2 logo">
                <!-- Get site url from Config -->
                <a href="{{ config('app.url') }}" class="">
                    <img src="{{ url('/') }}/images/elfaro-logo-iso.png" alt="El Faro Logo" width="100" class="" />
                    <!--<div class="subtitle">El Faro</div>-->
                </a>
            </div>
            <div class="col-8 col-md-10 main-menu">
                <nav class="menu navbar navbar-expand-lg d-grid justify-content-end" role="navigation" aria-label="main navigation">
                    <!--<div class="clock alert alert-secondary text-center" role="alert">
                        <span class="clock" id="current-date"></span>, <span class="clock" id="current-time"></span>
                    </div>-->
                    <div class="container-fluid justify-content-end">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-1">
                                <li class="navbar-item nav-item mt-1 mb-sm-1">
                                    <a href="{{ config('app.url') }}" role="button" class="nav-link">Inicio</a>
                                </li>
                                <li class="navbar-item nav-item mt-1 mb-sm-1 dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        Categorías
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="{{ config('app.url') }}/?category=featured-list" role="button" id="add-article" class="nav-link">Destacados</a>
                                        </li>
                                        <li>
                                            <a href="{{ config('app.url') }}/?category=news" role="button" id="add-article" class="nav-link">Noticias</a>
                                        </li>
                                        <li>
                                            <a href="{{ config('app.url') }}/?category=sports" role="button" id="add-article" class="nav-link">Deportes</a>
                                        </li>
                                        <li>
                                            <a href="{{ config('app.url') }}/?category=business" role="button" id="add-classified" class="nav-link">Negocios</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="navbar-item nav-item mt-1 mb-sm-1 dropdown">
                                    <a href="#" role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Clasificados</a>
                                    <ul class="dropdown-menu classifieds-dropdown">
                                        <li>
                                            <a href="{{ config('app.url') }}/classified" role="button" id="view-classifieds" class="nav-link">Ver Avisos</a>
                                        </li>
                                        <li>
                                            <a href="#" role="button" id="add-classified" class="nav-link" data-bs-toggle="modal" data-bs-target="#add-classified-modal">Publicar Aviso</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--<li class="navbar-item nav-item mt-1 mb-sm-1 dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        Agregar
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#" role="button" id="add-article" class="nav-link" data-bs-toggle="modal" data-bs-target="#add-article-modal">Artículo</a>
                                        </li>
                                        <li>
                                            <a href="#" role="button" id="add-classified" class="nav-link" data-bs-toggle="modal" data-bs-target="#add-classified-modal">Clasificado</a>
                                        </li>
                                    </ul>
                                </li>-->
                                <li class="navbar-item nav-item mt-1 mb-sm-1">
                                    <a href="{{ config('app.url') }}/contact" role="button" class="nav-link">Contacto</a>
                                </li>
                                <!-- Account -->
                                <li class="navbar-item nav-item mt-1 mb-sm-1 dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <!-- Show username if logged in -->
                                        @if (Auth::check())
                                            <!-- Show only first name -->
                                            {{ explode(' ', Auth::user()->name)[0] }}
                                        @else
                                            Cuenta
                                        @endif
                                    </a>
                                    <ul class="dropdown-menu">
                                        @if (Auth::check())
                                            <li>
                                                <a href="{{ config('app.url') }}/profile" role="button" id="profile" class="nav-link">Mi cuenta</a>
                                            </li>
                                            <li>
                                                <form method="POST" action="{{ route('logout') }}">
                                                    @csrf
                                                    <a href="{{ config('app.url') }}/logout" role="button" id="logout" class="nav-link"
                                                    onclick="event.preventDefault();
                                                                        this.closest('form').submit();"
                                                    >{{ __('Log Out') }}</a>
                                                </form>
                                            </li>
                                        @else
                                            <li>
                                                <a href="{{ config('app.url') }}/login" role="button" id="login" class="nav-link">Iniciar sesión</a>
                                            </li>
                                            <li>
                                                <a href="{{ config('app.url') }}/register" role="button" id="register" class="nav-link">Registrarse</a>
                                            </li>
                                        @endif
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div> <!-- / .container-fluid -->
                </nav>
            </div>
        </div>
    </header> <!-- / .header -->

    <!-- Secondary nav with news of featured categories -->
    <nav class="secondary-nav container">
        <div class="row">
            <div class="col-12">
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link rounded shadow-sm" href="{{ config('app.url') }}/?category=featured-list">Destacados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link rounded shadow-sm" href="{{ config('app.url') }}/?category=news">Noticias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link rounded shadow-sm" href="{{ config('app.url') }}/?category=sports">Deportes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link rounded shadow-sm" href="{{ config('app.url') }}/?category=business">Negocios</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
