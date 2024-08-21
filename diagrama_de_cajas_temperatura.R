library(tidyverse)


datos <- read.csv("./datos.csv", header= TRUE, sep=";")
subset_data <- datos %>% slice(1:300)

subset_data$AT <- as.numeric(gsub(",", ".", subset_data$AT))

boxplot(subset_data$AT,
        main = "Temperatura",
        col = "#CD3333",
        border = "black",
        ylim = c(5, max(subset_data$AT, na.rm = TRUE)),
        boxwex = 0.5)

