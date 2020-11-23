#Scrapeo de un sitio web a partir de un HTML local
#App Bajalibros

#Cargamos librerías
library(tidyverse)
library(rvest)

#Levantamos html
pagina_gplay <- read_html("BajaLibros.html")

fechas <- html_nodes(pagina_gplay, ".kx8XBd .p2TkOb")
fechas <- html_text(fechas)

reviews <- html_nodes(pagina_gplay, ".UD7Dzf")
reviews <- html_text(reviews)

emisor <- html_nodes(pagina_gplay, ".kx8XBd .X43Kjb")
emisor <- html_text(emisor)


dataset <- tibble(fecha=fechas,
                  emisor = emisor,
                  reseña=reviews)    
head(dataset)

#Análisis exploratorio de respuestar para evaluar cómo incorporarlas al dataset
#Levanto la fecha de respuesta a la reseña
fecha_respuesta <- html_nodes(pagina_gplay, ".LVQB0b .p2TkOb")
fecha_respuesta <- html_text(fecha_respuesta)

#Levanto solo las respuestas a reseñas
respuesta_entera <- html_nodes(pagina_gplay, ".LVQB0b")
respuesta_entera <- html_text(respuesta_entera)

#Levanto todo el 'muro' de emisores, reseñas y rtas
sabana_reviews <- html_nodes(pagina_gplay, ".bAhLNe")
sabana_reviews <- html_text(sabana_reviews)
sabana_reviews <- sabana_reviews[str_detect(sabana_reviews, "")] 