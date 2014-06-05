


getwd()


x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
na.strings = "?" )
y <-x

# Date: Date in format dd/mm/yyyy
y$Date <- strptime(y$Date, "%d/%m/%Y")
y$Date <- as.Date(y$Date)

z <- y[y$Date==as.Date("2007-02-01") | y$Date==as.Date("2007-02-02"), ]
which(is.na(z) == TRUE)
# integer(0)



par(mar=c(5,5,3,2))
hist(z$Global_active_power, main = paste("Global Active Power"), xlab="Global Active Power (kilowatt)", ylab="Frequency", col="red", xlim=c(0,6), ylim=c(0,1200))


dev.copy(png, file = "plot1.png", width=480, height=480, bg = "transparent")  
## Copy my plot to a PNG file
dev.off() 
## Don't forget to close the PNG device!
