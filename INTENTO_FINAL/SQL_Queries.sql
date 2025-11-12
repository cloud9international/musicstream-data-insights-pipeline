-- QUERIES FOR MUSICSTREAM PROJECT

USE musicstream;

SELECT *
	FROM spotify;
    
SELECT s.artist_name, s.genre, MAX(s.popularity) AS Spotify, MAX(l.playcount) AS LastFM
	FROM spotify AS s
    INNER JOIN lastfm AS l
		ON l.artist_name = s.artist_name
	WHERE s.genre = 'electronic'
	GROUP BY s.artist_name, s.genre
    ORDER BY MAX(s.popularity) DESC;

-- canciones: popularity de Spotify
-- artistas más escuchados: playcount de LastFM
    
SELECT spotify.track_name, spotify.artist_name, spotify.genre, lastfm.listeners, lastfm.playcount, spotify.popularity,  lastfm.bio_summary_txt
	FROM spotify
	LEFT JOIN lastfm
		ON spotify.artist_name = lastfm.artist_name
	ORDER BY lastfm.playcount DESC;
    
/* - ¿Cuál es el artista con más musicas?
- ¿Qué género es el mejor valorado?
- ¿Cuál es la canción mejor valorada?
- ¿Cuál es el artista con más valoración?
- ¿Qué país tiene más artistas? (ordenar por popularidad)
- ¿Cuál es el género musical con el mayor promedio de popularidad en Spotify?
- ¿Cuál es el artista con el mayor número total de "oyentes" (listeners) en la tabla lastfm? (Solo el nombre del artista).
- ¿Cuál es la fecha de lanzamiento (release_date) con la canción (o canciones) más popular (mayor popularity)?
- ¿Cuál es el artista (artist_name) y el género (genre) para la canción menos popular (popularity) de la base de datos?*/

-- ¿Cuál es el artista con más musicas por genero musical?
-- spotify: artist_name, genre, 

SELECT * FROM (SELECT artist_name, COUNT(artist_name) AS Total_Musics, genre
				FROM spotify
				WHERE genre = 'afro'
				GROUP BY artist_name, genre
				ORDER BY Total_Musics DESC
				LIMIT 1 ) AS afro

UNION ALL
SELECT * FROM (SELECT artist_name, COUNT(artist_name) AS Total_Musics, genre
				FROM spotify
				WHERE genre = 'k-pop'
				GROUP BY artist_name, genre
				ORDER BY Total_Musics DESC
				LIMIT 1 ) AS kpop
                
UNION ALL
SELECT * FROM (SELECT artist_name, COUNT(artist_name) AS Total_Musics, genre
				FROM spotify
				WHERE genre = 'electronic'
				GROUP BY artist_name, genre
				ORDER BY Total_Musics DESC
				LIMIT 1 ) AS electronic

UNION ALL
SELECT * FROM (SELECT artist_name, COUNT(artist_name) AS Total_Musics, genre
				FROM spotify
				WHERE genre = 'soundtrack'
				GROUP BY artist_name, genre
				ORDER BY Total_Musics DESC
				LIMIT 1 ) AS soundtrack;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- ¿Qué género es el mejor valorado?
-- spotify: genre, popularity
SELECT genre, COUNT(popularity) AS Popularidad
	FROM spotify
    GROUP BY genre
    ORDER BY Popularity DESC;





-- ¿Cuál es la canción mejor valorada?