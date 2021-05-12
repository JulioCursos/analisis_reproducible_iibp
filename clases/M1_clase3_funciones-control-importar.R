############-----------CLASE 3. Funciones, control, importar - exportar----------############

# CONTENIDO: 
# 3.1. Funciones
# 3.2. Estructuras de control condicionales (if, else, ifelse)
# 3.3. Estructuras de control iterativas o bucles (for, while)
# 3.4. Estructura de control clausula (break, next)  
# 3.5. Importar y exportar datos con r-base


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

#### 3.4. Estructura de control clausula (break, next)
#=========== break y next ==============
#=== break
# ejemplo 1

for (i in 1:10) {
  if(i == 3){
    break
  }
  print(i)
}

# ejemplo 2

numero <- 20
while(numero > 5){
  if(numero == 15){
    break
  }
  numero <- numero - 1
  message ("el numero es:", numero)
}
####################### Hasta aca condicionales. Ver si hace falta los 2 siguientes


#=== next

for(i in 1:4) {
  if(i == 3) {
    next
  }
  print(i)
}

#=========== repeat ==============
# estructura
repeat {
  operaciones
  
  un_break_para_detener
}
# ejemplo

valor <-  0


repeat {
  valor <- valor + 1
  if (valor == 5) {
    break
  }
}

#### 3.5. Importar y exportar datos con r-base

# bajar datos de internet

download.file(url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data", destfile = "iris.data" )

# read.table
### Argumentos
# file: la ruta del archivo en el directorio
# header: si el archivo tiene encabezados
# sep: caracter usado como separador
# col.names
# stringAsFactors: convierte los textos a factores

data <- read.table("iris.data", sep = ",")
data

# agregar encabezados
nombres <- c("LP","AP","LT","DT","specie")
data <- read.table("iris.data", sep = ",", col.names = nombres)

head(data)
## la opcion de file.choose()
# read.csv

df_cancer <- read.table(file = "breast-cancer-wisconsin.csv", header = FALSE, sep = ",")

df_cancer <- read.csv("breast-cancer-wisconsin.csv")


## Exportar

# write.table( )
# Argumentos:
## x: nombre del data.frame o matriz que se va a exportar
## file: nombre, extension o ruta del archivo que estamos creando
## sep: separador de columnas
## col.names: incluir (True) o no (False) los nombres de las columnas

write.table(data, "iris_exportado.txt", sep = "\t", row.names= FALSE, col.names = TRUE)

data_import <- read.table("iris_exportado.txt", sep = "\t", header = T)


# write.csv()
# mismos argumentos que write.table

write.table(data, "iris_exportado.csv", sep = ",", row.names= FALSE, col.names = TRUE)

