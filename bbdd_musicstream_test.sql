CREATE SCHEMA bbdd_musicstream_team_2;
USE bbdd_musicstream_team_2;

-- TABLE 1
CREATE TABLE spotify (	
	id VARCHAR(40) PRIMARY KEY,
    track_name VARCHAR(100),
    artist_name VARCHAR(60),								-- nuestra FK para lastfm
    `year` YEAR,   											-- backticks para que se reconociera como identificador (comillas no)
    genre ENUM('soundtrack', 'k-pop', 'afro', 'electronic'),
    album_type VARCHAR(45),
    release_date DATE,										-- python se convierte fecha de csv de USA a YYYY-MM-DD
    popularity INT
	);
    
    -- TABLE 2
CREATE TABLE lastfm (
	artist_name VARCHAR(60) PRIMARY KEY, 	
    biography TEXT,							
    listeners INT,							
    playcount INT,
    similar_artists VARCHAR(500)
	);
    
SELECT *
	FROM spotify;
    
SELECT *
	FROM lastfm;
    
SELECT spotify.track_name, spotify.artist_name, spotify.genre, lastfm.listeners, lastfm.playcount, spotify.popularity,  lastfm.bio_summary_txt
FROM spotify
LEFT JOIN lastfm
ON spotify.artist_name = lastfm.artist_name
ORDER BY lastfm.playcount DESC;


    /* ChatGPT FK causara problemas si faltan artistas en lastfm mejor no usar FK y usar LEFT JOIN (lesson 10 - clase invertida de este fin de semana)
    PRIMARY KEY (id),
    CONSTRAINT fk_spotify_lastfm
		FOREIGN KEY (artist_name)
        REFERENCES lastfm(artist_name)
        ON UPDATE CASCADE
		ON DELETE SET NULL*/


    /* LEFT JOIN permitira que artistas que faltan en lastfm se vean como NULL dejando la lista completa de spotify (sin reducir la lista) 
    (OJO en python convertir NaN a None para que luego MySQL no de errores)
    ** Nan --> None -- df_lastfm  = df_lastfm.where(pd.notnull(df_lastfm), None) | df_spotify = df_spotify.where(pd.notnull(df_spotify), None))*/ 


/*-- Jupyter Notebook - limpiar las bios, symbolos raros, otra cosa
BIOS- muuuuchos salen como html, text para sacar bio short y bio content (dos columnas nuevas) - mejora los de html pero tiene matices ver cc-artistas_lastfm_test_36_bios_limpieza_test.csv
SYMBOLOS por lo visto se quitan con onerle otro parametro en la conversion (encoding="utf-8" o encoding="utf-8-sig") (Ejemplo: df.to_csv("artistas_lastfm_test_prueba_bios.csv", index=False, encoding="utf-8")
	use el utf-8 en mi prueba y todavia quedaron symbolos raros (creo que menos - pero ya estoy ciega ;) )
SIMILAR ARTISTS - aunque no lo he subido posiblemente saldran como una cadena no una lista - a comprobar. */

/* SE ELIMINARON LAS COLUMNAS ADDICIONALES DE BIOGRAPHY

ALTER TABLE lastfm
    DROP COLUMN bio_summary_txt,       
    DROP COLUMN bio_content_txt; */

DESCRIBE lastfm;         -- ES: ver estructura / EN: view structure
