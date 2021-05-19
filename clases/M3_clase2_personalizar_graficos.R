############-----------MODULO 3: CLASE 2. PERSONALIZAR GRAFICOS----------############
library(ggplot2)
data("midwest", package = "ggplot2")
names(midwest)
#CONTENIDO:

# 1. capa de datos y esteticas basicas

ggplot(data = midwest, aes(x=area, y=poptotal))

# 2. crear un grafico simple
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() +
  geom_smooth(method = "lm")
# con iris
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
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
  
# con iris
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Largo vs ancho petalo", subtitle = "Del dataset iris", 
       y= "largo petalo", x= "ancho petalo", caption = "medidas lineales")
# 

# 5. cambiar colores y tama??os de los puntos

vignette("ggplot2-specs")


ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(col= "steelblue", size= 3) + 
  geom_smooth( method="lm", col= "firebrick") +
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) +
  labs(title = "Area vs population", subtitle = "From midwest dataset", 
       y= "population", x= "Area", caption = "Midwest demographics")
# con iris
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point(col= "orange", size= 2) +
  geom_smooth(method = "lm", color= "red") +
  labs(title = "Largo vs ancho petalo", subtitle = "Del dataset iris", 
       y= "largo petalo", x= "ancho petalo", caption = "medidas lineales")

# setear colores de acuerdo a una categoria
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(color= state), size= 3) +  # setear el color. Size va afuer para que no genere una leyenda
  geom_smooth(method="lm", col="firebrick", size= 2) + # setea grosor y color de la linea
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# Si queres sacar la leyenda

gg + theme(legend.position = "none")


# con iris
ii <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point(aes(col= Species), size= 2) +
  geom_smooth(method = "lm", color= "red") +
  labs(title = "Largo vs ancho petalo", subtitle = "Del dataset iris", 
       y= "largo petalo", x= "ancho petalo", caption = "medidas lineales")



# si queres agregar una paleta de colores

gg + scale_color_brewer(palette = "Set1") # Qualitative: Accent, Dark2, Paired, Pastel1, Pastel2, Set1, Set2, Set3

# con iris
ii + scale_color_brewer(palette = "Pastel1")
  
# mas paletas de colores 
library(RColorBrewer)
head(brewer.pal.info, 10)



# 6. cambiar texto y marcas del eje x

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


gg + scale_x_reverse()


# 7.Cambiar el tema usando temas pre-contruidos
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

gg <- gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01))

gg
# 7.1. usando theme_set
theme_set(theme_classic())
gg

# 7.2. usando una capa tema propiamente
# Theme_: diferentes temas pre-establecidos que se aplican sobre el plot

gg + theme_gray() # el tipico de ggplot
gg + theme_bw() # con la grilla
gg + theme_classic() #
gg + theme_minimal()



# Cambios aun mas personalizados
# plot base
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) +
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(title="Area Vs Population",  subtitle="From midwest dataset", y="Population", x="Area", caption="Source: midwest")

gg

# la mayoria de las modificaciones sobre apariencia no-datos se personaliza
# dentro de theme()
# element_text(): textos de titulos, subtitulos etc
# element_line(): lineas como los ejes y las grillas
# element_rect(): rectangulos como los plots y los fondos
# element_blank: elimina o reuntraliza el elemento del tema

# 1. Personalizar titulos, subtitulos y ejes

gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) +
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Source: midwest")

gg
# modificar titulo y subtitulo

# titulo
gg + theme(plot.title = element_text(size = 20,         # tamanio
                                     face = "bold",     # "plain", "italic", "bold", "bold.italic"
                                     family = "serif", # sans (por defecto), serif, mono
                                     color= "tomato",
                                     hjust = 0.5, # justificacion horizontal
                                      )) 
# subtitulo
gg + theme(plot.subtitle = element_text(size = 12,
                                        face = "italic",
                                        family = "sans"))                 


# titulo y subtitulo

gg + theme(plot.title = element_text(size = 20,         
                                     face = "bold",    
                                     family = "serif", 
                                     color= "tomato",
                                     hjust = 0.5),
           plot.subtitle = element_text(size = 12,
                                        face = "italic",
                                        family = "sans"))                 
# ejes
gg + theme(axis.title.x = element_text(vjust=10,  
                                     size=15),  # titulo del eje x
           axis.title.y = element_text(size=15),  # titulo del eje y
           axis.text.x = element_text(size=10, 
                                    angle = 30,
                                    vjust=.5),  # textos eje x
           axis.text.y=element_text(size=10))  # textos eje y)

?theme


# 2. Modificar las leyendas

gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) +
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Source: midwest")
gg
# modificar titulos de leyendas
# 2.1. usando labs()

gg + labs(color= "State", size= "Density") # modificamos titulos de las leyendas

# 2.2. usando guides()

gg + guides(color=guide_legend("State"), size=guide_legend("Density"))



# Cambiar el orden de las leyendas

 gg + guides(colour = guide_legend(order = 1),
                 size = guide_legend(order = 2))

 
# Cambiar estilo de la leyenda
 
gg + theme(legend.title = element_text(size=12, color = "firebrick"), 
           legend.text = element_text(size=10),
           legend.key= element_rect(fill='springgreen'))


# Eliminar la leyenda o cambiar de posicion
# eliminar leyenda
gg + theme(legend.position="None") 

# cambiar de posicion
gg + theme(legend.position="left") # izquierda

gg + theme(legend.position="bottom", legend.box = "horizontal") # abajo horizontal


# 3. alternando posicion de los ejes x e y

gg  + coord_flip()


# 4. facetas
  
data(mpg, package="ggplot2") 

mpg

#  highway mileage (hwy) 
# engine displacement (displ)
g <- ggplot(mpg, aes(x=displ, y=hwy)) + 
  geom_point() + 
  labs(title="hwy vs displ", caption = "Source: mpg") +
  geom_smooth(method="lm", se=FALSE) + 
  theme_bw()  # apply bw theme

g

# facet_wrap(): se usa para subdividir en multples plots mas peque??os 
             # para categorias individuales

g + facet_wrap( ~ class, nrow = 3) # con la misma escalda en comun


g + facet_wrap( ~ class, scales = "free")

# facet_grid( )

g + facet_grid(~ class)


# 5. modificar el fondo

# Base Plot
g <- ggplot(mpg, aes(x=displ, y=hwy)) + 
  geom_point() + 
  geom_smooth(method="lm", se=FALSE) + 
  theme_bw() 
g

# cambiar elementos del fondo (background)

g + theme(panel.background = element_rect(fill = "lightgreen"),
          panel.grid.major = element_line(color = "darkgrey", size = 1.5),
          panel.grid.minor = element_line(color = "tomato", 
                                          size = 1,
                                          linetype = "dashed"),
          panel.border = element_blank(),
          axis.line.x = element_line(colour = "darkorange", 
                                     size=1.5, 
                                     lineend = "butt"),
          axis.line.y = element_line(colour = "darkorange", 
                                     size=1.5))

# modificar los margenes

g + theme(plot.background=element_rect(fill="salmon"), 
          plot.margin = unit(c(2, 2, 1, 1), "cm"))

# Eliminar grillas

g + theme(panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(), 
          panel.border = element_blank(),
          axis.title = element_blank(), 
          axis.text = element_blank(),
          axis.ticks = element_blank()) 


?theme
