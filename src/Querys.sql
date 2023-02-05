-- Se quiere conocer que actor ha participado en más películas
SELECT name AS Actor, COUNT(fa.film_id) AS Films
FROM film AS f
LEFT JOIN film_to_actor as fa
ON f.film_id = fa.film_id
LEFT JOIN actor AS a
ON fa.actor_id = a.actor_id
GROUP BY name\
ORDER BY COUNT(fa.film_id) DESC;


-- Se quiere conocer en que idioma hay más películas
SELECT name AS Language, COUNT(f.film_id) AS Peliculas
FROM film AS f
LEFT JOIN language AS l
ON f.language_id = l.language_id
GROUP BY name
ORDER BY COUNT(f.film_id) DESC;


-- Se quiere conocer que películas son mas numerosas en el inventario 
SELECT i.film_id AS Film_id , f.title AS Film, COUNT(f.film_id) AS cantidad
FROM film AS f
LEFT JOIN inventory AS i
ON f.film_id = i.film_id
WHERE i.film_id IS NOT NULL
GROUP BY i.film_id, f.title
ORDER BY COUNT(f.film_id) DESC;


-- Se quieren conocer las películas más caras
SELECT title AS Film , cost AS Precio
FROM film 
ORDER BY cost DESC;


-- Se quiere conocer el precio medio de las películas
SELECT AVG(cost) AS Precio_medio
FROM film;


-- Se quiere conocer la duración media de las películas
SELECT AVG(length) AS Duracion_media
FROM film;


-- Se quiren conocer las películas más largas
SELECT title AS Pelicula , length AS Duracion
FROM film 
ORDER BY length DESC;


-- Se quiere saber que películas no se tienen (no están en inventario)
SELECT title AS Pelicula
FROM film AS f
LEFT JOIN inventory AS i
ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;


-- Se quieren conocer que categorías predominan
SELECT category AS Categoria, COUNT(title) as Peliculas
FROM film 
WHERE category IS NOT NULL
GROUP BY category
ORDER BY COUNT(title) DESC;


-- Se quieren conocer el coste de adquirir todas las películas que no se tienen
SELECT SUM(cost) AS Coste
FROM film AS f
LEFT JOIN inventory AS i
ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;
