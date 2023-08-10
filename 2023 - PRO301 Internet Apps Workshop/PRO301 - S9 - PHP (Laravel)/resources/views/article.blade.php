@include('layouts.head')
@include('layouts.header')

    <div class="hidden article"></div>

    <!-- Main Article -->
    <main class="main container article article-container">
        <h1 id="category-name"></h1>
        <div class="row article__content" id="article-content">
            <!-- Populated via JS -->
        </div> <!-- / #article-content -->
    </main> <!-- / .main -->

@include('layouts.modals')
@include('layouts.templates')

@include('layouts.footer')
