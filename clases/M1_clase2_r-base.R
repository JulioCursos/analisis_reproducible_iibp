
############-----------CLASE 2. R-BASE----------############

# CONTENIDO: 
# 2.1. Directorio de trabajo/ Espacio de trabajo
# 2.2. R como calculadora
# 2.3. Objetos 
# 2.4. Estilos para comentar, nombrar archivos, objetos
# 2.5. Tipos de datos (numericos, caracter, factor, logico), 
 
# 2.6.Estructura de datos (vectores, matrices, data frames, listas y arrays) 
# 2.7. indices, filtros, seleccionar
 

#### 2.1. Directorio de trabajo / Espacio de trabajo
getwd() # Ver el directorio de trabajo o en ingles "working directory"

setwd() # Establecer el directorio de trabajo
setwd("..") # sube al directorio que contiene el actual
setwd("c:/users/yo/proyecto") # ruta absoluta windows
setwd("home/yo/proyecto")
dir() # contenido del actual directorio de trabajo
list.files()
## volveremos a repasar cuando importemos datos

# 2.2. R como calculadora (En consola)
# operaciones arimeticas
2 + 2
4 - 2
12 * 3
24 / 3
3^2
sqrt(25)

2*3 + 4
2*(3+4)

#### 2.3. Objetos. R es un lenguaje orientado a objetos. Es decir, variables
# datos, funciones, resultados se guardan en la memoria activa de la compu en forma
# de "objetos" con un nombre especifico.

x = 2
y <- 4

x + y # se pueden hacer operaciones con los objetos
2 * y
a <- "mi nombre"
b <- "A"


# Instrucciones de asignacion

nombre_objeto <- valor

# agrupar expresiones
# punto y coma
x<- 2; y= 4; z= 6
# parentesis
(x <- 3)
    #equivalente a
x <- 3
x
# llaves
{
  x <- 3
  y <- 2
  x + y
}
#### 2.4. Estilos para comentar, nombrar archivos, objetos

NombreObjeto # Joroba de camello
nombre.objeto # Punto entre palabras
nombre_objeto # guion bajo
              # No usar acentos
              # No dejar espacios en blanco

# Mostrar ejemplo de Mayuscula-minuscula


#### 2.5. Tipos de datos

# Numerico (numeric). Con parte decimal o fracionaria
mi_altura_cm <- 170
mi_peso_kg <- 77.5


# Entero (integer). Sin una parte decimal o fraccionaria
## para especificar que es un entero hay que agregar una L
mi_edad <- 34L
class(mi_edad)

# Tambien llamados "double" o "float". Pero para fines practicos aca son todos numericos 


# Cadena de caracteres (character, string)
mi_nombre <- "Julio" # siempre con comillas dobles o simples
class(mi_nombre)
nombre <- 'Julio'
class(nombre)

# Variables categoricas o factores (factor)
sexos <- c("M", "H","H", "M", "H") 
class(sexos)
sexo_fac <- factor(sexos)# convertimos el vector a factorial
class(sexo_fac)
levels(sexo_fac) # vemos las categorias
levels(sexos)
# logicos. Valores booleanos
  ## < (menor a)
  ## > (mayor a)
  ## & (y)
  ## | (o)
  ## ! (no)
  ## == (es igual a)
  ## != (es distinto de)

a <- 2
b <- 4

a == b # a es igual a b?
a > b # a es mayor a b?
a != b # a es distinto de b?
(a < 3) & (b < 5)  # a es a menor que 3 y b menor que 3?
(a < 1) | (b < 3)  # a es a menor que 1 o b menor que 3?

#### 2.5. Estructura de datos (vectores, matrices, data frames, listas y arrays), 
# Vectores
## Propiedades
# Tipo: numeric, character, logical
# Dimension: 1,la longitud
# atributos: metadatos

## vector numerico
c(1,2,3,4,5,6,7,8,9,10)
1:10 # secuencia
seq(10)# mismo que el anterior
rep(1, 10)# funcion repetir

# vector character
c("A", "B", "C", "D", "E")
c("perro", "gato", "gallina", "perro")

# vector logico
c(FALSE, TRUE, FALSE, FALSE, FALSE, TRUE)

# vector heterogeneo
c(2,"A", "B", TRUE, 3, 5, "Z")
## vectorizacion de operaciones
mi_vector <- c(1, 2, 3, 4, 5, 6)
mi_vector * 2 ; mi_vector + 2 # operadores aritmeticos

mi_vector < 4 # operador logico

mi_vector_nuevo <- c(mi_vector, "A", FALSE) # agregar un elemeno a un vector

class(mi_vector) # lo reconoce como character por que el tipo de datos mas flexible

# Funciones para inspeccionar datos
class()
is.vector()
length()
unique()
levels() # solo para factores

# Matrices. Vector de 2 dimensiones
## Solo puede contener un tipo de datos
# Argumentos funcion matrix()
  #data es el vector que contiene los elementos que formaran parte de la matriz.
  #nrow es el numero de filas.
  #ncol es el numero de columnas.
  #byrow es un valor logico. Si es TRUE el vector que pasamos ser?? ordenado por filas.
  #dimnames nombres asignado a filas y columnas.

# crear una matriz con la funcion matrix
1:12
matrix(1:12)
matrix(data= 1:12, nrow = 3, ncol = 4)

matrix(data= 1:12, nrow = 4, ncol = 3)
# Arrays. La extension de un vector a mas de 2 dimensiones
# No se va a tratar en este curso

# funciones para inspeccionar una matriz

class()
dim()

# crear una matriz con cbind() o rbind
   # cbind() para unir vectores, usando cada uno como una columna.
   # rbind() para unir vectores, usando cada uno como un renglón.

vector_1 <- 1:4
vector_2 <- 5:8
vector_3 <- 9:12
vector_4 <- 13:16

matriz_cbind <- cbind( vector_1, vector_2, vector_3, vector_4)

matriz_rbind <- rbind(vector_1, vector_2, vector_3, vector_4)

# Dataframes. Estructura en 2 dimensiones rectangulares.
## Puede contener datos de diferentes tipos

mi_df <- data.frame(
    "entero"= 1:5,
    "factor"= c("a","b","c", "d","e"),
    "numero"= c(2.3, 22, 23, 6.4, 5),
    "cadena"= as.character(c("a","b","c", "d","e"))
    )
mi_df

# funciones para inspeccionar un data frame
class()
dim()
ncol()
nrow()
length() # da el nro de columnas
names() # nombres de las variables

# Listas. Contiene objetos de cualquier clase(numero, caracteres, matrices, funciones, etc) 
# una sola dimension, solo tiene largo
mi_lista <- list(1:9, "Pepe", pi, matrix(1:12, nrow = 4, ncol = 3))
mi_lista

#funciones para inspeccionar una lista
class(lista)
length(lista)
dim(lista)
str(lista)


#### 2.6. indices, filtros, seleccionar
##indexacion: identificacion de los elementos de objeto por medio de numero
# vector
x <-  c(3, 5, 9, 13, "A", F, "C")
length(x)
x[1]
x[3:7]
# lista
lista <- list("A", c(2,4,5,4), matrix(1:12, ncol = 3, nrow = 4), FALSE)
length(lista)

lista[[1]]
lista[[4]]
# data.frame
library(MASS)

## inspeccionar primero
crabs

class(crabs)
dim(crabs)
nrow(crabs)
ncol(crabs)
str(crabs)

head(crabs)# primeras 6 filas
tail(crabs)# ultimas 6 filas
colnames(crabs)# nombre de las columnas 

# seleccionar
## [] o $
# data[x,y] # x filas
            # y, columnas

crabs[,2] # seleciono columna 2
crabs[,"sex"] # lo mismo pero por el nombre
crabs$sex #columna 2 

crabs[1,] # selecciono fila 1
crabs[4,5] # elemento de la fila 4 columna 5

crabs[1:10, c("FL","CW")] # filas 1 al 10, variables "FL y "CW"


## Filtrar con algunos operadores logicos

# Solo los cangrejos azules, todas las columnas
crabs$sp == "B" # operacion logica
crabs[crabs$sp == "B",] # aplicado a un subconjunto

# Solo los cangrejos azules, columnas "RW", "FL"
crabs[crabs$sp == "B", c("RW", "FL")]

# cangrejos naranjas machos, todas las columnas
crabs$sp == "O" & crabs$sex == "M"# operacion logica
crabs[crabs$sp == "O" & crabs$sex == "M",]# aplicado a un filtro

# cangrejos lobulo frontal mayor a 10mm 
crabs$FL > 10 # operacion logica
crabs[crabs$FL > 10,]# operacion aplicada a un filtro

# Ejercicio
# Seleccione las hembras de la variedad Azul con CL entre 35 y 40 mm
crabs$sp == "B" # sp azul 
crabs$sex == "F"# sexo hembra

crabs$sex == "F" & crabs$sp == "B" # hembras de la variedad azul

crabs$CL >= 35 & crabs$CL <=40 # CL entre 35 y 40

crabs[(crabs$sex == "F" & crabs$sp == "B" & crabs$CL >= 35 & crabs$CL), ] # expresion completa


# o en dos pasos
#Paso 1. hembras de variedad azul
azul_hembra <- crabs[crabs$sex == "F" & crabs$sp == "B",]
# Paso 2. con el rango CL entre 35 y 40
azul_hembra[(azul_hembra$CL <=40 & azul_hembra$CL >= 35),]
