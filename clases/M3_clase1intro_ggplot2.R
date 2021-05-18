############-----------MODULO 3: CLASE 1. INTRO A GGPLOT----------############
library(tidyverse)
library(ggplot2)
#CONTENIDO:
# ggplot se basa en la "gramatica de los graficos". Una idea que plantea que cualquier grafico
# se puede generar combinando tres componentes: datos, un sistema de coordenadas y geoms
###3.1. Intro ggplot2. Estructura
# 3.1.1 datos:siempre una tabla. Ojo! ggplot solo acepta tablas, nunca vectores!
# 3.1.2 esteticas: variables (x, y) y otros elementos (colores, forma, grosor) que se van a graficar
# 3.1.3 capas o geometrias: lineas, puntos, rectas, histogramas, etc
# 3.1.4 facetas: subdivisiones y graficos multiples
# 3.1.5. etiquetas y titulos
# 3.1.6. temas

## 3.1.1 datos. 

# Siempre una tabla! ggplot no admite vectores

p <- ggplot(data = iris)



## 3.1.2 esteticas
# Son las variables que se van a graficar. Ademas colores, forma, tamanios etc

p <- p + aes(x = Petal.Length, y = Petal.Width, colour = Species)

# lo mismo en una sola expresion
p <- ggplot(iris_tb, aes(x = Petal.Length, y = Petal.Width, colour = Species))

p
# COMENTARIO: p no es un gr??fico todav??a. Le faltan capas


# Otras esteticas
# colour: para el color
# size: tamanio
# shape: forma
# alpha: transparencia
# fill: color de relleno para formas solidas

# 3.1.3 capas o geometrias (geoms)
# Son los "verbos" que dicen que hacer con los datos y las esteticas

p <- p + geom_point()
p
# en una linea
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) +
  geom_point()

# COMENTARIO: alternativamente, las esteticas tambien se pueden indicar dentro de los "geoms"
ggplot(data = iris) + 
  geom_point(aes(x = Petal.Length, y = Petal.Width, color = Species)) 



# se pueden agregar otras capas

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) + 
  geom_point() +
  geom_smooth() # intervalo de confianza
  
#

## 3.1.4 facetas: subdivisiones y graficos multiples

ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point() + geom_smooth() + 
  facet_grid(~ Species)

ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point() + geom_smooth() + 
  facet_wrap(~ Species, nrow = 2)

# Mostrar diferencias entre facet_grid y facet_wrap


# 3.1.5. Etiquetas y titulos

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
  geom_point() + 
  ggtitle("Petal length and width") + 
  labs(x = "Petal length", 
       y = "Petal width", 
       colour = "Species")
  


# 3.1.6. Temas
#  aspectos esteticos que no tienen que ver con los datos

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
  geom_point() + 
  ggtitle("Petal length and width") + 
  labs(x = "Petal length", 
       y = "Petal width", 
       colour = "Species") +
  theme_bw()

#
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
  geom_point() + 
  ggtitle("Petal length and width") + 
  labs(x = "Petal length", 
       y = "Petal width", 
       colour = "Species") +
  theme_bw() +
  theme(
    panel.background = element_rect(fill = "lightblue"),
    panel.grid.minor = element_line(linetype = "dotted")
  )
  
## Ejercicios con geom_boxplot()

ggplot(data= iris) +
  geom_boxplot(aes(x= Species, y= Sepal.Length, fill= Species))+
  theme_bw()
         
# otros datasets

library(datos)
data(package= "datos")
diamantes
names(diamantes)
glimpse(diamantes)

ggplot(diamantes) +
  geom_point(aes(x= quilate, y= precio, color= corte))+
  geom_smooth(aes(x= quilate, y= precio))
