if(!(file.exists("household_power_consumption.txt"))){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./ExData.zip")
  unzip("ExData.zip")
}
fullData <- read.csv("household_power_consumption.txt", header = TRUE, 
                     sep = ";", na.strings = "?")
data1 <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/ %m/ %Y")
data1$DateTime <- as.POSIXct(paste(as.Date(data1$Date), data1$Time))
par(mfrow = c(2,2), mar =c(4,4,2,1), oma = c(0,0,2,0))
with(data1,{
  plot(Global_active_power ~ DateTime, type = "l",
                 xlab = "", ylab = "Global Active Power")
  plot(Voltage ~ DateTime, type = "l",
                 xlab = "datetime", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "Red")
  lines(DateTime, Sub_metering_3, col = "Blue")
  legend("topright", col = c("Black","Red","Blue"), lty = 1, lwd = 2, bty = "n",y.intersp = 0.7,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power ~ DateTime, type = "l",
                 xlab = "datetime", ylab = "Global_reactive_power")
})
dev.copy(png,"plot4.png")
dev.off()
