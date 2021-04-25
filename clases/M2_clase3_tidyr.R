  ############-----------MODULO 2: CLASE 3. UNIONES- FORMATO TABLAS CON  TIDYR----------############
#CONTENIDO:
# 3.1. Uniones de 2 tablas
# 3.2. Cambio de formato de  tablas con tidyr 
library(tidyverse)
#### 3.1. Uniones de 2 tablas  
## tipos de uniones (join)
# left_join(x, y): incluye todas las observaciones de x coincidad o no con x
# right_join(x, y): incluye todas las observaciones de y. Equivalente left_join(y,x)
# inner_join(x,y): solo incluye las observaciones que coincidan en x e y.
# full_join(x,y): incluye todas las observaciones de x e y.
  

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

# primer paso. Contar las paradas por condado
stops %>% 
  count(county_name, name = "n_stops")
#
stops %>% 
  count(county_name, name = "n_stops") %>% 
  left_join(acs, by= c("county_name" = "County"))



#### 3.2. Cambiar formatos de tablas con tidyr
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

violations <- stops %>% # Lo mismo que el anterior
  group_by(county_name) %>% 
  count(violation)

violations_wide <- violations %>% 
  pivot_wider(names_from = violation, 
              values_from = n)


# pivot_longer( )
## argumentos
# datos
# cols: columnas que se van a cambiar al formato largo
# names_to: nombre de las variables
# values_to: nombre de la variable donde iran los valores
violation_long <- violations_wide %>% 
  pivot_longer(cols = - county_name,
               names_to = "violation", 
               values_to = "n"
)

vignette("pivot") # para mas ejemplos mas completos sobre cambios de formatos



# Ejemplos con datos de covid-19


df_world <- read.csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv", stringsAsFactors = FALSE)

# casos en paraguay
df_paraguay <- df_world %>% filter(country== "Paraguay") %>% 
  group_by(country, type) %>% 
  summarise(total= sum(cases)) %>% 
  pivot_wider(
    names_from = type,
    values_from = total)