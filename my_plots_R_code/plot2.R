



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


par(mfrow = c(1, 1))
par(mar=c(6,6,3,2))
plot(z$DateTime, z$Global_active_power, type="l", ylab="Global Active Power (kilowatt)", xlab="")


dev.copy(png, file = "plot2.png", width=480, height=480, bg = "transparent")  
## Copy my plot to a PNG file
dev.off() 
## Don't forget to close the PNG device!
