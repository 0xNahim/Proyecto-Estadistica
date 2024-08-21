library(tidyverse)


datos <- read.csv("./datos.csv", header= TRUE, sep=";")
subset_data <- datos %>% slice(1:300)
subset_data$V <- as.numeric(gsub(",", ".", subset_data$V))
subset_data$PE <- as.numeric(gsub(",", ".", subset_data$PE))

plot(subset_data$V, subset_data$PE,
     main = "Producción Energética vs Vacío de escape",
     xlab = "Vacío",
     ylab = "Producción Energética",
     col = "#C1FFC1",
     pch = 19)
abline(lm(PE ~ V, data = subset_data), col = "#0000EE")
