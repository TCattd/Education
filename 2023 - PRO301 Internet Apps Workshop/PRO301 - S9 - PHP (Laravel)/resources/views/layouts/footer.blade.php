    <!-- Footer -->
    <footer class="container d-flex footer rounded shadow p-4">
        <div class="row align-items-center">
            <div class="col-auto copyright">
                <a href="{{ config('app.url') }}">
                    <img src="{{ config('app.url') }}/images/elfaro-logo.png" alt="El Faro Logo" width="40" alt='Logo El Faro' />
                </a>
                Copyright © <span id="footer-year"></span> El Faro. Todos los derechos reservados.
            </div>
        </div>
    </footer> <!-- / .footer -->

    <!-- DEBUG: Clear localStorage -->
    <div class="footerActions row">
        <div class="col-12 col-md-6 text-center">
            <a href="#" role="button" id="add-article" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#add-article-modal">Agregar Artículo</a>
        </div>
        <div class="col-12 col-md-6 text-center">
            <a class="btn btn-danger" id="clearLocalStorage">Borrar DB local (localStorage)</a>
        </div>
    </div> <!-- / .clearLocalStorage -->
</body>
</html>
