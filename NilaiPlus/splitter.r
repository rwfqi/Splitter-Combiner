splitFile <- function(inputFile, outputPrefix, chunkSize) {
  # Baca file input
  fileContent <- readBin(inputFile, raw(), file.size(inputFile))

  # Hitung jumlah file output yang dibutuhkan
  numChunks <- ceiling(length(fileContent) / chunkSize)

  # Tulis file-file output
  for (i in 1:numChunks) {
    start <- (i - 1) * chunkSize + 1
    end <- min(i * chunkSize, length(fileContent))
    chunk <- fileContent[start:end]

    # Tulis ke file output
    outputFileName <- sprintf("%s_%03d.mp3", outputPrefix, i)
    writeBin(chunk, outputFileName)
  }

  cat("File split successfully.\n")
}

# Ganti dengan path file input yang ingin Anda bagi
inputFile <- "C:/Folder Rifqi/Folder Kulyah/A Semester 3/Struktur Data/projek/kenanganterindah.mp3"

# Ganti dengan prefix nama file output
outputPrefix <- "kenangan_indah"

# Ganti dengan ukuran file yang diinginkan (dalam bytes)
chunkSize <- 1024 * 1024  # Contoh: 1 MB

splitFile(inputFile, outputPrefix, chunkSize)
