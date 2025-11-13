# Proyecto_modulo2_E2

# Qué hace el proyecto.

Musicstream: La Plataforma Unificada de Análisis Musical

Musicstream es una herramienta analítica de vanguardia diseñada para superar el desafío fundamental de la industria musical: la fragmentación de los datos. Hoy en día, la información valiosa sobre el engagement de los artistas se encuentra dispersa en múltiples plataformas (servicios de streaming, redes sociales, tiendas de música y catálogos de metadata). Esta separación hace que sea extremadamente difícil para los sellos discográficos, managers y analistas de tendencias obtener una visión holística y accionable del rendimiento de un artista o una canción.

Musicstream resuelve este problema consolidando y combinando datos de estas fuentes dispares en una única base de datos centralizada y optimizada.


# Por qué el proyecto es útil.

Utilizamos SQL para ingerir, limpiar y normalizar los datos. Esta información unificada es luego expuesta a través de una API flexible y un panel de control interactivo.

Nuestro valor radica en la capacidad de generar Insights Cruzados que revelan correlaciones y tendencias invisibles en los datos aislados.

Por ejemplo, Musicstream puede identificar:

Cuales son los artistas más escuchados y valorados en diferentes periodos.

Como un genero de música puede destacar más que otro en fechas concretas.

En resumen, Musicstream transforma montones de datos crudos en inteligencia de negocio estratégica y en tiempo real, impulsando decisiones más informadas en la promoción, contratación y distribución musical.

# Cómo pueden comenzar los usuarios con el proyecto.

Tener instalado una versión actualizada de Python 3.x.
posicionarse en la terminal en la carpeta donde hayas dedicido que irá la Repo del proyecto.
Clonar el repositorio (si está en GitHub):
git clone https://github.com/ariana-caldeira/proyecto-DA-promo-60-modulo-2-team-2.git
Buscar y ejecutar diferentes archivos:

1. MusicStream_Spotify_Extraccion.ipynb (con este archivo crearemos un documento en formato .csv que necesitaremos en el punto 2 y 4)
2. MusicStream_LastFM_Extraccion.ipynb (con este archivo crearemos un documento en formato .csv que necesitaremos en el punto 4)
3. CREATE_bbdd_musicstream.sql
4. Insert_to_SQL.ipynb

# Dónde pueden recibir ayuda los usuarios con tu proyecto.

Si tienes problemas, encuentras un error o tienes alguna pregunta:

Reporte de Problemas: Abre un Issue en el repositorio de GitHub con una descripción detallada del problema, esto se implementará en el tablón del proyecto y se le asignará una prioridad de tratamiento y una persona del equipo para que lo resuelva.

# Quién mantiene y contribuye con el proyecto.

El proyecto es mantenido actualmente por:

[ariana-caldeira / Ariana Caldeira]
[Maykaduran / Mayka Durán]
[cloud9international / Claudia Cervantes]
[mirianika191-stack / Miriam Marcos]
[giselabagu / Gisela Barroso]

# Añadir librerías y recursos usados, instalaciones externas necesarias (si procede), etc.

Se necesita Python con las siguientes importaciones e instalaciones:

- import spotipy
- from spotipy.oauth2 import SpotifyClientCredentials
- import pandas as pd
- import time
- import requests, time, re, html
- from io import BytesIO
- import mysql.connector
- from mysql.connector import errorcode

