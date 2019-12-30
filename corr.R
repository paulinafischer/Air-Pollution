corr <- function(directory, threshold = 0) {
  id <-  1:332
  ## set working directory
  ##setwd("specdata")
  ## create names of all files in directory
  files <- list.files(pattern =".csv", full.names = TRUE )
  ##files <- c(dir())
  ## create empty numeric and empty vector
  values <- numeric(0)
  ouput <- vector()
  
  ## return correlation between pollutants where nobs > threshold
  for (i in id) {
    data <- read.csv(files[i], header = TRUE)
    values <- data[complete.cases(data),]
    if(nrow(values)>threshold) {
      ouput <- append( ouput,cor(values$nitrate,values$sulfate))
    }
  }
  ## print correlation
  return(ouput)
}