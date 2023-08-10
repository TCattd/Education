@include('layouts.head')
@include('layouts.header')

    <div class="hidden index category"></div>

    <!-- Main -->
    <main class="news-gallery container">
        <nav class="breadcrumb" id="breadcrumb" id="breadcrumb" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">
                    <h1 id="category-name">Noticias Destacadas</h1><!--<span class="counter">(<span id="article-count">...</span> artículos)</span>-->
                </li>
            </ol>
        </nav>

        <div class="articles-featured container">
            <div id="carouselFeatured" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators" id="carousel-indicators">
                </div>
                <div class="carousel-inner rounded-5 shadow" id="carousel-inner">
                    <!-- Populated via JS -->
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselFeatured" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselFeatured" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Siguiente</span>
                </button>
            </div>
        </div> <!-- / .articles-featured -->

        <div class="articles-gallery overflow-hidden row g-4 mx-2 mx-lg-0" id="articles-gallery">
            <!-- Populated via JS -->
        </div> <!-- / .custom-grid -->

        <!-- Classifieds -->
        <div class="classifieds container classifieds-container rounded-3 p-3 mt-5 mb-5 shadow-sm">
            <h1 id="h1-classifieds"></h1>
            <div class="row clearfix" id="classifieds-gallery">
                <!-- Populated via JS -->
            </div>
        </div> <!-- / .classifieds -->
    </main> <!-- / .news-gallery -->

@include('layouts.modals')
@include('layouts.templates')

@include('layouts.footer')
