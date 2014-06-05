



getwd()



x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
na.strings = "?" )
y <-x

# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
y$DateTime <- paste(x$Date, x$Time)
y$DateTime <- strptime(y$DateTime, "%d/%m/%Y %H:%M:%S")
y$DateTime <- as.POSIXct(y$DateTime)



y$Date <- strptime(x$Date, "%d/%m/%Y")
y$Date <- as.Date(y$Date)





z <- y[y$Date==as.Date("2007-02-01") | y$Date==as.Date("2007-02-02"), ]
which(is.na(z) == TRUE)
# integer(0)
dim(z)
# [1] 2880   12




# png(file = "plot4.png", width=480, height=480, bg = "transparent")

quartz()
par(mfrow = c(2, 2), mar = c(6, 6, 2, 2), oma = c(0, 0, 0, 0))
# type="p": point, type="l":line
# lty: line type, solid, dashed, dotted



plot(x=z$DateTime, y=z$Global_active_power, ylab="Global Active Power", xlab="", type="l")
plot(x=z$DateTime, y=z$Voltage, ylab="Voltage", xlab="datetime", type="l")


plot(x=z$DateTime, y=z$Sub_metering_1, ylab="Energy sub meeting", xlab="", type="n")
lines(x=z$DateTime, y=z$Sub_metering_1, type="l", col="black")
lines(x=z$DateTime, y=z$Sub_metering_2, type="l", col="red")
lines(x=z$DateTime, y=z$Sub_metering_3, type="l", col="blue")
#legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))
legend("topright",  lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(x=z$DateTime, y=z$Global_reactive_power, ylab="Global Reactive Power",
xlab="datetime", type="l")



dev.copy(png, file = "plot4.png", width=480, height=480, bg = "transparent")  
## Copy my plot to a PNG file
dev.off() 
## Don't forget to close the PNG device!
