        #Loading and cleaning table
x <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

        #Set time variable
finalData <- x[x$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <- strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

        #Generating Plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

        #Printing Plot 3
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()