-- DROP SCHEMA IF EXISTS musicstream_team_2;

CREATE SCHEMA musicstream_team_2;

USE musicstream_team_2;

-- TABLE 1
CREATE TABLE spotify (	
	id VARCHAR(40) PRIMARY KEY,
    track_name VARCHAR(150),
    artist_name VARCHAR(255),								-- nuestra FK para lastfm
    `year` YEAR,   											-- backticks para que se reconociera como identificador (comillas no)
    genre ENUM('soundtrack', 'k-pop', 'afro', 'electronic'),
    album_type VARCHAR(45),
    release_date DATE,										-- python se convierte fecha de csv de USA a YYYY-MM-DD
    popularity INT
	);

    -- TABLE 2
CREATE TABLE lastfm (
	artist_name VARCHAR(255) PRIMARY KEY, 	
    biography TEXT,							
    listeners INT,							
    playcount INT,
    similar_artists VARCHAR(500)
	);
 