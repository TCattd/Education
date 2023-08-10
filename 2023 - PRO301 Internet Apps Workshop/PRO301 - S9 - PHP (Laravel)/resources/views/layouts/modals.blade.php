    <div class="modal fade" id="add-article-modal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title">Agregar Artículo</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <form id="add-article-form">
                        <section class="container">
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Categoría</label>
                                <div class="col-sm-10 select">
                                    <select id="add-article-category" class="form-control" required>
                                        <option value="featured">Destacado</option>
                                        <option value="news">Noticias</option>
                                        <option value="sports">Deportes</option>
                                        <option value="business">Negocios</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Título</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="text" placeholder="Título del artículo" id="add-article-title" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Extracto</label>
                                <div class="col-sm-10">
                                    <textarea class="textarea form-control js-editor" placeholder="Extracto del artículo"
                                        id="add-article-excerpt" maxlength="200" required></textarea>
                                    <div class="form-text">Máximo 200 caracteres.</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Imagen</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="text" placeholder="URL de la imagen" id="add-article-image" required>
                                    <div class="form-text">Ejemplo: https://picsum.photos/800/600</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Contenido</label>
                                <div class="col-sm-10">
                                    <textarea class="textarea form-control js-editor" placeholder="Contenido del artículo"
                                        id="add-article-content" required></textarea>
                                    <!--<div class="form-text">Acepta HTML. Encierra cada párrafo en su tag correspondiente: <code>&lt;p&gt;&lt;/p&gt;</code>
                                    </div>-->
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Fuente</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="text" placeholder="Nombre de la Fuente" id="add-article-source-name" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">URL de la Fuente</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="url" placeholder="URL de la Fuente" id="add-article-source-url" required>
                                </div>
                            </div>
                        </section>
                        <div class="modal-footer">
                            <button class="button btn btn-primary" id="add-article-save">Guardar Artículo</button>
                            <button class="button btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div> <!-- /. modal-body -->
            </div> <!-- /. modal-content -->
        </div> <!-- /. modal-dialog -->
    </div> <!-- / #add-article-modal -->

    <div class="modal fade" id="add-classified-modal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title">Agregar Clasificado</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <form id="add-classified-form">
                        <section class="container">
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Categoría</label>
                                <div class="col-sm-10 select">
                                    <select id="add-classified-category" class="form-control" required>
                                        <option value="sale">Venta</option>
                                        <option value="buy">Compra</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Título</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="text" placeholder="Título del artículo"
                                        id="add-classified-title" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Detalle de la venta</label>
                                <div class="col-sm-10">
                                    <textarea class="textarea form-control js-editor" placeholder="Información y detalles de tu venta"
                                        id="add-classified-content" maxlength="500" required></textarea>
                                    <div class="form-text">Máximo 500 caracteres.</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Imagen</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="url" placeholder="URL de la imagen"
                                        id="add-classified-image" required>
                                    <div class="form-text">Ejemplo: https://picsum.photos/800/600</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Precio</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="number" placeholder="Precio del artículo"
                                        id="add-classified-price" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Tu Nombre</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="text" placeholder="Nombre del vendedor"
                                        id="add-classified-name" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Tu Email</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="email" placeholder="Email del vendedor"
                                        id="add-classified-email" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Tu Teléfono</label>
                                <div class="col-sm-10">
                                    <input class="input form-control" type="tel" placeholder="Teléfono del vendedor"
                                        id="add-classified-phone" required>
                                </div>
                            </div>
                        </section>
                        <div class="modal-footer">
                            <button class="button btn btn-primary" id="add-classified-save">Publicar Aviso</button>
                            <button class="button btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div> <!-- /. modal-body -->
            </div> <!-- /. modal-content -->
        </div> <!-- /. modal-dialog -->
    </div> <!-- / #add-classified-modal -->
