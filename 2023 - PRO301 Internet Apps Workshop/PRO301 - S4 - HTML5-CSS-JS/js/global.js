// To avoid DOM manipulation errors, we wait for the DOM to be ready
document.addEventListener("DOMContentLoaded", function (event) {
	// Add the year to #footer-year
	document.querySelector('#footer-year').innerHTML = new Date().getFullYear();

	// Add the date and current time, with seconds in real time, into #current-time
	let now = new Date();

	// Set the date and insert it into #current-date
	let date = now.toLocaleDateString('es-ES', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' });
	document.querySelector('#current-date').innerHTML = date;

	// Set the time and insert it into #current-time. Outside of the setInterval function to avoid a delay
	let time = now.toLocaleTimeString(); // Get the time
	document.querySelector('#current-time').innerHTML = time;

	// Set interval to update the time every second
	setInterval(function () {
		now = new Date(); // Refresh the date
		time = now.toLocaleTimeString(); // Get the time
		document.querySelector('#current-time').innerHTML = time;
	}, 1000); // 1000ms = 1s

	// Responsive menu. On click .navbar-burger, add or remove is-active class to #navbarContent, to show or hide the menu
	document.querySelector('.navbar-burger').addEventListener('click', function () {
		document.querySelector('.navbar-burger').classList.toggle('is-active');
		document.querySelector('#navbarContent').classList.toggle('is-active');
	});

	// Load default articles from localStorage
	setDefaultArticles();

	// Get query parameters from URL
	let urlParams = new URLSearchParams(window.location.search);
	article_id    = urlParams.get('article_id');
	category      = urlParams.get('category');

	// If "category" query parameter is present, load the articles from that category
	if (category !== null) {
		parseArticles(category);
		articlesCounter();
		categoryName();
	} else if (document.querySelector('body.index') !== null || document.querySelector('body.category') !== null) {
		// If we have "index" or "category" body class, load the articles from "news" category as defaults
		parseArticles('news');
		articlesCounter();
		categoryName();
	} else if (article_id !== null) {
		// If we have "article" query parameter, load the article with that ID
		loadArticle(article_id);
	} else {
		// If we have no query parameters, load the first article from "news" category
		parseArticles('news');
		articlesCounter();
		categoryName();
	}

	// Click #add-article to add a new article, open Bulma modal
	document.querySelector('#add-article').addEventListener('click', function () {
		document.querySelector('#add-article-modal').classList.add('is-active');
	});

	// Close modal on every instance of .add-article-close
	document.querySelectorAll('.add-article-close').forEach(function (element) {
		element.addEventListener('click', function () {
			document.querySelector('#add-article-modal').classList.remove('is-active');
		});
	});

	// On click .add-article-save, capture #add-article-form values and save them to localStorage
	document.querySelector('#add-article-save').addEventListener('click', function () {
		// Get the values from the form
		let category = document.querySelector('#add-article-category').value;
		let title = document.querySelector('#add-article-title').value;
		let excerpt = document.querySelector('#add-article-excerpt').value;
		let image = document.querySelector('#add-article-image').value;
		let content = document.querySelector('#add-article-content').value;
		let source_name = document.querySelector('#add-article-source-name').value;
		let source_url = document.querySelector('#add-article-source-url').value;

		// Save the article to localStorage
		saveArticle(category, title, excerpt, image, content, source_name, source_url);

		// Close the modal
		document.querySelector('#add-article-modal').classList.remove('is-active');

		return false;
	});

});

// Set default articles at localStorage
function setDefaultArticles() {
	// Check if there are articles in localStorage
	if (localStorage.getItem('articles') !== null) {
		// If there are articles, return and do nothing
		return false;
	}

	// Default articles, with secuential IDs
	// BTW: this should really came from an API, but we're not there yet at the course :)
	let defaultArticles = [
		{
			id: 1,
			category: 'news',
			title: 'Gigantic dinosaur skeleton on show in London',
			excerpt: 'A colossus has landed in London: A cast of what was one of the biggest animals ever to walk the Earth is now on show at the Natural History Museum.',
			image: 'images/129177060_230327_077-credit-trustees-of-the-nhm-london.jpg',
			content: '<p>A colossus has landed in London: A cast of what was one of the biggest animals ever to walk the Earth is now on show at the Natural History Museum.</p><p>Patagotitan was a dinosaur that lived 100 million years ago in South America.</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>The museum has brought over not just a representative skeleton but some of the real fossil bones first discovered in Argentina in 2014. The largest is a 2.4m-long femur, or thigh bone. It\'s been erected upright to give visitors an extraordinary selfie opportunity.</p>',
			source_name: 'BBC',
			source_url: 'https://www.bbc.com/news/science-environment-65094602'
		},
		{
			id: 2,
			category: 'news',
			title: 'Antarctic ocean currents heading for collapse - report',
			excerpt: 'Rapidly melting Antarctic ice is causing a dramatic slowdown in deep ocean currents and could have a disastrous effect on the climate, a new report warns.',
			image: 'images/129216734_190129cdea4a0f7859f7386e9b8b6871e70f5e12.jpg',
			content: '<p>Rapidly melting Antarctic ice is causing a dramatic slowdown in deep ocean currents and could have a disastrous effect on the climate, a new report warns.</p><p>The deep- water flows which drive ocean currents could decline by 40 % by 2050, a team of Australian scientists says.The currents carry vital heat, oxygen, carbon and nutrients around the globe.</p><p>Previous research suggests a slowdown in the North Atlantic current could cause Europe to become colder.The study, published in the journal Nature, also warns the slowdown could reduce ocean\'s ability to absorb carbon dioxide from the atmosphere.</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>The report outlines how the Eart\`s network of ocean currents are part driven by the downwards movement of cold, dense saltwater towards the sea bed near Antarctica. But as fresh water from the ice cap melts, sea water becomes less salty and dense, and the downwards movement slows. These deep ocean currents, or "overturnings", in the northern and southern hemispheres have been relatively stable for thousands of years, scientists say, but they are now being disrupted by the warming climate.</p>',
			source_name: 'BBC',
			source_url: 'https://www.bbc.com/news/world-australia-65120327'
		},
		{
			id: 3,
			category: 'news',
			title: 'A 106-year-old from the Philippines is Vogue\'s oldest ever cover model',
			excerpt: 'Whang-Od — also known as Maria Oggay — has been perfecting the art of hand-tapping tattoos since she was a teen, learning under her father\'s instruction.',
			image: 'images/cnn.com_cnnnext_dam_assets_230331100821-01b-philippines-vogue-oldest-cover-model-crop.jpg',
			content: '<p>Vogue Philippines has revealed Apo Whang-Od as the cover star of its April issue, a move that makes the 106-year-old tattoo artist from the Philippines the oldest person ever to appear on the front of Vogue.</p><p>Whang-Od — also known as Maria Oggay — has been perfecting the art of hand-tapping tattoos since she was a teen, learning under her father\'s instruction.</p><p>Residing in the mountain village of Buscalan, about 15 hours north of Manila, in Kalinga province, she is considered the country\'s oldest mambabatok — or traditional Kalinga tattooist.</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>Once, the hand-tapped tattoos that Whang-Od creates using just a bamboo stick, a thorn from a pomelo tree, water and coal, were earned by indigenous Butbut warriors. Now, international visitors seeking her signature geometric designs make up much of her clientele. "Heralded as the last mambabatok of her generation, she has imprinted the symbols of the Kalinga tribe—signifying strength, bravery, and beauty—on the skin of thousands of people who have made the pilgrimage to Buscalan," Vogue Philippines said in a post on social media</p>',
			source_name: 'BBC',
			source_url: 'https://edition.cnn.com/style/article/vogue-philippines-april-cover-intl-scli/index.html'
		},
		{
			id: 4,
			category: 'sports',
			title: 'Tenis: Nadal y Djokovic, los grandes favoritos en el Abierto de Australia',
			excerpt: 'El Abierto de Australia, primer Grand Slam de la temporada, arranca este lunes en Melbourne con la presencia de los dos mejores tenistas del mundo, el español Rafael Nadal y el serbio Novak Djokovic.',
			image: 'images/wimbledon-i.jpeg',
			content: '<p>Infinidad de idas y vueltas se dieron a lo largo del último año a raíz del veto de Wimbledon para que rusos y bielorrusos compitan libremente tras la invasión a Ucrania. El Grand Slam londinense fue el único de los cuatro en llevar a cabo esta medida y eso les costó una sanción millonaria por parte de la ATP y la WTA, además de que el torneo no repartió puntos.</p><p>"Nuestra intención actual es aceptar inscripciones de jugadores rusos y bielorrusos sujeto a que compitan como atletas "neutrales" y cumplan con las condiciones apropiadas. Estos prohibirán las expresiones de apoyo a la invasión rusa de Ucrania en varias formas y prohibirán la entrada de jugadores que reciban fondos de los estados rusos y/o bielorrusos (incluido el patrocinio de empresas operadas o controladas por los estados) en relación con su participación en The Championships", expresó el comunicado oficial.</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>Andy Murray, exnúmero uno del mundo, dio su parecer en las últimas horas y parece que no estaba equivocado. La sanción impuesta sería cosa del pasado y todo volvería a la "normalidad". Para aumentar la presión sobre el prestigioso torneo, se supo que la ATP y la WTA amenazaron con retirar la licencia a los torneos previos que se disputan en suelo británico, como Queen´s, lo que supondría un mazazo económico muy importante para la federación británica de tenis.</p>',
			source_name: 'ESPN',
			source_url: 'https://www.espn.cl/tenis/nota/_/id/11731137/wimbledon-permitira-competir-a-rusos-y-bielorrusos'
		},
		{
			id: 5,
			category: 'sports',
			title: 'Fórmula 1: Max Verstappen dominó los ensayos del GP de Australia',
			excerpt: 'Que Red Bull es el gran favorito para el GP de Australia, tercera fecha de Fórmula 1 que se puede ver por Star+, es casi una obviedad. La diferencia de los autos del equipo austríaco con el resto es abismal.',
			image: 'images/formula1-i.jpeg',
			content: '<p>Que Red Bull es el gran favorito para el GP de Australia, tercera fecha de Fórmula 1 que se puede ver por Star+, es casi una obviedad. La diferencia de los autos del equipo austríaco con el resto es abismal. Que Aston Martin, de la mano de Fernando Alonso, es el mejor de los terrenales en el arranque de la 74ª temporada del Mundial, es algo que ya dejó de sorprender.</p><p>Que Ferrari trata de meterse en la pelea, pero que mira desde lejos, está claro.Que Mercedes intenta encontrar el rumbo perdido es sabido.Sin embargo, y en medio de tantas certezas, el primer día de actividad en Melbourne dejó una enorme duda: nadie sabe cómo es el ritmo de carrera de cada auto.Lo único seguro es que Max Verstappen fue el más veloz.</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>En cada cita de Fórmula 1, las escuderías utilizan el segundo ensayo de los viernes para realizar simulacros de carrera, aprovechando que se disputa a la misma hora que la competencia. Pero en Australia todo esto cayó en saco roto cuando comenzó a llover. Apenas se habían disputado un puñado de minutos de la tanda, Alonso se había puesto arriba (no le alcanzó para bajar el tiempo de Verstappen del primer entrenamiento), cuando comenzaron a caer las primeras gotas. Ya nada de lo que ocurriría de ahí en adelante tendría sentido; especialmente porque no hay pronóstico de lluvia para el resto del fin de semana. ¿Cómo se comportará cada auto con tanque lleno en el asfalto del semipermanente australiano? Por ahí pasa la gran duda.</p>',
			source_name: 'ESPN',
			source_url: 'https://www.espn.cl/deporte-motor/f1/nota/_/id/11830833/formula-1-max-verstappen-australia-alonso-fernando-red-bull-aston-martin'
		},
		{
			id: 6,
			category: 'sports',
			title: 'Cody, entre la emoción y la sed de revancha: "Es muy bonito volver a Chile; quiero jugar contra INFINITY"',
			excerpt: 'Six Karma venció a Rainbow 7 por 3-2, disputará la final del Torneo Apertura de la Liga Latinoamericana de League of Legends (LLA) y tuvimos la oportunidad de entrevistar a Cody.',
			image: 'images/cody-esport-i.jpeg',
			content: '<p>Six Karma venció a Rainbow 7 por 3-2, disputará la final del Torneo Apertura de la Liga Latinoamericana de League of Legends (LLA) y en ESPN.com tuvimos la oportunidad de entrevistar a Cody sobre lo que significa regresar a Chile y contra quién se quiere enfrentar.</p><p>“Es muy bonito volver a jugar en Chile, mi última final allá fue cuando jugaba en división 2 hace 4 años y todavía estaba en el colegio", comentó el midliner y continuó: "Una sola vez se jugó un final en Chile y yo la vi desde mi casa, me dije a mí mismo que algún día iba a estar ahí”.</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>El jugador chileno tuvo palabras de elogio para Snaker y Shu Hari: “Se dice que la botlane de nuestro equipo es lo más débil del equipo y parece que se cambiaron los papeles. Nosotros jugamos muy mal en mid y la jungla, pero la botlane nos carreó. Nos estamos enfocando ahora en ganar la final y sabemos de lo que es capaz nuestra botlane, jugaron excelente esta serie”</p><p>“Después de que perdimos el cuarto juego, mis coach me dijeron que era una prueba de fuego en mí.Me dijeron que vaya a jugar sin repercusiones, sin resentimientos, que si perdemos cambiamos de página.Pero la verdad, yo no quería perder por culpa mía, se siente mal cuando el equipo pierde por culpa de uno.Quise cambiar de chip, fue difícil pero cuando fue avanzando el juego me fui sintiendo mejor”, señaló el mid respecto al nivel que demostró en las primeras partidas y cómo dio vuelta la situación en el 5to.</p>',
			source_name: 'ESPN',
			source_url: 'https://www.espn.cl/esports/nota/_/id/11822590/six-karma-lla-league-of-legends-cody-revancha-emocion-volver-chile-infinity'
		},
		{
			id: 7,
			category: 'business',
			title: 'Can I Retire at 65 with $2.5 Million?',
			excerpt: 'For most people, it will be little or no problem to retire at age 65 if they have $2.5 million in savings. This amount of capital invested prudently is likely to provide sufficient income for a lifestyle comfortable enough to satisfy a large majority of retirees.',
			image: 'images/retire-bd153e07f6b2ac1d95bed699bcccbd13.jpg',
			content: '<p>For most people, it will be little or no problem to retire at age 65 if they have $2.5 million in savings. This amount of capital invested prudently is likely to provide sufficient income for a lifestyle comfortable enough to satisfy a large majority of retirees.</p><p>And some variables that could change.This includes an extended bout of high inflation, a protracted market downturn and unexpected healthcare costs.And it can also include a longer- than - projected lifespan.However, surveys of retiree financial satisfaction indicate that even much lower sums are probably enough to pay for an enjoyable retirement.</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>A retirement nest egg of $2.5 million can likely produce an annual income of $100,000 for as long as you are likely to live. This is using the 4% withdrawal rate that many advisors consider safe. After starting with the first withdrawal of 4% of the total, the annual withdrawal will adjust for inflation. For example, if inflation runs at the 2% rate that is the target of federal policymakers, the retiree will withdraw $100,000 the first year of retirement, $102,000 the second year, $104,040 the third year and so on.</p><p>According to this model and conventional wisdom, a 4% withdrawal rate will allow a portfolio to last for at least 30 years.This would permit a 65-year - old retiree to maintain consistent purchasing power until age 95 and beyond.For most retirees, this will likely be adequate to maintain a satisfying standard of living.Only about 3% of 2, 000 retirees surveyed by the Employee Benefit Research Institute in 2022 spent $7, 000 or more per month, equivalent to $84, 000 in annual spending.</p>',
			source_name: 'Yahoo! Finance',
			source_url: 'https://finance.yahoo.com/news/retire-65-2-5-million-130034992.html'
		},
		{
			id: 8,
			category: 'business',
			title: 'Seeking at Least 8% Dividend Yield? Goldman Sachs Suggests 2 Dividend Stocks to Buy',
			excerpt: 'One thing is certain in the stock markets lately: their inherent uncertainty is taking charge, and high volatility is here to stay. Now, we’re dealing with the fallout from that crisis, and inflation and interest rates both remain high. It’s a textbook case for going long on defensive stocks.',
			image: 'images/dividends-f7e60e32d514c7a8dcd5f195fbf45d13.jpg',
			content: '<p>One thing is certain in the stock markets lately: their inherent uncertainty is taking charge, and high volatility is here to stay. For months, investors and economists have worried about the recessionary effects of the Federal Reserve’s anti-inflationary interest rate hikes – but the recent bank crisis has added another layer of concern to an already tumultuous situation.</p><p>Now, we’re dealing with the fallout from that crisis, and inflation and interest rates both remain high.It’s a textbook case for going long on defensive stocks.That’s the view of Deep Mehta, a vice president at Goldman Sachs.Closing out the month of March, Mehta says: “Recent stress in the banking industry has resulted in renewed investor concerns around the economic growth outlook, and increased volatility in risk assets.While the price action stress has somewhat stabilized, potential for reduced credit availability is likely to pose a growth headwind as per GS economists.We believe this backdrop warrants selectively positioning in more defensive pockets of the market.”</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>It’s a mindset that naturally turns us toward dividend stocks. These are the traditional defensive investment plays, offering steady payouts to shareholders that guarantee an income stream whether markets go up or down. Against this backdrop, Goldman Sachs analysts have given the thumbs-up to two dividend stocks yielding at least 8%. Opening up the TipRanks database, we examined the details behind these two to find out what else makes them compelling buys.</p>',
			source_name: 'Yahoo! Finance',
			source_url: 'https://finance.yahoo.com/news/seeking-least-8-dividend-yield-133040123.html'
		},
		{
			id: 9,
			category: 'business',
			title: 'Procrastinators, Rejoice: The 6.89% I bonds Will Beat the Old 9.62% Bonds in Just 4 Years',
			excerpt: 'With a yield of 9.62%, the recently expired Series I bond was understandably popular. With interest rates rising, bond funds are down this year and banks continue to offer miserly rates on deposit accounts.',
			image: 'images/yahoo-b815e3c2b7343af7760b7d6b72a840bc.jpg',
			content: '<p>With a yield of 9.62%, the recently expired Series I bond was understandably popular. With interest rates rising, bond funds are down this year and banks continue to offer miserly rates on deposit accounts. So it’s no wonder that a surging horde of investors crashed the Treasury.gov site at the end of last month, trying to beat the clock and lock in the highest rate the bonds have paid since they were introduced in 1998.</p><p>On the day of the Friday, Oct. 28 deadline to lock in the old rate, the Treasury sold $979 million of I bonds.In a bear market, this investment that offered robust yield and low risk got investors riled up.But now it turns out that investors should have waited.Those who picked up new I bonds yielding 6.89% in the latest auction will find themselves making more money in a few years than those who rushed in to grab the old, higher rate.How is that possible? Take a deep dive into the intricacies of I Bonds below and consider matching with a financial advisor for free to see if I Bonds make sense in your portfolio.</p><p class="video"><video controls><source src="videos/all-over-in-10-seconds.mp4" type="video/mp4">Tu navegador no soporta el elemento video. Descarga el video <a href="videos/all-over-in-10-seconds.mp4">aquí</a>.</video></p><p>The reason is that rates on I bonds are made up of two components: a guaranteed base rate and an adjustable inflation rate that changes with every new semi-annual auction. That eye-popping 9.62% rate was guaranteed only for the first six months that investors hold their bonds. After that, the rate will be heading down while the rate on the November 2022 bonds will be steadily staying up.<p></p>That’s because bonds purchased between May 1, 2020, and Oct. 31, 2022, came with a base rate of 0%.The new bonds are being issued with a base rate of 0.40%.The new inflation rate of 6.49% means all those previous investors will get just that rate of return, while buyers of the new bonds will get a composite rate that includes the base, giving them 6.89%.</p>',
			source_name: 'Yahoo! Finance',
			source_url: 'https://finance.yahoo.com/news/pays-procrastinate-6-89-bonds-175401666.html'
		}
	];

	// Save the default articles to localStorage
	localStorage.setItem('articles', JSON.stringify(defaultArticles));

	return true;
}

// Save an article to localStorage, with passed parameters
function saveArticle(category, title, excerpt, image, content, source_name, source_url) {
	// Get the current articles from localStorage
	let articles = JSON.parse(localStorage.getItem('articles'));

	let newArticleId = 1;

	// If there are no articles, create an empty array
	if (articles === null) {
		articles = [];
	} else {
		// If there are articles, get the last article ID and add 1 to it
		let lastArticleId = articles[articles.length - 1].id;
		newArticleId = lastArticleId + 1;
	}

	// Create a new article object
	let article = {
		id: newArticleId,
		category: category,
		title: title,
		excerpt: excerpt,
		image: image,
		content: content,
		source_name: source_name,
		source_url: source_url
	};

	// Add the article to the articles array
	articles.push(article);

	// Save the articles array to localStorage
	localStorage.setItem('articles', JSON.stringify(articles));

	// Alert the user
	alert('Artículo guardado correctamente');

	// Reload the page
	location.reload();

	return true;
}

// Parse current articles from localStorage and insert them into the DOM
// Use "all" as category to show all articles
function parseArticles( category = 'news' ) {
	// If #article-card-template doesn't exist, return and do nothing
	if (document.querySelector('#article-card-template') === null) {
		return false;
	}

	// Get the articles from localStorage
	let articles = JSON.parse(localStorage.getItem('articles'));

	// Only show articles from the selected category
	if (category !== 'all') {
		articles = articles.filter(function (article) {
			return article.category === category;
		});
	}

	// If there are no articles, return and do nothing
	if (articles === null) {
		alert('Error: No hay artículos para mostrar');
		return false;
	}

	// Read #article-card-template into a variable
	let articleCardTemplate = document.querySelector('#article-card-template').innerHTML;
	let outputHtml = '';

	// For each article, create a new card and insert it into #articles-gallery
	articles.forEach(function (article) {
		// Use a new copy of the template for each article
		let outputHtml = articleCardTemplate;

		// Replace the placeholders with the article data
		outputHtml = interpolate(outputHtml, {
			id: article.id,
			category: article.category,
			title: article.title,
			excerpt: article.excerpt,
			image: article.image,
			content: article.content,
			source_name: article.source_name,
			source_url: article.source_url,
			link: 'article.html?article_id=' + article.id
		});

		// Insert the article card into #articles-gallery
		document.querySelector('#articles-gallery').innerHTML += outputHtml;
	});

	return true;
}

function loadArticle( article_id = 0 ) {
	// Get the articles from localStorage
	let articles = JSON.parse(localStorage.getItem('articles'));

	// If there are no articles, return and do nothing
	if (articles === null || article_id === 0) {
		alert('Error: No hay artículos para mostrar');

		// Redirect to index.html
		window.location.href = 'index.html';

		return false;
	}

	// Get the article from the articles array
	let article = articles.find(function (article) {
		return article.id == article_id;
	});

	// If the article doesn't exist, return and do nothing
	if (article === undefined) {
		alert('Error: No se encontró el artículo');

		// Redirect to index.html
		window.location.href = 'index.html';

		return false;
	}

	// Read #article-template into a variable
	let articleTemplate = document.querySelector('#article-template').innerHTML;
	let outputHtml = articleTemplate;

	// Replace the placeholders with the article data
	outputHtml = interpolate(outputHtml, {
		id: article.id,
		category: article.category,
		title: article.title,
		excerpt: article.excerpt,
		image: article.image,
		content: article.content,
		source_name: article.source_name,
		source_url: article.source_url,
		link: '?article=' + article.id
	});

	// Insert the article into #article
	document.querySelector('#article-content').innerHTML = outputHtml;

	return true;
}

function articlesCounter() {
	// If #article-count doesn't exist, return and do nothing
	if (document.querySelector('#article-count') === null) {
		return false;
	}

	// Article counter. Count how many .news-gallery__item there are and add it to #article-count
	let articleCount = document.querySelectorAll('.news-gallery__item').length;
	// If there are more than 0 article, add the number to #article-count
	if (articleCount > 0) {
		document.querySelector('#article-count').innerHTML = articleCount;
	} else {
		// If there are no articles, add the text "Ninguno"
		document.querySelector('#article-count').innerHTML = "Ninguno";
	}
}

function categoryName() {
	// If #category-name doesn't exist, return and do nothing
	if (document.querySelector('#category-name') === null) {
		return false;
	}

	// Get the category from the URL
	let urlParams     = new URLSearchParams(window.location.search);
	let category      = urlParams.get('category');
	let category_name = '';

	// If there is no category, return and do nothing
	if (category === null) {
		category_name = 'Noticias';
	}

	// Switch case to change the category name
	switch (category) {
		case 'news':
			category_name = 'Noticias';
			break;
		case 'sports':
			category_name = 'Deportes';
			break;
		case 'entertainment':
			catecategory_namegory = 'Entretenimiento';
			break;
		default:
			category_name = 'Noticias';
	}

	// Add the category name to #category-name
	document.querySelector('#category-name').innerHTML = category_name;
}

/**
 * Get a template from a string
 * https://stackoverflow.com/a/41015840
 * @param  {String} str    The string to interpolate
 * @param  {Object} params The parameters
 * @return {String}        The interpolated string
 */
function interpolate(str, params) {
	let names = Object.keys(params);
	let vals = Object.values(params);
	return new Function(...names, `return \`${str}\`;`)(...vals);
}
