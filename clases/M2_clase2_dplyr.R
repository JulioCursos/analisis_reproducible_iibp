############-----------MODULO 2: CLASE 2. Manipulacion de datos usando dplyr----------############
#CONTENIDO:
# 2.1. Gramatica de dplyr.
# 2.2. Estructura de las funciones de dplyr
# 2.3. Select
# 2.4. Filter
# 2.5. Operadores logicos y booleanos
# 2.6. arrange() 
# 2.7. rename()
# 2.8. mutate()
# 2.9. Agrupar  con summarize(); group_by(); count() 
# 2.10. Pipes %>%
#### 2.1. Gramatica de dplyr.
select() # seleccionar columnas
filter() # seleccionar filas
%>% # operador pipe para unir operaciones
        mutate() # crear nuevas variables
summarize(); group_by(); count() # opciones para agrupar
join_left(); join_right() # unir tablas basado en una variable en comun
arrange() # ordenar una columna
rename() # renombrar encabezados de columnas


#### 2.2. Estructura de las funciones de dplyr
# 1. data: data.frame
# 2. variables: columnas sin usar $ o []
# 3. el resultado es un tidy


# 2.2. Estructura de las funciones de dplyr
# 1. data: data.frame
# 2. variables: columnas sin usar $ o []
# 3. el resultado es un tidy

#### 2.3. Select: funcion para extraer subconjuntos de columnas
# Cargar librerias
# install.packages("tidyverse") 
library(tidyverse)
# cargar datos

download.file("http://bit.ly/MS_trafficstops_bw_age",
              "datos/MS_trafficstops_bw_age.csv")

stops <- read_csv("datos/MS_trafficstops_bw_age.csv")
names(stops)
# algunos operaciones con select()
select(stops, id, police_department, officer_id, driver_age)# selecciono por nombres
select(stops, - (id)) # todos excepto la variable id
# comparacion con r base

select(stops, -(id:stop_date)) # con dplyr

i <- match("id", names(stops))
j <- match("stop_date", names(stops))

head(stops[, -(i:j)]) # con r-base
# algunas funciones especiales que funcionan dentro de select()
# starts_with(), ends_with(), contains()

select(stops, starts_with("driver"))

select(stops, contains("id"))

#### # 2.4. Filter: funcion para extraer subconjuntos de filas

filter(stops, driver_gender == "female") # filtar solo mujeres

filter(stops, driver_age > 50)


#### 2.5. Operadores logicos y booleanos 
## < (menor a)
## > (mayor a)
## & (y)
## | (o)
## ! (no)
## == (es igual a)
## != (es distinto de)

filter(stops, driver_age > 50 & driver_gender == "female")

# Filtrar conductores hombres negros, mayores de 30, que cometieron la infraccion de no usar cinturon

filter(stops, driver_gender == "male") # hombres 
filter(stops, driver_race == "Black") # negros
filter(stops, driver_age > 30) # mayores de 30
# hombres negros mayores de 30
b_male_30 <- filter(stops, driver_gender == "male" & driver_race == "Black" & driver_age > 30)

output <- filter(b_male_30, violation == "Seat belt" )
head(output)

# Ver mas ejemplos y ejercicios con el paquete (datos)
library(datos)
vuelos # dataset dentro de datos
# ejercio 1. Vuelos que partieron en noviembre y diciembre
filter(vuelos, mes == 11 | mes == 12)
filter(vuelos, mes %in% c(11, 12))

# ejercicio 2. Vuelos que no se retrasaron (llegada y partida) mas de 2 horas.

filter(vuelos, !(atraso_salida > 120 | atraso_llegada > 120))


# Algunos ejercicios de https://es.r4ds.hadley.nz/transform.html
  # 1. Tuvieron un retraso de llegada de dos o m??s horas
  # 2. Volaron a Houston (IAH oHOU)
  # 3. Fueron operados por United, American o Delta
  # 4. Partieron en invierno del hemisferio sur (julio, agosto y septiembre)


#### 2.6. arrange(). Reordenar filas
 # ejemplos de de https://es.r4ds.hadley.nz/transform.html

arrange(vuelos, anio, mes, dia) 
arrange(vuelos, desc(mes)) # desc( ) para ordenar una columna en orden descendente.

#### 2.7. rename ( ). renombrar las variables 
# COMENTARIO: con select( ) tambien se puede renombrar, pero en ese caso elimina las variables no selecionadas

vuelos_renamed <- rename(vuelos, h_sal = horario_salida, s_p = salida_programada, a_s = atraso_salida)
names(vuelos)
names(vuelos_renamed)

#### 2.8. mutate()

vuelos_duracion <- mutate(vuelos, duracion_vuelo = horario_llegada - horario_salida)

# otro ejemplo con mutate
vuelos_sml <- select(vuelos, 
                     anio:dia, 
                     starts_with("atraso"),
                     distancia, 
                     tiempo_vuelo)

vuelos_sml <- mutate(vuelos_sml,
       ganancia = atraso_salida - atraso_llegada,
       velocidad = distancia / tiempo_vuelo * 60)

#COIENTARIO: usar transmutate( ) si solo queres conservar las nuevas variables

#### 2.8. Agrupar  con summarize(); group_by(); count()

vuelos_mes <- group_by(vuelos, mes)

summarise(vuelos_mes, atraso_mensual_promedio = mean(atraso_salida, na.rm= TRUE) )

# COMENTARIO: Explicar con ejemplos los NA

#### 2.9. Pipes %>% 

vuelos %>% group_by(mes) %>% 
  summarise(atraso_mensual_promedio = mean(atraso_salida, na.rm= TRUE) )


# otro ejemplo con pipe
# Imagina que queremos explorar la relaci??n entre la distancia y 
# el atraso promedio para cada ubicacion
por_destino <- group_by(vuelos, destino)
atraso <- summarise(por_destino,
                    conteo = n(),
                    distancia = mean(distancia, na.rm = TRUE),
                    atraso = mean(atraso_llegada, na.rm = TRUE)
)
atraso <- filter(atraso, conteo > 20, destino != "HNL")
# tres pasos para el ejemplo anterior
# 1. Agrupar vuelos por destino
# 2. Resumir para calcular la distancia, la demora promedio y el n??mero de vuelos en cada grupo.
# 3. Filtrar para eliminar puntos ruidosos y el aeropuerto de Honolulu


atrasos <- vuelos %>% 
  group_by(destino) %>% 
  summarise(
    conteo = n(),
    distancia = mean(distancia, na.rm = TRUE),
    atraso = mean(atraso_llegada, na.rm = TRUE)
  ) %>% 
  filter(conteo > 20, destino != "HNL")
