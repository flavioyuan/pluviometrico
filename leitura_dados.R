require(ggplot2)
require(tidyverse)

# Teste de leitura dos dados
setwd("/home/flavioyuan/Dados/DadosPluviometricos")
my_data <- read_csv("anchieta_199701_Plv.txt")

# Read all files from folder
files <- list.files(pattern = "*.txt")
