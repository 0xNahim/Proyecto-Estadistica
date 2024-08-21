library(tidyverse)

datos <- read.csv("./datos.csv", header= TRUE, sep=";")
subset_data <- datos %>% slice(1:300)

subset_data$AT <- as.numeric(gsub(",", ".", subset_data$AT))
subset_data$V <- as.numeric(gsub(",", ".", subset_data$V))
subset_data$RH <- as.numeric(gsub(",", ".", subset_data$RH))
subset_data$PE <- as.numeric(gsub(",", ".", subset_data$PE))

modelo_temp <- lm(PE ~ AT, data = subset_data)
summary(modelo_temp)


modelo_vacio <- lm(PE ~ V, data = subset_data)
summary(modelo_vacio)


modelo_humedad <- lm(PE ~ RH, data = subset_data)
summary(modelo_humedad)

