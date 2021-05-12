############-----------CLASE 3. Funciones, control, importar - exportar----------############

# CONTENIDO: 
# 3.1. Funciones
# 3.2. Estructuras de control condicionales (if, else, ifelse)
# 3.3. Estructuras de control iterativas o bucles (for, while)
# 3.4. Importar y exportar datos con r-base


#### 3.1. Funciones . Una introduccion basica
# estructura
nombre <- function(argumentos){
  cuerpo
}
## nombre: nombre de la funcion que nos permite ejecularla
## argumentos: variables de la funcion para realizar operaciones
## cuerpo: contiene todas las operaciones que se van a ejecutar

# crear una funcion simple
## area de un cuadrado

area_cuad <- function(lado1, lado2){
  lado1*lado2
}


# Estructura de control
#### 3.2. Estructuras de control condicionales (if, else, ifelse)
#=========== condicional if =========
# estructura

if (Condicion) {
  operaciones_si_es_TRUE
}

# ejemplo aplicado en if
# si se cumple la condicion se muestra "verdadero"
if (4 > 3){
  print("verdadero")
}

# si no se cumple, no pasa nada

if (4 < 3){
  print("verdadero")
}
# otro ejemplo
x <- -4

if (x < 0) {
  print("x es negativo") # si es TRUE
  
}
x <- 4 # Si es FALSE no pasa nada

#=========== condicional if con un else =========
## estructura
if (condicion) {
  operaciones_si_la_condicion_es_TRUE
} else {
  operaciones_si_la_condicion_es_FALSE
}
## ejemplo con if mas else
# Se cumple la condicion y se muestra "Verdadero"
if (4 > 3) {
  "Verdadero"
} else {
  "Falso"
}

# No se cumple la condicion y muestra "falso"
if (4 < 3) {
  "Verdadero"
} else {
  "Falso"
}
# otro ejemplo 
x <- -4

if (x < 0) {
  print("x es negativo") 
} else{
  print(" x es positivo o cero")
}
x <- 4 # probar con positivo
x <- 0 # probar con cero



#=========== condicional ifelse =========
## permite vectorizar if, else
## sintanxis
ifelse(vector, valor_si_TRUE, valor_si_FALSE)

# ejemplo
#
if (1:10 < 3){
  print("verdadero")
}
#
ifelse (1:10 < 3, "verdadero", "falso")


#### 3.3. Estructuras de control iterativas o bucles (for, while)
#=========== for ==============
# estructura
for (elemento in objeto) {
  operacion_con_elemento
}
# para cada elemento del objeto realiza la siguiente operacion

dado <- 1:6
for (cara in dado){
  cara + 1
} # Para devolver los resultados R necesita agregar print( ). En otros lenguajes 
# se utiliza return()

# calcular el cuadrado de cada cara
dado <- 1:6
for (cara in dado){
  print (cara ^2)
}


# asignar los resultados a un objeto

vector <- numeric() # o NULL

for (cara in dado) {
  vector[cara] <- cara ^ 2
}

vector

# otro ejemplo
# calcular el cuadrado de cada numero del 1 al 10
for (i in 1:10) {
  x2 <- i^2
  print(x2)
}



#=========== while ==============
# estructura
while (condicion) {
  operaciones
}
# mientras la condicion sea verdadera realiza la operacion

tope <- 5
valor <- 0
while (valor < tope){
  print("No llega al tope")
  valor <- valor + 1
}

# ejemplo 1
i <- 0
while (i < 10 ) {
  print("i es menor a 10")
  i <- i + 1
}
# ejemplo 2

condicion <- 0
while (condicion < 10) {
  condicion <- condicion + 1
  print("condicion es menor a 10")
}



#### 3.4. Importar y exportar datos con r-base


# exportar el dataset crabs y iris para usarlo como ejemplo
library(MASS)
crabs_df <- crabs

write.csv(crabs_df, "./datos/crabs.csv", row.names = FALSE)# row.names false para que no 
                                                           # genere una columna vacia en la tabla

iris_df <- iris

write.csv(iris_df, "./datos/iris_clase3.csv", row.names= FALSE)

# read.table
### Argumentos
# file: la ruta del archivo en el directorio
# header: si el archivo tiene encabezados
# sep: caracter usado como separador
# col.names
# stringAsFactors: convierte los textos a factores

iris_data <- read.table("./datos/iris.data", sep = ",")
iris_data

# agregar encabezados
nombres <- c("LP","AP","LT","DT","specie")
iris_data <- read.table("./datos/iris.data", sep = ",", col.names = nombres)

head(iris_data)
## la opcion de file.choose()
# read.csv



iris_csv <- read.table(file = "./datos/iris_clase3.csv", header = TRUE, sep = ",")




## Exportar

# write.table( )
# Argumentos:
## x: nombre del data.frame o matriz que se va a exportar
## file: nombre, extension o ruta del archivo que estamos creando
## sep: separador de columnas
## col.names: incluir (True) o no (False) los nombres de las columnas

write.table(iris_data, "./datos/iris_exportado.txt", sep = "\t", row.names= FALSE, col.names = TRUE)


data_import <- read.table("./datos/iris_exportado.txt", sep = "\t", header = T)


# write.csv()
# mismos argumentos que write.table

write.csv(iris_csv, "./datos/iris_exportado.csv", sep = "," , row.names= FALSE, col.names = TRUE)

# Warning messages:
#  1: In write.csv(iris_csv, "iris_exportado.csv", sep = ",", row.names = FALSE,  :
#                    attempt to set 'col.names' ignored

# COMENTARIOS: exporta sin problemas, pero da un warning por write.csv es
# menos flexible que write.table. Entonces, mejor no poner TRUE en col.names

write.csv(iris_csv, "./datos/iris_exportado.csv", row.names= FALSE) # para que no aparezca el warning
                                                                    # no tocar "sep" ni "col.names"

