combineFiles <- function(inputPrefix, outputFileName) {
  # List semua file dengan prefix yang sama
  fileNames <- list.files(pattern = paste0("^", inputPrefix))
  print("File names before sorting:")
  print(fileNames)

  # Urutkan nama file berdasarkan urutan angka pada akhir nama file
  fileNames <- fileNames[order(as.numeric(gsub(pattern = paste0("^", inputPrefix, "_"), "", fileNames)))]
  print("File names after sorting:")
  print(fileNames)

  # Baca konten setiap file dan gabungkan
  combinedContent <- raw(0)
  for (fileName in fileNames) {
    filePath <- file.path(fileName)
    fileContent <- readBin(filePath, raw(), file.size(filePath))
    combinedContent <- append(combinedContent, fileContent)
  }

  # Tulis konten gabungan ke file output
  writeBin(combinedContent, outputFileName)

  cat("Files combined successfully.\n")
}

# Ganti dengan prefix nama file output yang ingin Anda gabungkan
inputPrefix <- "kenangan_indah"

# Ganti dengan nama file output setelah penggabungan
outputFileName <- "kenangan_terindah_combined.mp3"

combineFiles(inputPrefix, outputFileName)
