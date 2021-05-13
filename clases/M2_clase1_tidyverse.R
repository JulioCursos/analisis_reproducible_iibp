############-----------MODULO 2: CLASE 1.TIDYVERSE-IMPORTAR DATOS----------############
# CONTENIDO: 
# 1.1. Tidiverse. Paquetes que incluye
# 1.2. Tibbles
# 1.3. Importacion de datos

#### 1.1. Tidiverse. Paquetes que incluye

# Tidydata. Definicion
# Una manera estandarizada de vincular la "estructura" (el disenio fisico)
# con la "semantica"(el significado) 
# Estructura: columna, filas

# Semantica: observacion, valor (numero, caracter, cadena)


# instalar

library(tidyverse)

# ggplot2,  data visualisation.
# dplyr,  data manipulation.
# tidyr,  data tidying.
# readr,  data import.
# purrr,  functional programming.
# tibble,  tibbles, a modern re-imagining of data frames.
# stringr,  strings.
# forcats, factors.

# Hablar un poco de los conflictos de algunas funciones


#### 1.2. Tibbles
# Son data.frames ajustados para funcionar mejor con los paquetes de tidiverse
# Tipos de variables de un tibble
  # int: enteros.
  # dbl: dobles, o numeros reales.
  # chr:  vectores de caracteres o cadenas.
  # dttm: fechas y horas (una fecha + una hora).
  # lgl: logico, vectores que solo contienen TRUE (verdadero) o FALSE (falso).
  # fctr: factores, que R usa para representar variables categ??ricas con valores posibles fijos.
  # date: fechas
# Transformar un data.frame a  tibble

vignette("tibble")# si uno quiere ver la documentacion mas detallada


iris_df <- iris
class(iris)
iris_tb <- as_tibble(iris)
class(iris_tb)
### tibble vs data.frame
### Diferencias

## 1. Impresion en la consola

iris # como data.frame. Imprime todo el archivo
iris_tb # como data tibble. Solo imprime los primeros 10

## Subconjuntos($, [[]])
# $ funciona casi igual que en data.frames
# [[]] Necesitamos doble llaves para selecionar columnas
# data.frame
iris$Sepal.Length
iris[,1]
iris[, "Sepal.Length"]
# tibble
iris_tb$Sepal.Length
iris_tb[[1]]
# Tidy data: # Cada columna es una variable y
             # Cada fila una observacion

# 2. Tibble siempre retorna un tibble. Data.frame puede retornar un vector o una datafr

# data.frame
iris_sub <- iris[1:4,]
class(iris_sub) # devuelve dataframe

iris_long <- iris[,1]
class(iris_long)# devuelve un vector numerico

# tibble

iris_sub_tb <- iris_tb[1:4,]
class(iris_sub_tb)

iris_long_tb <- iris_tb[,1]
class(iris_long_tb)


#### # 1.3. Importacion de datos

# Paquete "readr"
# read_csv() # archivos separados con coma
# Argumentos:
  # file: ruta y archivo
  # col_names: True si la primer fila incluye nombre de las variables 
  # col_types: para modificar las opciones por defecto

library(readr)

iris_readr <- read_csv("./datos/iris_exportado.csv") # opciones por defecto

crabs_readr <- read_csv("./datos/crabs.csv")

# opciones para cambiar los tipos de variables
iris_readr_mod <- read_csv("./datos/iris_exportado.csv", col_types = cols(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica")) # si necesitamos que estos nombres sean factores
))
# inspeccionar archivo

str(iris_readr)
glimpse(iris_readr)


# Escribir un archivo con readr
# write_csv

write_csv(iris_readr, "./datos/iris_readr_export.csv")


# Paquete readxl: Importar excel .xls y .xlsx con el 
library(readxl)
# las funciones mas usadas de este paquete
##### read_excel(): Para importar archivos .xls y xlsx.
##### excel_sheets(): Para obtener los nombres de las pesta??as en una hoja de c??lculo de Excel.


# algunos ejemplos del paquete readxl
readxl_example()
readxl_example("datasets.xlsx")

# read_excel lee .xls y .xlsx
xls_example <- readxl_example("datasets.xls") # .xls
read_excel(xls_example)

xlsx_example <- readxl_example("datasets.xlsx") # .xlsx
read_excel(xlsx_example)

# listar las hojas dentro del archivo excel

excel_sheets(xls_example)
read_excel(xls_example, sheet = "chickwts") # elige por nombre del "sheet"
read_excel(xls_example, sheet = 1) # elige por posicion

# indicar nro mas de filas 
read_excel(xlsx_example, n_max = 3)

# indicar rangos segun celdas en formato excel 
read_excel(xlsx_example, range = "A1:E4")

###############3
# crear un xlsx para el ejemplo
library(openxlsx)
l <- list(iris = iris, mtcars = mtcars, chickwts = chickwts, quakes = quakes)

openxlsx::write.xlsx(l, file = ".datos/datasets.xlsx")



# importar
# importar solo por hojas. Por defecto la primer hoja
data_excel <- read_excel("./datos/datasets.xlsx")# por defecto importa la hoja 1

mtcars_df <- read_excel("./datos/datasets.xlsx", sheet = 2)

mtcars_df <- read_excel("./datos/datasets.xlsx", sheet = "mtcars")

