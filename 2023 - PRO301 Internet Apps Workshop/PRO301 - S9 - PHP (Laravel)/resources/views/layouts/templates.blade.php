    <template id="article-card-template">
        <article class="news-gallery__item col-12 col-md-6 col-lg-4 m-0 p-3 border-0 card" id="article-${id}">
            <div class="article-item p-4 shadow border rounded border-dark border-1 border-opacity-10">
            <a href="${link}"><img src='${image}' alt='' class="img-fluid rounded" /></a>
            <div class="news-gallery__item__content card-body">
                <a href="${link}"><h2 class="news-gallery__item__title card-title">${title}</h2></a>
                <p class="news-gallery__item__excerpt card-text">${excerpt}</p>
                <a href="${link}" class="news-gallery__item__link btn btn-primary" role="button">Leer más</a>
            </div>
            </div>
        </article>
    </template> <!-- / #article-card-template -->

    <template id="article-featured-template">
        <div class="carousel-item" id="article-${id}" data-href="${link}">
            <img src="${image}" class="carousel-image d-block w-100" alt="" />
            <div class="carousel-caption">
                <h1>${title}</h1>
            </div>
        </div>
    </template>

    <template id="article-template">
        <article class="article custom-column card shadow" id="article-${id}">
            <div class="article__header">
                <h1 class="article__title">${title}</h1>
                <div class="article__meta">
                    <span class="article__category">Categoría: ${category}</span>
                </div>
            </div>
            <div class="article__image">
                <img src='${image}' alt='' />
            </div>
            <div class="article__content card-content content">
                ${content}
            </div>
            <div class="source">
                Fuente: <a href="${source_url}" target="_blank">${source_name}</a>
            </div>
        </article>
    </template> <!-- / #article-card-template -->

    <template id="classifieds-card-template">
        <div class="col-12 col-md-4 classified-item" id="article-${id}">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">${category}</h5>
                    <p class="card-text"><span class="classified-title">${title}</span></p>
                    <a href="${link}" class="btn btn-primary float-end">Ver más</a>
                </div>
            </div>
        </div>
    </template>

    <template id="classified-template">
        <article class="article custom-column card shadow" id="article-${id}">
            <div class="article__header">
                <h1 class="article__title">${title}</h1>
                <div class="article__meta">
                    <span class="article__category">Categoría: ${category}</span>
                </div>
            </div>
            <div class="source">
                Publicado el: ${date}
            </div>
            <div class="article__image">
                <img src='${image}' alt='' />
            </div>
            <div class="article__content card-content content">
                ${content}
            </div>
            <div class="contact_info">
                <div class="price">
                    <span class="price_label">Precio: </span>
                    <span class="price_value">${price}</span>
                </div>
                <div class="name">
                    <span class="name_label">Nombre: </span>
                    <span class="name_value">${name}</span>
                </div>
                <div class="phone">
                    <span class="phone_label">Teléfono: </span>
                    <span class="phone_value">${phone}</span>
                </div>
                <div class="email">
                    <span class="email_label">Correo: </span>
                    <span class="email_value">${email}</span>
                </div>
            </div>
        </article>
    </template> <!-- / #article-card-template -->
