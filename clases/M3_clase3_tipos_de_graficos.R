############-----------MODULO 3: CLASE 3. GRAFICOS SEGUN TIPOS DE DATOS----------############
library(tidyverse)
library(ggplot2)

# CONTENIDO
# 3.1. Graficos de barras
# 3.3. Histogramas
# 3.4. Graficos de densidad


# 3.1. Graficos de barras
# Problema: necesito plotear variables numericas (y) para diferentes categorias (x)
# Importante: la altura puede ser el conteo de casos
            # otras veces representa valores
# dos tipos de barras: geom_bar() y geom_col()
# aes(): variable categorica para x y variable numerica para y
# Tipos de datos:# variable categorica
                 # variable categorica y numerica
data <- data.frame(
  name=c("A","B","C","D","E") ,  
  value=c(3,12,5,18,45))

ggplot(data, aes(x = name, y = value)) + 
  geom_col() # realiza un conteo de los casos

ggplot(data, aes(x = name, y = value)) + # x variable categorica, y continua 
  geom_bar(stat = "identity") # plotea proporcionalmente a los datso



# con iris

ggplot(iris, aes(x = Species, y = Petal.Length)) +
  geom_col()

ggplot(iris, aes(x = Species, y = Petal.Length)) +
  geom_bar(stat = "identity")



# con diamantes
library(datos)
data(package= "datos")

# diamantes
ggplot(diamantes, aes(x= corte))+
  geom_bar() # para ver el conteo de observacions

# 1.cambios de color
# color solido

ggplot(data, aes(x = name)) + 
  geom_bar(color= "blue", fill= "orange") # tienen la misma altura porque son el mismo nro de observacions

ggplot(diamantes, aes(x= corte))+
  geom_bar(color= "black", fill= "lightblue") 

# por categoria

ggplot(diamantes, aes(x= corte, fill= corte))+
  geom_bar() 


# paleta

ggplot(diamantes, aes(x= corte, fill= corte))+
  geom_bar() +
  scale_fill_brewer( palette = "Set1")


ggplot(iris, aes(x = Species, y = Petal.Length, fill= Species)) +
  geom_bar(stat = "identity") + 
  scale_fill_brewer(palette = "Set2")

# manualmente

ggplot(iris, aes(x = Species, y = Petal.Length, fill= Species)) +
  geom_bar(stat = "identity") + 
  scale_fill_manual(values = c("red", "green", "blue") )

# 2. cambiar a horizontal

ggplot(mtcars, aes(x=as.factor(cyl), fill=as.factor(cyl) )) +  
  geom_bar( ) +
  scale_fill_manual(values = c("red", "green", "blue")) +
  coord_flip()



# 3. controlar ancho 
ggplot(iris, aes(x = Species, y = Petal.Length, fill= Species)) +
  geom_bar(stat = "identity", width = 0.5) 

ggplot(iris, aes(x = Species, y = Petal.Length, fill= Species)) +
  geom_bar(stat = "identity", width = 1) 


### graficos de barras agrupados

library(MASS)
crabs_tb <- as.tibble(crabs)
glimpse(crabs_tb)

ggplot(crabs_tb, aes(x= sp, y= FL, fill= sex)) + # para agrupar se completa fill con otra variable categorica
  geom_bar(position = "dodge", stat = "identity")


# 3.2. Histogramas
# Problema: queres ver la distribucion los datos
# Solucion 1: histograma
# variable numerica
# una variable numerica
ggplot(iris, aes(x= Sepal.Length)) +
  geom_histogram()
# cambair el ancho
ggplot(iris, aes(x= Sepal.Length)) +
  geom_histogram(binwidth = 0.2, color= "blue", fill= "orange")

# varios grupos y una variable

ggplot(iris, aes(x= Petal.Length, fill = Species)) +
  geom_histogram( )

ggplot(iris, aes(x= Petal.Length, fill = Species)) +
  geom_histogram(position = "identity", binwidth = 0.05, alpha= 0.7 )

# aplicando facet_grid
ggplot(iris, aes(x= Petal.Length)) +
  geom_histogram(binwidth = 0.5, color= "black", fill = "white") +
  facet_grid(~ Species)

# 3.4. Graficos de densidad
# Problema: queres ver la distribucion con la curva de kernel
# Solucion: graficos de densidad
# Datos: tipo numerico
# metodo 1
ggplot(iris, aes(x= Sepal.Length)) +
  geom_density()
# metodo 2
ggplot(iris, aes(x= Sepal.Length)) +
  geom_line(stat = "density")

# Curva de densidad de kernel:  The amount of smoothing depends on the kernel bandwidth: 
# the larger the bandwidth, the more smoothing there is. The bandwidth can be set with 
# the adjust parameter, which has a default value of 1 
ggplot(iris, aes(x = Sepal.Length)) +
  geom_line(stat = "density") +
  geom_line(stat = "density", adjust = .25, colour = "red") +
  geom_line(stat = "density", adjust = 2, colour = "blue")

# personalizar
ggplot(iris, aes(x= Sepal.Length)) +
  geom_density(fill= "blue", alpha= .2)



# combinar con histograma

ggplot(iris, aes(x= Sepal.Length, y= ..density..)) +
  geom_histogram(bins = 30, color= "black", fill = "white", size= .2) +
  geom_density()
  