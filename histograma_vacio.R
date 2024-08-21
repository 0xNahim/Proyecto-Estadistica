library(tidyverse)


datos <- read.csv("./datos.csv", header= TRUE, sep=";")
subset_data <- datos %>% slice(1:300)

subset_data$V <- as.numeric(gsub(",", ".", subset_data$V))



hist(subset_data$V, 
     main = "Histograma del vacío de escape", 
     xlab = "Valores del vacío de escape", 
     ylab = "Frecuencia", 
     col = "#C1FFC1", 
     border = "black")
