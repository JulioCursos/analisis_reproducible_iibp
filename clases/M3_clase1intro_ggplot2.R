############-----------MODULO 3: CLASE 1. INTRO A GGPLOT----------############
#CONTENIDO:
###3.1. Intro ggplot2. Estructura
# 3.1.1 datos:siempre una tabla. Ojo! ggplot solo acepta tablas, nunca vectores!
# 3.1.2 esteticas: variables (x, y) y otros elementos (colores, forma, grosor) que se van a graficar
# 3.1.3 capas o geometrias: lineas, puntos, rectas, histogramas, etc
# 3.1.4 facetas: subdivisiones y graficos multiples
# 3.1.5. Etiquetas y titulos
# 3.1.6. Temas

## 3.1.1 datos. 
# Siempre una tabla! ggplot no admite vectores
p <- ggplot(data = iris)



## 3.1.2 esteticas
# Son las variables que se van a graficar. Ademas colores, forma, tamanios etc

p <- p + aes(x = Petal.Length, y = Petal.Width, colour = Species)
# lo mismo en una sola expresion
p <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species))

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
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + geom_point()

# se pueden agregar otras capas

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
  geom_point() +
  geom_smooth()
# COMENTARIO: alternativamente, las esteticas tambien se pueden indicar dentro de los "geoms"
ggplot(data = iris) + 
  geom_point(aes(x = Petal.Length, y = Petal.Width, colour = Species)) 
  
## 3.1.4 facetas: subdivisiones y graficos multiples


ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point() + geom_smooth() + 
  facet_grid(~ Species)



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

ggplot(data= iris, aes(x= Species, y= Sepal.Length)) +
  geom_boxplot(fill= "blue")
         
