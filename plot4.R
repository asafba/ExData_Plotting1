data <- read.table("household_power_consumption.txt", sep=";", col.names = columns , quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?", skip=66637, nrows=2880)
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# change date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2)) 

plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")   
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

dev.off()
