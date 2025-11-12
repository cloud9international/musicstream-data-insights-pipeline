-- QUERIES FOR MUSICSTREAM PROJECT

USE musicstream;

-- canciones: popularity de Spotify
-- artistas más escuchados: playcount de LastFM


-- 1.TOP 5 Artistas más reproducidos por cada genero musical (LastFM)
SELECT * FROM (SELECT DISTINCT l.artist_name AS Artista, s.genre AS Genero, l.playcount AS Reproducciones
					FROM lastfm AS l
					INNER JOIN spotify AS s
						ON l.artist_name = s.artist_name
					WHERE genre = 'electronic'
					ORDER BY l.playcount DESC
					LIMIT 5) AS electronic

UNION ALL
SELECT * FROM (SELECT DISTINCT l.artist_name, s.genre, l.playcount
					FROM lastfm AS l
					INNER JOIN spotify AS s
						ON l.artist_name = s.artist_name
					WHERE genre = 'afro'
					ORDER BY l.playcount DESC
					LIMIT 5) AS afro

UNION ALL
SELECT * FROM (SELECT DISTINCT l.artist_name, s.genre, l.playcount
					FROM lastfm AS l
					INNER JOIN spotify AS s
						ON l.artist_name = s.artist_name
					WHERE genre = 'soundtrack'
					ORDER BY l.playcount DESC
					LIMIT 5) AS soundtrack
                    
UNION ALL
SELECT * FROM (SELECT DISTINCT l.artist_name, s.genre, l.playcount
					FROM lastfm AS l
					INNER JOIN spotify AS s
						ON l.artist_name = s.artist_name
					WHERE genre = 'k-pop'
					ORDER BY l.playcount DESC
					LIMIT 5) AS kpop;



-- 2. TOP 5 Canciones más populares por genero y su fecha de lanzamiento (Spotify)
SELECT * FROM (SELECT track_name AS Cancion, release_date AS Lanzamiento, genre AS Genero
					FROM spotify
					WHERE genre = 'electronic'
					LIMIT 5) AS electronic

UNION ALL
SELECT * FROM (SELECT track_name AS Cancion, release_date AS Lanzamiento, genre AS Genero
					FROM spotify
					WHERE genre = 'afro'
					LIMIT 5) AS afro

UNION ALL
SELECT * FROM (SELECT track_name AS Cancion, release_date AS Lanzamiento, genre AS Genero
					FROM spotify
					WHERE genre = 'soundtrack'
					LIMIT 5) AS soundtrack

UNION ALL
SELECT * FROM (SELECT track_name AS Cancion, release_date AS Lanzamiento, genre AS Genero
					FROM spotify
					WHERE genre = 'k-pop'
					LIMIT 5) AS kpop;




-- 3. TOP 5 Artistas con más canciones lanzadas por genero musical? (Spotify + LastFM)
-- spotify: artist_name, genre, 
SELECT * FROM (SELECT artist_name AS Artista, COUNT(artist_name) AS Total_Canciones, genre AS Genero
					FROM spotify
					WHERE genre = 'afro'
					GROUP BY artist_name, genre
					ORDER BY Total_Canciones DESC
					LIMIT 5 ) AS afro

UNION ALL
SELECT * FROM (SELECT artist_name AS Artista, COUNT(artist_name) AS Total_Canciones, genre AS Genero
				FROM spotify
				WHERE genre = 'k-pop'
				GROUP BY artist_name, genre
				ORDER BY Total_Canciones DESC
				LIMIT 5 ) AS kpop
                
UNION ALL
SELECT * FROM (SELECT artist_name AS Artista, COUNT(artist_name) AS Total_Canciones, genre AS Genero
					FROM spotify
					WHERE genre = 'electronic'
					GROUP BY artist_name, genre
					ORDER BY Total_Canciones DESC
					LIMIT 5 ) AS electronic

UNION ALL
SELECT * FROM (SELECT artist_name AS Artista, COUNT(artist_name) AS Total_Canciones, genre AS Genero
					FROM spotify
					WHERE genre = 'soundtrack'
					GROUP BY artist_name, genre
					ORDER BY Total_Canciones DESC
					LIMIT 5 ) AS soundtrack;


-- 4. ¿Cuál es el genero musical más reproducido entre 2015 y 2019? (Comparativa por años)
SELECT s.genre AS Genero, SUM(l.playcount) AS Reproducciones
	FROM spotify AS s
	INNER JOIN lastfm AS l
		ON s.artist_name = l.artist_name
	GROUP BY s.genre
	ORDER BY SUM(l.playcount) DESC;


SELECT * FROM (SELECT s.genre AS Genero, s.year AS Año, SUM(l.playcount) AS Reproducciones
					FROM spotify AS s
					INNER JOIN lastfm AS l
						ON s.artist_name = l.artist_name
					WHERE s.year = '2015'
					GROUP BY s.genre
					ORDER BY SUM(l.playcount) DESC
					LIMIT 1) AS dosmil15

UNION ALL
SELECT * FROM (SELECT s.genre AS Genero, s.year AS Año, SUM(l.playcount) AS Reproducciones
					FROM spotify AS s
					INNER JOIN lastfm AS l
						ON s.artist_name = l.artist_name
					WHERE s.year = '2016'
					GROUP BY s.genre
					ORDER BY SUM(l.playcount) DESC
					LIMIT 1) AS dosmil16

UNION ALL
SELECT * FROM (SELECT s.genre AS Genero, s.year AS Año, SUM(l.playcount) AS Reproducciones
					FROM spotify AS s
					INNER JOIN lastfm AS l
						ON s.artist_name = l.artist_name
					WHERE s.year = '2017'
					GROUP BY s.genre
					ORDER BY SUM(l.playcount) DESC
					LIMIT 1) AS dosmil17

UNION ALL
SELECT * FROM (SELECT s.genre AS Genero, s.year AS Año, SUM(l.playcount) AS Reproducciones
					FROM spotify AS s
					INNER JOIN lastfm AS l
						ON s.artist_name = l.artist_name
					WHERE s.year = '2018'
					GROUP BY s.genre
					ORDER BY SUM(l.playcount) DESC
					LIMIT 1) AS dosmil18

UNION ALL
SELECT * FROM (SELECT s.genre AS Genero, s.year AS Año, SUM(l.playcount) AS Reproducciones
					FROM spotify AS s
					INNER JOIN lastfm AS l
						ON s.artist_name = l.artist_name
					WHERE s.year = '2019'
					GROUP BY s.genre
					ORDER BY SUM(l.playcount) DESC
					LIMIT 1) AS dosmil19;



-- 5.Promedio de popularidad de los generos musicales en Spotify entre 2015 y 2019?
SELECT s.genre AS Genero, AVG(s.popularity) AS Popularidad
					FROM spotify AS s
					GROUP BY s.genre
					ORDER BY AVG(s.popularity) DESC;
                    
SELECT * FROM (SELECT s.genre AS Genero, AVG(s.popularity) AS Popularidad, s.year AS Año
					FROM spotify AS s
					WHERE s.year = '2015'
					GROUP BY s.genre
					ORDER BY AVG(s.popularity) DESC) AS dosmil15

UNION ALL
SELECT * FROM (SELECT s.genre AS Genero, AVG(s.popularity) AS Popularidad, s.year AS Año
					FROM spotify AS s
					WHERE s.year = '2016'
					GROUP BY s.genre
					ORDER BY AVG(s.popularity) DESC) AS dosmil16

UNION ALL
SELECT * FROM (SELECT s.genre AS Genero, AVG(s.popularity) AS Popularidad, s.year AS Año
					FROM spotify AS s
					WHERE s.year = '2017'
					GROUP BY s.genre
					ORDER BY AVG(s.popularity) DESC) AS dosmil17

UNION ALL
SELECT * FROM (SELECT s.genre AS Genero, AVG(s.popularity) AS Popularidad, s.year AS Año
					FROM spotify AS s
					WHERE s.year = '2018'
					GROUP BY s.genre
					ORDER BY AVG(s.popularity) DESC) AS dosmil18

UNION ALL
SELECT * FROM (SELECT s.genre AS Genero, AVG(s.popularity) AS Popularidad, s.year AS Año
					FROM spotify AS s
					WHERE s.year = '2019'
					GROUP BY s.genre
					ORDER BY AVG(s.popularity) DESC) AS dosmil19;


-- 6.Los similar artists más recomendados (más repetidos - LastFM)
SELECT COUNT(DISTINCT similar_artists)
	FROM lastfm;








-- X. ¿Cuál es el artista (artist_name) y el género (genre) para la canción menos popular (popularity) de la base de datos?



