# leitura dos dados pluviometricos e gravacao em arquivo unico
#
require(stringr)
require(dplyr)
data_folder <- "/home/flavioyuan/Documentos/R/Projetos/pluviometrico/Dados"

#Read all files from data folder
files <- list.files(data_folder, pattern = "*.txt")

for (i in 1:length(files)) {
  local <- substring(files[i], 1, str_length(files[i]) - 15)
  dados_pluviometricos <- read.csv(paste0(data_folder, "/", files[i]))
  dados_pluviometricos <- dados_pluviometricos %>% mutate(Distrito = local)
}
