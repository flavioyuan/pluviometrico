# leitura dos dados pluviometricos e gravacao em arquivo unico
#
require(stringr)
require(dplyr)
require(readr)

data_folder <- "/home/flavioyuan/Documentos/R/Projetos/pluviometrico/Dados"

#Read all files from data folder
files <- list.files(data_folder, pattern = "*.txt")

d <- data.frame(
  Dia = character(),
  Hora = character(),
  HBV = character(),
  Min05 = character(),
  Min10 = character(),
  Min15 = character(),
  H01 = character(),
  H04 = character(),
  H24 = character(),
  H96 = character(),
  Distrito = character()
)

for (i in 1:length(files)) {
  local <- substring(files[i], 1, str_length(files[i]) - 15)
  print(files[i])
  dados_pluviometricos <- read_table(paste0(data_folder, "/", files[i])
                                   , skip = 4
                          )
  
  dados_pluviometricos <- dados_pluviometricos %>% mutate(Distrito = local)
 # d <- bind_rows(d, dados_pluviometricos)
}
