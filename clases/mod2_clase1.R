############-----------MODULO 2: CLASE 1.TIDYVERSE----------############
# CONTENIDO: 
# 1.1. Tidiverse. Paquetes que incluye
# 1.2. Tibbles
# 1.3. Importacion de datos

#### 1.2. Tibbles
# Son data.frames ajustados para funcionar mejor con los paquetes de tidiverse
# Tipos de variables de un tibble
  # int: enteros.
  # dbl: dobles, o n??meros reales.
  # chr:  vectores de caracteres o cadenas.
  # dttm: fechas y horas (una fecha + una hora).
  # lgl: l??gico, vectores que solo contienen TRUE (verdadero) o FALSE (falso).
  # fctr: factores, que R usa para representar variables categ??ricas con valores posibles fijos.
  # date: fechas
# Transformar un data.frame a  tibble

data("iris")
class(iris)

iris_tb <- as_tibble(iris)
### tibble vs data.frame
## Impresion en la consola

iris # como data.frame
iris_tb # como data tibble

## Subconjuntos($, [[]])
# $ funciona igual que en data.frames
# [[]] Necesitamos doble llaves para selecionar columnas
# data.frame
iris$Sepal.Length
iris[,1]
iris[, "Sepal.Length"]
# tibble
iris_tb$Sepal.Length
iris_tb[[1]]
# Tidy data:Cada columna es una variable y cada fila una observacion

# Fechas
# strings

#### # 1.3. Importacion de datos

# Paquete "readr"
# read_csv() # archivos separados con coma
# Argumentos:
  # file: ruta y archivo
  # col_names: True si la primer fila incluye nombre de las variables 
  # col_types: para modificar ls opciones por defecto
library(readr)
iris_readr <- read_csv("iris_exportado.csv") # opciones por defecto

# opciones para cambiar los tipos de variables
iris_readr_otro_ejemplo <- read_csv("iris_exportado.csv", col_types = cols(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

# Escribir un archivo con readr
# write_csv
# Paquete readxl: Importar excel .xls y .xlsx con el 
library(readxl)
# algunos ejemplos del paquete readxl
readxl_example()
readxl_example("clippy.xls")

# read_excel lee .xls y .xlsx
xlsx_example <- readxl_example("datasets.xlsx")

read_excel(xlsx_example)

xls_example <- readxl_example("datasets.xls")
read_excel(xls_example)

# listar las hojas dentro del archivo excel

excel_sheets(xlsx_example)
read_excel(xls_example, sheet = "chickwts") # elige por nombre del "sheet"
read_excel(xls_example, sheet = 1) # elige por posicion

# indicar nro mas de filas 
read_excel(xlsx_example, n_max = 3)

# indicar rangos segun celdas en formato excel 
read_excel(xlsx_example, range = "A1:E4")

