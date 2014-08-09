#### LoadPowerData Instructions ####

## This file handles the loading of the power data for use (externally) 
##   by the various plots.  
## NOTE: To use this script's data, reference the object "powerData.df".

#### LoadPowerData Code ####

# Load power data.
loadPowerData <- function()
{
     # Make sure date package 'lubridate' is installed.
     if("lubridate" %in% rownames(installed.packages()) == FALSE) 
     { install.packages("lubridate") }
     
     # Set variables for hard-coded URL's, file names, etc.
     downloadUrl <- paste0('https://d396qusza40orc.cloudfront.net/',
                           'exdata%2Fdata%2Fhousehold_power_consumption.zip')
     downloadedDataFileName <- "DownloadedPowerData.zip"
     internalZipDataFileName <- "household_power_consumption.txt" # Set by data provider.
     persistedDataFileName <- "PersistedPowerData.rds"
     
     # If raw data file hasn't been saved yet, download, unzip, and load it.
     # NOTE: Raw data file is persisted as an RDS file for later use.
     if (file.exists(persistedDataFileName))
     {
          # Load existing (persisted) data file.
          print("[LoadPowerData] Persisted Power data file found.  Loading persisted data...")
          powerData.df <- readRDS(persistedDataFileName)
          
          print("[LoadPowerData] Loading OK!")
     } else 
     {
          # Download file.
          print("[LoadPowerData] Persisted Power data file not found.  Downloading...")
          download.file(downloadUrl,
                        mode="wb", 
                        destfile=downloadedDataFileName)
          
          # Unzip file.
          print("[LoadPowerData] Download OK.  Unzipping...")
          unzip(downloadedDataFileName)
          
          # Read unzipped power data as table into a "power" data frame.
          print("[LoadPowerData] Unzip OK.  Loading into data frame...")
          powerData.df <- read.table(internalZipDataFileName, 
                                     header=TRUE,
                                     sep=';',
                                     na.strings='?',
                                     colClasses=c(rep('character', 2),
                                                  rep('numeric', 7)))
          
          # Convert dates and times using 'lubridate' methods.
          powerData.df$Date <- dmy(powerData.df$Date)
          powerData.df$Time <- hms(powerData.df$Time)
          
          # Subset power data to just the 2 days we care about (2007-02-01 -> 2007-02-02).
          print("[LoadPowerData] Loading OK.  Subsetting Power data file to 1-2 Feb 2007...")
          powerData.df <- subset(powerData.df, 
                                 year(Date) == 2007 &
                                  month(Date) == 2 &
                                  (day(Date) == 1 | day(Date) == 2))
          
          # Combine date and time into single field.
          powerData.df$date.time <- powerData.df$Date + powerData.df$Time
          
          # Persist file for later reference.
          print("[LoadPowerData] Subsetting OK.  Saving subsetted power data to RDS file...")
          saveRDS(powerData.df, file=persistedDataFileName)
          
          print("[LoadPowerData] Saving OK!")
     }
}
loadPowerData()