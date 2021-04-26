############-----------MODULO 3: CLASE 1. INTRO A GGPLOT----------############
#CONTENIDO:
# 3.1. Intro ggplot. Estructura
# 3.2. Cambio de formato de  tablas con tidyr 

#### 3.1. Intro ggplot2. Estructura
# 3.1.1 datos:siempre una tabla. Ojo! ggplot solo acepta tablas, nunca vectores!
# 3.1.2 esteticas: variables (x, y) y otros elementos (colores, forma, grosor) que se van a graficar
# 3.1.3 capas o geometrias: lineas, puntos, rectas, histogramas, etc
# 3.1.4 facetas: subdivisiones y gr??ficos m??ltiples


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

