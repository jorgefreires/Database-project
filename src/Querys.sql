{\rtf1\ansi\ansicpg1252\cocoartf2706
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Se quiere conocer que actor ha participado en m\'e1s pel\'edculas\
SELECT name AS Actor, COUNT(fa.film_id) AS Films\
FROM film AS f\
LEFT JOIN film_to_actor as fa\
ON f.film_id = fa.film_id\
LEFT JOIN actor AS a\
ON fa.actor_id = a.actor_id\
GROUP BY name\
ORDER BY COUNT(fa.film_id) DESC;\
\
\
-- Se quiere conocer en que idioma hay m\'e1s pel\'edculas\
SELECT name AS Language, COUNT(f.film_id) AS Peliculas\
FROM film AS f\
LEFT JOIN language AS l\
ON f.language_id = l.language_id\
GROUP BY name\
ORDER BY COUNT(f.film_id) DESC;\
\
\
-- Se quiere conocer que pel\'edculas son mas numerosas en el inventario \
SELECT i.film_id AS Film_id , f.title AS Film, COUNT(f.film_id) AS cantidad\
FROM film AS f\
LEFT JOIN inventory AS i\
ON f.film_id = i.film_id\
WHERE i.film_id IS NOT NULL\
GROUP BY i.film_id, f.title\
ORDER BY COUNT(f.film_id) DESC;\
\
\
-- Se quieren conocer las pel\'edculas m\'e1s caras\
SELECT title AS Film , cost AS Precio\
FROM film \
ORDER BY cost DESC;\
\
\
-- Se quiere conocer el precio medio de las pel\'edculas\
SELECT AVG(cost) AS Precio_medio\
FROM film;\
\
-- Se quiere conocer la duraci\'f3n media de las pel\'edculas\
SELECT AVG(length) AS Duracion_media\
FROM film;\
\
\
-- Se quiren conocer las pel\'edculas m\'e1s largas\
SELECT title AS Pelicula , length AS Duracion\
FROM film \
ORDER BY length DESC;\
\
\
-- Se quiere saber que pel\'edculas no se tienen (no est\'e1n en inventario)\
SELECT title AS Pelicula\
FROM film AS f\
LEFT JOIN inventory AS i\
ON f.film_id = i.film_id\
WHERE i.inventory_id IS NULL;\
\
\
-- Se quieren conocer que categor\'edas predominan\
SELECT category AS Categoria, COUNT(title) as Peliculas\
FROM film \
WHERE category IS NOT NULL\
GROUP BY category\
ORDER BY COUNT(title) DESC;\
\
\
-- Se quieren conocer el coste de adquirir todas las pel\'edculas que no se tienen\
SELECT SUM(cost) AS Coste\
FROM film AS f\
LEFT JOIN inventory AS i\
ON f.film_id = i.film_id\
WHERE i.inventory_id IS NULL;}