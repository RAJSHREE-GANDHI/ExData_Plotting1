if(!(file.exists("household_power_consumption.txt"))){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./ExData.zip")
  unzip("ExData.zip")
}
fullData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data1 <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/ %m/ %Y")
hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()
