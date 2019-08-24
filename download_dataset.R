dataset.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
zip.dest <- 'data/pm25.zip'


if (!file.exists(zip.dest)) {
  print("Zip file not present, downloading...")
  download.file(dataset.url, dest = zip.dest)
  print("Done downloading zip file.")
}

unzip(zip.dest, exdir = 'data/')

print("Dataset ready.")
