## Check if you got dat der file
if (!file.exists("./household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
  unzip("./exdata-data-household_power_consumption.zip")
}

filename <- "./household_power_consumption.txt"
file <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
dim(file) 
attach(file)
dates <- Date == "1/2/2007" | Date == "2/2/2007"
newData <- file[dates, ]
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
dim(newData)
attach(newData)