library(tidyverse)
# tibble
iris_df <- iris
class(iris_df)

iris_tb <- as_tibble(iris_df)
class(iris_tb)

# readr

iris_tb <- read_csv("./datos/iris_clase3.csv")
class(iris_tb)
str(iris_tb)
glimpse(iris_tb)


iris_df <- read.csv("./datos/iris_clase3.csv")
class(iris_df)
str(iris_df)
glimpse(iris_df)



# readxl
library(readxl)# No es parte de tidyverse

data_excel <- read_excel("./datos/datasets.xlsx") # lee la hoja 1

mtcars_df <- read_excel("./datos/datasets.xlsx", sheet = 2)

mtcars_df <- read_excel("./datos/datasets.xlsx", sheet = "mtcars")




