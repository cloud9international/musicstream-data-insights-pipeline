# 🎵 MusicStream Project – Unified Music Popularity Analysis  
*(Proyecto MusicStream – Análisis de Popularidad Musical)*

## Project Overview (Resumen del Proyecto)

MusicStream is a data analytics project designed to consolidate fragmented music data from multiple platforms in order to better understand trends in artist popularity, song performance, and genre evolution.

The project integrates data extracted from:

- Spotify API (songs, genres, release dates, popularity metrics)  
- Last.fm API (artist biographies, listener statistics, play counts, and similar artists)

All data is cleaned, normalized, and stored in a relational MySQL database, enabling structured analysis through SQL queries.

This project was developed as an academic exercise to strengthen skills in Python, SQL, data pipelines, and collaborative version control.

---

## Objectives (Objetivos)

- Apply Python and SQL in an end-to-end data pipeline  
- Extract and process data using external APIs  
- Design a relational database with referential integrity  
- Automate data insertion workflows  
- Perform analytical SQL queries  
- Practice collaborative development using Git and GitHub  

---

## Technologies Used (Tecnologías Utilizadas)

- Python (Pandas, Requests, Spotipy, MySQL Connector)  
- Spotify Web API  
- Last.fm API  
- MySQL  
- Jupyter Notebooks  
- Git & GitHub  

---

## Project Structure (Estructura del Proyecto)

```
project/
├── Jupyter notebooks (.ipynb) – data extraction and processing
├── CSV files (.csv) – processed datasets
├── SQL files (.sql) – database creation and queries
└── PDF file (.pdf) – final presentation

README.md
.gitignore
```


---

## How to Run the Project (Cómo Ejecutar el Proyecto)

Run the files in the following order:

### 1️⃣ Spotify Data Extraction (Extracción Spotify)  
**musicstream-spotify-extraccion.ipynb**

- Extracts song data by genre and year  
- Generates: `canciones-spotify.csv`

---

### 2️⃣ Last.fm Data Enrichment (Extracción Last.fm)  
**musicstream-lastfm-extraccion.ipynb**

- Retrieves artist biographies, listeners, play counts, and similar artists  
- Generates: `artistas-lastfm.csv`

---

### 3️⃣ Database Creation (Creación de Base de Datos)  
**create-bbdd-musicstream.sql**

- Creates the `musicstream` schema  
- Builds the `lastfm` and `spotify` tables with primary and foreign keys  

---

### 4️⃣ Data Insertion (Inserción de Datos)  
**insert-to-sql.ipynb**

- Cleans null values  
- Fixes date formats  
- Prevents duplicate inserts (idempotent process)  
- Loads data into MySQL  

---

### 5️⃣ Analytical Queries (Consultas SQL)  
**sql-queries.sql**

Used to answer questions such as:

- Artists with the most songs  
- Most popular genres  
- Years with highest releases  
- Top-rated songs  
- Artist popularity trends  

---

## Key Insights (Hallazgos Clave)

- Popularity metrics (play counts and listeners) do not always correlate with higher qualitative ratings, suggesting that exposure and algorithm-driven promotion influence perceived success more than user preference alone.

- Spotify genre tagging can introduce classification bias. For example, the "K-pop" category included a significant number of artists and tracks unrelated to the genre, affecting genre-based analysis.

- High play counts tend to favor mainstream or heavily promoted artists, highlighting potential algorithmic reinforcement rather than organic popularity.

- Integrating multiple data sources (Spotify and Last.fm) provided a more balanced perspective than relying on a single platform.

- These findings highlight the importance of data validation and multi-source integration when analyzing platform-driven metrics.
---

## Database Design (Diseño de la Base de Datos)

### Table: `lastfm`

| Field | Description |
|------|------------|
| artist_name | Primary key |
| biography | Artist biography |
| listeners | Number of listeners |
| playcount | Total play count |
| similar_artists | Related artists |

---

### Table: `spotify`

| Field | Description |
|------|------------|
| id | Primary key |
| track_name | Song name |
| artist_name | Foreign key to lastfm |
| year | Release year |
| genre | Music genre |
| album_type | Album type |
| release_date | Full release date |
| popularity | Popularity score |

---

## Environment Variables (Variables de Entorno)

API credentials and database access are managed securely using a `.env` file, which is excluded from version control:

```
SPOTIFY_CLIENT_ID=xxxx
SPOTIFY_CLIENT_SECRET=xxxx
LASTFM_API_KEY=xxxx
LASTFM_SECRET_KEY=xxxx

MYSQL_USER=xxxx
MYSQL_PASSWORD=xxxx
MYSQL_HOST=localhost
MYSQL_DATABASE=musicstream
```


---

## Team & Credits (Equipo y Créditos)

This project was originally developed as a collaborative course project by:

- Gisela Barroso — https://github.com/giselabagu  
- Ariana Caldeira — https://github.com/ariana-caldeira  
- Claudia Cervantes — https://github.com/cloud9international  
- Mayka Durán — https://github.com/Maykaduran  
- Miriam Marcos — https://github.com/mirianika191-stack  

Original team repository:  
https://github.com/ariana-caldeira/proyecto-DA-promo-60-modulo-2-team-2  

This repository is a curated portfolio version maintained by **Claudia Cervantes**.

---

## Working Methodology (Metodología de Trabajo)

- Agile sprint-based workflow  
- Task distribution across pipeline phases  
- Continuous version control using GitHub  
- Data validation and iterative improvements  

---

## Delivery (Entrega)

The final project repository includes:

- Data extraction code  
- SQL schema and queries  
- Processed datasets  
- Documentation  
- Presentation materials  

---

## Final Notes (Notas Finales)

- Data extraction is performed using controlled samples  
- The pipeline is fully reproducible  
- SQL insertion is idempotent (no duplicates on re-runs)  
- The project simulates a real-world multi-source data integration workflow  
