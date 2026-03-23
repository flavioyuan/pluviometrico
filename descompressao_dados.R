require(purrr)

zip_folder_path <- "/home/flavioyuan/Documentos/data"
extraction_folder <- "/home/flavioyuan/Documentos/R/Projetos/pluviometrico/Dados"

if (!dir.exists(extraction_folder)) {
  dir.create(extraction_folder)
}

# Read all files from folder
files <- list.files(zip_folder_path, pattern = "*.zip")

for (i in 1:length(files)) {
  file <- paste0(zip_folder_path, "/", files[i])
  print(file)
  unzip(file, exdir = extraction_folder)
}
