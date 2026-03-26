# leitura dos dados pluviometricos e gravacao em arquivo unico
#
require(stringr)
require(dplyr)
require(readr)
require(tidyverse)

data_folder <- "/home/flavioyuan/Documentos/R/Projetos/pluviometrico/Dados"

#Read all files from data folder
files <- list.files(data_folder, pattern = "*.txt")

for (i in 1:length(files)) {
  local <- substring(files[i], 1, str_length(files[i]) - 15)
  print(files[i])
  dados_pluviometricos <- read_delim(paste0(data_folder, "/", files[i])
                                   , skip = 4
                                   , delim = "\\s+"
                                   , show_col_types = FALSE
                                   , col_names = TRUE
  )
  names(dados_pluviometricos) <- str_replace_all(names(dados_pluviometricos), c(" " = "."))
  dados_pluviometricos <- dados_pluviometricos %>% mutate(Distrito = local)
  print(colnames(dados_pluviometricos))
}
