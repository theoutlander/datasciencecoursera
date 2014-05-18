pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    allItems <- c()
    
    for(item in id)
    {
        data <- read.csv(file=file.path(directory, paste(formatC(item, width=3, flag="0"), ".csv", sep="")), head=TRUE, sep=",")
        data <- data[apply(!is.na(data[pollutant]), 1, any), ]
        p <- data[, pollutant]
        
        allItems = c(allItems, p)
    }

  round(mean(allItems), digits=3)
}