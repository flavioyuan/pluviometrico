# leitura dos dados pluviometricos e gravacao em arquivo unico
#
require(stringr)
require(dplyr)
require(readr)
require(tidyverse)

data_folder <- "/home/flavioyuan/Documentos/R/Projetos/pluviometrico/Dados"

#Read all files from data folder
files <- list.files(data_folder, pattern = "*.txt")
ncol_df <- data_frame(
  FILE = character(),
  LINHAS <- integer(),
  COLUNAS = integer()
)

for (i in 1:length(files)) {
  local <- substring(files[i], 1, str_length(files[i]) - 15)
  print(files[i])
  dados_pluviometricos <- read_table(paste0(data_folder, "/", files[i])
                                     , skip = 5
                                     , col_names = FALSE
                                     , col_types = cols(
                                       date_column_name = col_date(format = "%d/%m/%Y"),
                                       hora = col_time(),
                                       skip = col_skip(),
                                       m05 = col_double(),
                                       m10 = col_double(),
                                       m15 = col_double(),
                                       h01 = col_double(),
                                       h04 = col_double(),
                                       h24 = col_double(),
                                       h96 = col_double(),
                                       .default = col_guess()
                                     )
                                     , na = "ND"
  )
  #names(dados_pluviometricos) <- str_replace_all(names(dados_pluviometricos), c(" " = "."))
  dados_pluviometricos <- dados_pluviometricos %>% mutate(Distrito = local)
  #print(colnames(dados_pluviometricos))
  dimensions <- dim(dados_pluviometricos)
  print(paste("numero de dimensions: linhas = ", dimensions[1], 
              " - colunas = ", dimensions[2]))
  ncol_df[i,1] <- files[i]
  ncol_df[i,2] <- dimensions[1]
  ncol_df[i,3] <- dimensions[2]
}
