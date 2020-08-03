library(readr)
pollutantmean <- function(directory, pollutant, id = 1:332){
    for(i in id){
        if(i < 10){
            file <- paste("00",i, sep = '')
        }
        if(i >= 10 & i < 100){
            file <- paste("0",i, sep = '')
        }
        if(i >= 100){
            file <- paste(i, sep = '')
        }
        csvFile <- (paste(directory, file,".csv", sep = ''))
        print(csvFile)
        #a <- read.csv()
    }
}


b <- pollutantmean("Dataset/", x, id = 1:20)
getwd()
