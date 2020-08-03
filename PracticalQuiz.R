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
        if(pollutant == "sulfate"){
            a <- (c(mean(read.csv(csvFile)[[2]], na.rm = TRUE), a))
            print(a)
        }
        if(pollutant == "nitrate"){
            a <- (c(mean(read.csv(csvFile)[[3]], na.rm = TRUE), a))
            #print(a)
        }
    }
    a
}

pollutantmean("Dataset/", "sulfate", id = 1:10)

