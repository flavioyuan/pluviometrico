# leitura dos dados pluviometricos e gravacao em arquivo unico
#
data_folder <- "/home/flavioyuan/Documentos/R/Projetos/pluviometrico/Dados"

#Read all files from data folder
files <- list.files(data_folder, pattern = "*.txt")

for (i in 1:length(files)) {
  print(files[i])
}
