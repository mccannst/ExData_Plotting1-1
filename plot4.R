hpcfeb07 <- subset(read.table("household_power_consumption.txt", header=T, sep=";"), 
                   Date == "1/2/2007" | Date == "2/2/2007", na.strings = ("?"))

hpcfeb07$Global_active_power <- as.numeric(as.character(hpcfeb07$Global_active_power))
hpcfeb07$Global_reactive_power <- as.numeric(as.character(hpcfeb07$Global_reactive_power))
hpcfeb07$Voltage <- as.numeric(as.character(hpcfeb07$Voltage))

hpcfeb07$DateTime <- paste(hpcfeb07$Date, hpcfeb07$Time)

hpcfeb07$DateTime <- strptime(hpcfeb07$DateTime, "%d/%m/%Y %H:%M:%S")

hpcfeb07$Sub_metering_1 <- as.numeric(as.character(hpcfeb07$Sub_metering_1))
hpcfeb07$Sub_metering_2 <- as.numeric(as.character(hpcfeb07$Sub_metering_2))



png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))

with(hpcfeb07, {
        plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(DateTime, Voltage, type="l", xlab="datetime")
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_Metering_1", 
                                                                          "Sub_Metering_2", "Sub_Metering_3"))
        plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
        
        
        })

dev.off()
