  ############-----------MODULO 2: CLASE 3. UNIONES- FORMATO TABLAS CON  TIDYR----------############
#CONTENIDO:
# 3.1. Uniones de 2 tablas
# 3.2. Cambio de formato de  tablas con tidyr 
library(tidyverse)
#### 3.1. Uniones de 2 tablas  
## tipos de uniones (join)
# left_join(x, y): incluye todas las observaciones de x coincida o no con x
# right_join(x, y): incluye todas las observaciones de y. Equivalente left_join(y,x)
# inner_join(x,y): solo incluye las observaciones que coincidan en x e y.
# full_join(x,y): incluye todas las observaciones de x e y.

a <- tibble(
  x1= c("A", "B", "C"),
  x2= 1:3)
b <- tibble(
  x1= c("A", "B", "D"),
  x3 = c(T,F,T))
print(a)
print(b)
# left_join()
left_join(a,b, by= "x1") # une matcheando b con a. 
                         # a queda igual y de b solo pega las coincidencias

# rigth_join()
right_join(a,b, by= "x1") # b queda igual y de a solo queda las coincidencias

# inner_join()
inner_join(a,b, by= "x1") # retiene solo las coincidencias


# full_join()
full_join(a, b, by= "x1") # retiene todo


# bajar 2 datasets
# 5 year average from the 2011-2015 American Community Survey (ACS)
# Origen de los datos https://github.com/cengel/R-data-wrangling/tree/master/data
  # dataset 1. en la carpeta datos
download.file("http://bit.ly/MS_trafficstops_bw_age",
                "datos/MS_trafficstops_bw_age.csv")

stops <- read_csv("datos/MS_trafficstops_bw_age.csv")    

  
# dataset 2. en la carpeta datos
download.file("http://bit.ly/MS_acs_2015_bw",
                "datos/MS_acs2015_bw.csv")
acs <- read_csv("datos/MS_acs2015_bw.csv")  

# acs: es una dataset de las poblaciones de condados segun grupos raciales
# inspeccionar ambos datasets
names(stops)

names(acs)


# primer paso. Contar las paradas por condado
stops %>% 
  count(county_name, name = "n_stops")
# o alternativamente
stops %>% 
  group_by(county_name) %>% 
  summarise(n_stops = n())


# segundo paso. Unir
stops %>% 
  count(county_name, name = "n_stops") %>% 
  left_join(acs, by= c("county_name" = "County"))





#### 3.2. Cambiar formatos de tablas con tidyr

# tidyr: ayuda a cambiar el formato de las tablas


## Formato "largo": 
# cada columna una variable
# cada fila una observacion

## Formato "ancho":
# cada fila es un tema

# pivot_wider( ): Formato largo a formato ancho
## argumentos (ver en help)
# data
# names_from
# values_from

violations <- stops %>% 
  count(county_name, violation)

violations

violations <- stops %>% # Lo mismo que el anterior
  group_by(county_name) %>% 
  count(violation)

violations

# Cambiar a formato ancho
violations_wide <- violations %>% 
  pivot_wider(names_from = violation, 
              values_from = n)

violations_wide




# pivot_longer( )
## argumentos
# datos
# cols: columnas que se van a cambiar al formato largo
# names_to: nombre de las variables
# values_to: nombre de la variable donde iran los valores
violation_long <- violations_wide %>% 
  pivot_longer(cols = - county_name,  # excluir columna  "county name"
               names_to = "violation", 
               values_to = "n"
)
violation_long


vignette("pivot") # para mas ejemplos mas completos sobre cambios de formatos



# Ejemplos con datos de covid-19

# dataset bajado del repositorio de Rami Krispin
# https://github.com/RamiKrispin/coronavirus
df_world <- read.csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv", stringsAsFactors = FALSE)

write.csv(df_world, "./datos/coronavirus_12_05_2021.csv", row.names = FALSE)


# casos en paraguay
# formato long
df_paraguay <- df_world %>% filter(country== "Paraguay") %>% 
  group_by(country, type) %>% 
  summarise(total= sum(cases))  
  
df_paraguay
# formato wide
df_paraguay <- df_world %>% filter(country== "Paraguay") %>% 
  group_by(country, type) %>% 
  summarise(total= sum(cases)) %>% 
  pivot_wider(
    names_from = type,
    values_from = total)
df_paraguay
