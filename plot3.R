if(!(file.exists("household_power_consumption.txt"))){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./ExData.zip")
  unzip("ExData.zip")
}
fullData <- read.csv("household_power_consumption.txt", header = TRUE, 
                     sep = ";", na.strings = "?")
data1 <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/ %m/ %Y")
data1$DateTime <- as.POSIXct(paste(as.Date(data1$Date), data1$Time))
with(data1, {
  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "Red")
  lines(DateTime, Sub_metering_3, col = "Blue")
  })
legend("topright", col = c("Black","Red","Blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()
