complete <- function(directory, id = 1:332){
    
    m <- matrix(ncol=2, nrow=length(id))
    
    colnames(m) <- c("id", "nobs")
    m[, "id"] <- id

    rownames(m) <- 1:length(id)
    
    allItems = c()
    
    for(item in id)
    {
        data <- read.csv(file=file.path(directory, paste(formatC(item, width=3, flag="0"), ".csv", sep="")), head=TRUE, sep=",")
        allItems <- append(allItems, nrow(data[complete.cases(data), colnames(data)]))
    }
    
    m[,"nobs"] <- allItems
    m
}