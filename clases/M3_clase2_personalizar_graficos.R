############-----------MODULO 3: CLASE 2. PERSONALIZAR GRAFICOS----------############
library(ggplot2)
data("midwest", package = "ggplot2")
#CONTENIDO:

# 1. capa de datos y esteticas basicas

ggplot(data = midwest, aes(x=area, y=poptotal))

# 2. crear un grafico simple
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() +
  geom_smooth(method = "lm")

# 3. adjustar los l??mites x e y

# metodo 1. borrando los puntos fuera de los limites

ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") +
  xlim(c(0, 0.1)) + ylim(c(0, 1000000))

# metodo 2. Haciendo zoom. No elimina puntos

ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") +
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))

# 4. Tituto y etiquetas de los ejes


ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") +
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) +
  labs(title = "Area vs population", subtitle = "From midwest dataset", 
       y= "population", x= "Area", caption = "Midwest demographics")
# o
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") +
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) +
  ggtitle("Area vs population", subtitle = "From midwest dataset") +
  xlab("Area") + ylab("Population")
  
  
# 5. cambiar colores y tama??os de los puntos

vignette("ggplot2-specs")


ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(col= "steelblue", size= 3) + 
  geom_smooth( method="lm", col= "firebrick") +
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) +
  labs(title = "Area vs population", subtitle = "From midwest dataset", 
       y= "population", x= "Area", caption = "Midwest demographics")

# setear colores de acuerdo a una categoria
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(color= state), size= 3) +  # setear el color. Size va afuer para que no genere una leyenda
  geom_smooth(method="lm", col="firebrick", size= 2) + # setea grosor y color de la linea
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# Si queres sacar la leyenda

gg + theme(legend.position = "none")

# si queres agregar una paleta de colores

gg + scale_color_brewer(palette = "Set1")


# mas paletas de colores 
library(RColorBrewer)
head(brewer.pal.info, 10)



# 6. cambiar text y marcas del eje x

# plot base
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
gg

# 6.1. cambiar las marcas de divisiones
gg + scale_x_continuous( breaks =  seq(0, 0.1, 0.01)) # seq(from, to, by)


# 6.2. cambiar las marcas y el texto 

gg + scale_x_continuous( breaks =  seq(0, 0.1, 0.01), labels = letters[1:11]) 


# si necesitas volver a la escala original


