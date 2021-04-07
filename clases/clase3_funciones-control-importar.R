# Funciones. Una introduccion basica

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
## condicionales
#=========== condicional if =========
# sintaxis

if(Condicion) {
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

#=========== condicional if con un else =========
## sintaxis
if(condici??n) {
  operaciones_si_la_condici??n_es_TRUE
} else {
  operaciones_si_la_condici??n_es_FALSE
}
## ejemplo con if mas else
# Se cumple la condicion y se muestra "Verdadero"
if(4 > 3) {
  "Verdadero"
} else {
  "Falso"
}

# No se cumple la condicion y muestra "falso"
if(4 < 3) {
  "Verdadero"
} else {
  "Falso"
}

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
ifelse(1:10 < 3, "verdadero", "falso")


## iterativas o bucles(for, while)
#=========== for ==============
# sintaxis
for(elemento in objeto) {
  operacion_con_elemento
}
# para cada elemento del objeto realiza la siguiente operacion

dado <- 1:6
for (cara in dado){
  dado + 1
} # Para devolver los resultados R necesita agregar print( ). En otros lenguajes 
# se utiliza return()


dado <- 1:6
for (cara in dado){
  print(cara ^2)
}


# asignar los resultados a un objeto

vector <- NULL

for(cara in dado) {
  vector[cara] <- cara ^ 2
}

vector


#=========== while ==============
#sintaxis
while(condicion) {
  operaciones
}
# mientras la condicion sea verdadera realiza la operacion

tope <- 5
valor <- 0
while(valor < tope){
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

#=== next

for(i in 1:4) {
  if(i == 3) {
    next
  }
  print(i)
}

#=========== repeat ==============
# sintaxis
repeat {
  operaciones
  
  un_break_para_detener
}
# ejemplo

valor <-  0

repeat{
  valor <- valor + 1
  if(valor == 5) {
    break
  }
}
