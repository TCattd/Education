@include('layouts.head')
@include('layouts.header')

    <div class="hidden classifieds classified"></div>

    <!-- Main -->
    <main class="news-gallery container">
        <nav class="breadcrumb" id="breadcrumb" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">
                    <h1 id="">Clasificados</h1><span class="counter">(<span id="article-count">...</span> publicaciones)</span>
                </li>
            </ol>
        </nav>

        <div class="articles-gallery overflow-hidden row g-4 mx-2 mx-lg-0" id="articles-gallery">
            <!-- Populated via JS -->
        </div> <!-- / .custom-grid -->

        <!-- Main Article -->
        <div class="main container article article-container classified-container">
            <div class="row article__content" id="classified-content">
                <!-- Populated via JS -->
            </div> <!-- / #article-content -->
        </div> <!-- / .main -->
    </main> <!-- / .news-gallery -->

@include('layouts.modals')
@include('layouts.templates')

@include('layouts.footer')
