############-----------MODULO 3: CLASE 1. INTRO A RMARKDOWN----------############
# Contenido
# 1.1. Intro a rmarkdown
# 1.2. Elementos basicos de rmarkdown
# 1.3. Formateo de texto con rmarkdown
# 1.4. Bloques de codigo
# 1.5. Encabezado YAML
# 1.6. Formatos de salida

##### 1.1. Intro a rmarkdown
# - crear un documento rmarkdwon
# - crear un documento notebook
# - analizar similitures y diferencias

## Usos de rmarkdonw
# 1. Comunicarse con quienes toman deciciones (No les interesa el codigo)
# 2. Colaborar con otras personas (tu yo futuro). Les interesa codigos
# 3. Ambiente para trabajar. Como sifuera un notebook de laboratorio
  

##### 1.2. Elementos basicos de rmarkdown
# CREAR UN ARCHIVO rmarkdown y explicar los elementos

# Elementos de rmarkdown
# 1. Un encabezado YAML (opcional) rodeado de --- ( Es un formato de seriacion)
# 2. Bloques de codigo de R rodeados de ```
# 3. Texto mezclado con formateo de texto simple

# COMENTARIOS:
# al crear el archivo tiene la extension .Rmd
# es un notebook que alterna codigo y texto
# ejecutar el bloque de codigo completo con el boton reproducir o Ctrl + Shift + Enter
# producir el reporte completo haciendo click en "knit" o Ctrol + Shift + k 


#### 1.3. Formateo de texto con rmarkdown

# (mostrar en un notebook)

## Formato de texto 

  # *cursiva* o _cursiva_
  #  **negrita** o __negrita__

## Encabezados
  # Encabezado de primer nivel
  ## Encabezado de segundo nivel
  ### Encabezado de tercer nivel
  
  
## Listas

#  *   Elemento 1 en la lista no ennumerada
#  *   Elemento 2
#     * Elemento 2a
#     * Elemento 2b


## Enlaces
  # <http://ejemplo.com>
  # [texto del enlace](http://ejemplo.com)



# 1.4. Bloques de codigo
# Insertar un bloque Ctrl + Alt + I
# Ejecutar bloque Ctrl + Shift + Enter

## Nombre de los bloques (opcional)
# tres ventajas de nombres

# 1. Podes navegar mas facilemente con el navegador de codigos
# 2. Los gr??ficos producidos por los bloques tendr??n nombres ??tiles.
# 3. Puedes crear redes de bloques guardamos en cach??

# setup es un bloque especial que se va a ejecular automaticamente


## Opciones de los bloques

# eval = FALSE  : evita que el c??digo sea evaluado
    # Util para mostrar ejemplos de codigo
    # Util para deshabilitar varias lineas sin tener que comentar
# include = FALSE  : ejecuta el codigo, pero no lo muestra en el reporte
    # se usa para codigos de configuracion
# echo = FALSE  : evita que se veo el codigo, pero si muestra los resultados


# message = FALSE o warning = FALSE : evita que aparezcan mensajes en el reporte

# results = 'hide' : oculta el output impreso

# fig.show = 'hide' : oculta los graficos

## Tablas

# mtcars[1:5, ] : Por defecto imprime como en la consola


#### 1.5 Encabezado YAML
# YAML: es la sigla en ingles de la frase yet another markup language???
# que significa ???otro lenguaje de marcado m??s???
# R Markdown lo utiliza para controlar muchos detalles del output


#### # 1.6. Formatos de salida
# dos maneras de dar formatos de salidsa
## 1. Permanente (YAML)
## 2. Transitoria (rmarkdown::render( ))

rmarkdown::render("./clases/ejemplo_notebook.Rmd", output_format = "word_document")

# formatos basicos

# pdf_document 
# word_document
# odt_document
# rtf_document
# md_document
# github_document # version de md_document disenada para compartir en github


## opciones globales si el documento se va a compartir con tomadores de decisiones

  |# knitr::opts_chunk$set(echo = FALSE)
  
  # otra opcion es
  # output:
  # html_document:
  # code_folding: hide