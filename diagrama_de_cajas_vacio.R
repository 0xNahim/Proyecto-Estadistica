library(tidyverse)


datos <- read.csv("./datos.csv", header= TRUE, sep=";")
subset_data <- datos %>% slice(1:300)

subset_data$V <- as.numeric(gsub(",", ".", subset_data$V))


boxplot(subset_data$V,
        main = "Vacío de escape",
        col = "#C1FFC1",
        border = "black",
        ylim = c(30, max(subset_data$V)),
        boxwex = 0.4)


