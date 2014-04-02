#downloading and bringing in the 2013 census mechblock data
#assumes that to start the working directory is set to the folder this script is in, but it will wander in the course of the script

#note this creates a census2013rawdata folder at the same level as the current working directory
#then downloads the data from stats nz to there and uncompresses it
#this is some that I can manage the changing scripts with the unchanging data easier
#I know, as written, the file paths work on Mac/ Linux
if (!(file.exists("../census2013rawdata"))){
  dir.create("../census2013rawdata")
}
#we will add a census output folder for much later as well
if (!(file.exists("../census2013output"))){
  dir.create("../census2013output")
}

#then shift the working directory to the data one
setwd("../census2013rawdata")
source_url <- "http://www3.stats.govt.nz/meshblock/2013/csv/2013_mb_dataset_Total_New_Zealand_CSV.zip"
target_localfile <- "2013_mb_dataset_Total_New_Zealand_CSV.zip"
an_uncompressed_file <- "2013-mb-dataset-Total-New-Zealand-Dwelling.csv"
if (!file.exists(an_uncompressed_file)) {
  if (!file.exists(target_localfile)) {
    
    download.file(source_url, target_localfile, mode="wb")
    
    library(tools)       # md5sum
    sink("download_metadata.txt")
    print("Download date:")
    print(Sys.time() )
    print("Download URL:")
    print(source_url)
    print("Downloaded Archive Information")
    print(file.info(target_localfile))
    print("Downloaded Archive Checksum")
    print(md5sum(target_localfile))
    sink()
    
  }
  unzip(target_localfile)
  
}

