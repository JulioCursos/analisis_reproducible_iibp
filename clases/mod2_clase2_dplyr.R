############-----------MODULO 2: CLASE 2. Manipulacion de datos usando dplyr----------############
#CONTENIDO:
# 2.1. Gramatica de dplyr.
# 2.2. Estructura de las funciones de dplyr
# 2.3. Select
# 2.4. Filter
# 2.5. Operadores logicos y booleanos
# 2.6.  Pipes
# 2.7. arrange()
# 2.8. mutate()
# 2.9. Agrupar  con summarize(); group_by(); count()

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

#### 2.6. Pipes


#### 2.7. arrange()
 # ejemplos de de https://es.r4ds.hadley.nz/transform.html


#### 2.8. mutate()
# ejemplos de de https://es.r4ds.hadley.nz/transform.html

#### 2.9. Agrupar  con summarize(); group_by(); count()

# ejemplos de de https://es.r4ds.hadley.nz/transform.html
