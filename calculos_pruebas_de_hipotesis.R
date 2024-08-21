library(tidyverse)

datos <- read.csv("./datos.csv", header= TRUE, sep=";")
subset_data <- datos %>% slice(1:300)

subset_data$AT <- as.numeric(gsub(",", ".", subset_data$AT))
subset_data$V <- as.numeric(gsub(",", ".", subset_data$V))
subset_data$RH <- as.numeric(gsub(",", ".", subset_data$RH))
subset_data$PE <- as.numeric(gsub(",", ".", subset_data$PE))

cor.test(subset_data$AT, subset_data$PE)
cor.test(subset_data$V, subset_data$PE)
cor.test(subset_data$RH, subset_data$PE)
