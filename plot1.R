hpcfeb07 <- subset(read.table("household_power_consumption.txt", header=T, sep=";"), 
                   Date == "2/1/2007" | Date == "2/2/2007", na.strings = ("?"))

hpcfeb07$Global_active_power <- as.numeric(as.character(hpcfeb07$Global_active_power))

png(filename = "plot1.png", width=480, height=480)

with(hpcfeb07, hist(Global_active_power, main = "Global Active Power", col = "red", 
                    xlab="Global Active Power(kilowatts)"))

dev.off()