#read the data from current working directory
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#convert date from string to date
data$Time <- strptime(paste(data$Date, " ",data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date , "%d/%m/%Y")

# reduce data to two specific days
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#switch language setting
Sys.setlocale("LC_TIME", "English")

# create Plot 1
png(filename="plot1.png")

# adjust font size to make it look similar to example
par(cex=0.8)

hist(data$Global_active_power, col ="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()