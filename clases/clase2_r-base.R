
############-----------CLASE 2. R-BASE----------############

# CONTENIDO: 
# 2.1. Directorio de trabajo
# 2.2. R como calculadora
# 2.3. Objetos 
# 2.4. Tipos de datos (numericos, caracter, factor, l??gico),
# 2.5. Estructura de datos (vectores, matrices, data frames, listas y arrays), 
# 2.6  Funciones.
 

#### 2.1. Directorio de trabajo 
getwd() # Ver el directorio de trabajo o en ingles "working directory"

setwd() # Establecer el directorio de trabajo
setwd("..") # sube al directorio que contiene el actual
setwd("c:/users/yo/proyecto") # ruta absoluta windows
setwd("home/yo/proyecto")
dir() # contenido del actual directorio de trabajo
## volveremos a repasar cuando importemos datos

# 2.2. R como calculadora
# operaciones arimeticas
2 + 2
4 - 2
12* 3
24 / 3
3^2
sqrt(25)

2*3 + 4
2*(3+4)

#### 2.2. Objetos. R es un lenguaje orientado a objetos. Es decir, variables
# datos, funciones, resultados se guardan en la memoria activa de la compu en forma
# de "objetos" con un nombre especifico.

x = 2
x <- 4
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

#### 2.3. Tipos de datos

# Numerico (numeric). Con parte decimal o fracionaria
mi_altura_cm <- 170
mi_peso_kg <- 77.5


# Entero (integer). Sin una parte decimal o fraccionaria
## para especificar que es un entero hay que agrear una L
mi_edad <- 34L
class(mi_edad)

# Tambien llamados "double" o "float". Pero para fines practicos aca son todos numericos 


# Cadena de texto (character, string)
mi_nombre <- "Julio" # siempre con comillas dobles o simples
class(mi_nombre)
nombre <- 'Julio'
class(nombre)

# Variables categoricas o factores (factor)
sexos <- c("M", "H","H", "M", "H") 
sexo_fac <- factor(sexos)# convertimos el vector a factorial
levels(sexo_fac) # vemos las categorias

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

a == b # ??a es igual a b?
a > b # ??a es amyor a b?
a != b # ?? es distinto de b?
(a < 3) & (b < 5)  # ??es a menor que 3 y b menor que 3?
(a < 1) | (b < 3)  # ??es a menor que 1 o b menor que 3?

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

# vector logico
 c(F, T, F, F, F, TRUE)

# vector heterogeneo
c(2,"A", "B", TRUE, 3, 5, "Z")
## vectorizacion de operaciones
mi_vector <- c(1, 2, 3, 4, 5, 6)
mi_vector * 2
mi_vector + 2

# Matrices. Vector de 2 dimensiones
# Argumentos funcion matrix()
  #data es el vector que contiene los elementos que formaran parte de la matriz.
  #nrow es el n??mero de filas.
  #ncol es el n??mero de columnas.
  #byrow es un valor l??gico. Si es TRUE el vector que pasamos ser?? ordenado por filas.
  #dimnames nombres asignado a filas y columnas.

1:12
matrix(1:12)
matrix(data= 1:12, nrow = 3, ncol = 4)

matrix(data= 1:12, nrow = 4, ncol = 3)
# Arrays. La extension de un vector a mas de 2 dimensiones
# No se va a tratar en este curso

# Dataframes. Estructura en 2 dimensiones rectangulares.
## Puede contener datos de diferentes tipos

mi_df <- data.frame(
    "entero"= 1:5,
    "factor"= c("a","b","c", "d","e"),
    "numero"= c(2.3, 22, 23, 6.4, 5),
    "cadena"= as.character(c("a","b","c", "d","e"))
    )
mi_df

# Listas. Contiene objetos de cualquier clase(numero, caracteres, matrices, funciones, etc) 
# una sola dimension, solo tiene largo
lista <- list(1:9, "Pepe", pi, matrix(1:12, nrow = 4, ncol = 3))
lista
length(lista)
dim(lista)


