#read the data from current working directory
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#convert date from string to date
data$Time <- strptime(paste(data$Date, " ",data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date , "%d/%m/%Y")

# reduce data to two specific days
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#switch language setting
Sys.setlocale("LC_TIME", "English")


# create Plot 4
png(filename="plot4.png")

par(mfrow=c(2,2), mar=c(4,4,2,2), cex=0.6)

plot(data$Time,data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data$Time,data$Voltage, type = "l", xlab="datetime", ylab="Voltage")

plot(data$Time,data$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_2, col="red")
lines(data$Time,data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c(1,2,3), lty=1)

plot(data$Time,data$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.off()