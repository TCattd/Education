@include('layouts.head')
@include('layouts.header')

    <div class="hidden contact"></div>

    <!-- Main Article -->
    <main class="main container">
        <nav class="breadcrumb" id="breadcrumb" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">
                    <h1>Contacto</h1>
                </li>
            </ol>
        </nav>

        <div class="row">
            <section class="article col-12 card p-5">
                <p>
                    <!-- Site title -->
                    <strong>{{ config('app.name') }}</strong> es un periódico digital que se enfoca en la actualidad nacional e internacional.
                    Contamos con una amplia cobertura de noticias de deportes, negocios, política y más.
                </p>
                <hr>
                <p>
                    Escríbanos:
                </p>

                @if(Session::has('success'))
                <p>
                    <div class="alert alert-success">
                        {{Session::get('success')}}
                    </div>
                </p>
                @endif

                @if(Session::has('error'))
                <p>
                    <div class="alert alert-danger">
                        {{Session::get('error')}}
                    </div>
                </p>
                @endif

                <form method="POST" id="contact" action="{{ route('contact.store') }}" class="container">
                    @csrf

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Nombre</label>
                        <div class="col-sm-10">
                            <input class="input form-control" type="text" placeholder="Su nombre y apellido" name="name" value="{{ old('name') }}" required>
                        @if ($errors->has('name'))
                            <p class="help is-danger">{{ $errors->first('name') }}</p>
                        @endif
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Asunto</label>
                        <div class="col-sm-10">
                            <input class="input form-control" type="text" placeholder="El asunto de contacto" name="subject" value="{{ old('subject') }}" required>
                        @if ($errors->has('subject'))
                            <p class="help is-danger">{{ $errors->first('subject') }}</p>
                        @endif
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Correo</label>
                        <div class="col-sm-10">
                            <input class="input form-control" type="email" placeholder="Su correo electrónico" name="email" value="{{ old('email') }}" required>
                        @if ($errors->has('email'))
                            <p class="help is-danger">{{ $errors->first('email') }}</p>
                        @endif
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Mensaje</label>
                        <div class="col-sm-10">
                            <textarea class="textarea form-control js-editor" placeholder="Escriba acá su mensaje" name="message" required>{{ old('message') }}</textarea>
                        @if ($errors->has('message'))
                            <p class="help is-danger">{{ $errors->first('message') }}</p>
                        @endif
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-12 send-form-container">
                            <button type="submit" name="send" class="send-form btn btn-primary btn-submit form-control">Enviar Correo</button>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </main> <!-- / .main -->

@include('layouts.modals')
@include('layouts.templates')

@include('layouts.footer')
