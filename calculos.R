library(tidyverse)


datos <- read.csv("./datos.csv", header= TRUE, sep=";")
subset_data <- datos %>% slice(1:300)

subset_data$AT <- as.numeric(gsub(",", ".", subset_data$AT))
subset_data$V <- as.numeric(gsub(",", ".", subset_data$V))
subset_data$RH <- as.numeric(gsub(",", ".", subset_data$RH))
subset_data$PE <- as.numeric(gsub(",", ".", subset_data$PE))

hist_data <- function(data, breaks = 30) {
  hist_obj <- hist(data, breaks = breaks, plot = FALSE)
  return(hist_obj)
}

# Encontrar la moda basada en intervalos del histograma
mode_based_on_histogram <- function(data, breaks = 30) {
  hist_obj <- hist_data(data, breaks)
  mode_bin <- which.max(hist_obj$counts)
  mode_value <- mean(hist_obj$breaks[mode_bin:(mode_bin + 1)])
  return(mode_value)
}

# Calcular estadísticas descriptivas para una variable
calculate_stats <- function(data) {
  media <- mean(data)
  mediana <- median(data)
  moda <- mode_based_on_histogram(data)
  Q1 <- quantile(data, 0.25)
  Q3 <- quantile(data, 0.75)
  desviacion_estandar <- sd(data)
  return(list(
    media = media,
    mediana = mediana,
    moda = moda,
    Q1 = Q1,
    Q3 = Q3,
    desviacion_estandar = desviacion_estandar
  ))
}

# Calcular estadísticas descriptivas para la Temperatura (AT)
AT_stats <- calculate_stats(subset_data$AT)
cat("Estadísticas para la Temperatura (AT):\n")
cat("Media: ", AT_stats$media, "\n")
cat("Mediana: ", AT_stats$mediana, "\n")
cat("Moda: ", AT_stats$moda, "\n")
cat("Cuartil 1 (Q1): ", AT_stats$Q1, "\n")
cat("Cuartil 3 (Q3): ", AT_stats$Q3, "\n")
cat("Desviación Estándar: ", AT_stats$desviacion_estandar, "\n\n")

# Calcular estadísticas descriptivas para el Vacío (V)
V_stats <- calculate_stats(subset_data$V)
cat("Estadísticas para el Vacío (V):\n")
cat("Media: ", V_stats$media, "\n")
cat("Mediana: ", V_stats$mediana, "\n")
cat("Moda: ", V_stats$moda, "\n")
cat("Cuartil 1 (Q1): ", V_stats$Q1, "\n")
cat("Cuartil 3 (Q3): ", V_stats$Q3, "\n")
cat("Desviación Estándar: ", V_stats$desviacion_estandar, "\n\n")

# Calcular estadísticas descriptivas para la Humedad Relativa (RH)
RH_stats <- calculate_stats(subset_data$RH)
cat("Estadísticas para la Humedad Relativa (RH):\n")
cat("Media: ", RH_stats$media, "\n")
cat("Mediana: ", RH_stats$mediana, "\n")
cat("Moda: ", RH_stats$moda, "\n")
cat("Cuartil 1 (Q1): ", RH_stats$Q1, "\n")
cat("Cuartil 3 (Q3): ", RH_stats$Q3, "\n")
cat("Desviación Estándar: ", RH_stats$desviacion_estandar, "\n\n")

# Calcular estadísticas descriptivas para la Producción Energética (PE)
PE_stats <- calculate_stats(subset_data$PE)
cat("Estadísticas para la Producción Energética (PE):\n")
cat("Media: ", PE_stats$media, "\n")
cat("Mediana: ", PE_stats$mediana, "\n")
cat("Moda: ", PE_stats$moda, "\n")
cat("Cuartil 1 (Q1): ", PE_stats$Q1, "\n")
cat("Cuartil 3 (Q3): ", PE_stats$Q3, "\n")
cat("Desviación Estándar: ", PE_stats$desviacion_estandar, "\n")