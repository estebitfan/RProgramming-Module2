#Load the readr library
library(readr)

#Function that reads the files in the Dataset diretory and calculates the mean
pollutantmean <- function(directory, pollutant, id = 1:332){
    a <- 0
    for(i in id){
        
        #The format is XXX.csv so it needs to be written like that
        if(i < 10){
            file <- paste("00",i, sep = '')
        }
        if(i >= 10 & i < 100){
            file <- paste("0",i, sep = '')
        }
        if(i >= 100){
            file <- paste(i, sep = '')
        }
        
        #Creating the char vector to access the files
        csvFilePath <- (paste(directory, file,".csv", sep = ''))
        #print(i)
        #Sulfate case
        if(pollutant == "sulfate"){
            if(i == id) {
                
                #The first FOR will get the avg of the first file
                a <- read.csv(csvFilePath)[[2]]
                next
            }
            a <- c(a, read.csv(csvFilePath)[[2]])
        }
        if(pollutant == "nitrate"){
            if(i == id) {
                
                #The first FOR will get the avg of the first file
                a <- read.csv(csvFilePath)[[3]]
                next
            }
            a <- c(a, read.csv(csvFilePath)[[3]])
        }
        #print(a)
    }
    mean(a, na.rm = TRUE)
}

complete <- function(directory, id = 1:332){
    a <- 0
    df <- data.frame(fileID = integer(),
                     nobs = integer())
    for(i in id){
       #print(i) 
        #The format is XXX.csv so it needs to be written like that
        if(i < 10){
            file <- paste("00",i, sep = '')
        }
        if(i >= 10 & i < 100){
            file <- paste("0",i, sep = '')
        }
        if(i >= 100){
            file <- paste(i, sep = '')
        }
        csvFilePath <- (paste(directory, file,".csv", sep = ''))
        #print(paste("id:", i))
        df <- rbind(df, id = c(fileID = i, nobs = sum(complete.cases(read.csv(csvFilePath)))))
        #Creating the char vector to access the files
        #a <- c(a, read.csv(csvFile)[[3]])
    }
    df
}

corr <- function(directory, threshold = 0) {
    path <- paste0(getwd(),"/", directory)
    corr_vect <- NULL
    for (i in 1:332) {
        if (i < 10) {
            dat <- read.csv(paste(path,"/00", as.character(i),".csv", sep = ""), 
                            as.is = T, 
                            header = T)
        }
        else if (i < 100) {
            dat <- read.csv(paste(path,"/0", as.character(i),".csv", sep = ""), 
                            as.is = T, 
                            header = T)
        }
        else {
            dat <- read.csv(paste(path,"/", as.character(i),".csv", sep = ""), 
                            as.is = T, 
                            header = T)
        }
        
        data <- dat[complete.cases(dat),]
        if (nrow(data) > threshold) {
            corr_vect <- c(corr_vect, cor(data[,"sulfate"], data[, "nitrate"]))
        }
    }
    
    return(corr_vect)
}

pollutantmean("Dataset/", "sulfate", id = 1:10)
complete("Dataset/", id = 30:25)

a <- corr("Dataset/", 150)
head(a,6)
summary(a)

pollutantmean("Dataset/", "sulfate", 34)

pollutantmean("Dataset/", "nitrate")

cc <- complete("Dataset/", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("Dataset/", 54)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("Dataset/", 332:1)
use <- sample(332, 10)
print(cc[use, "X16L"])


cr <- corr("Dataset/")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("Dataset/", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
