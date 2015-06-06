
library("sqldf")
dat <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

times <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

X11()
par(mfcol=c(2, 2))

### left up
plot(times, dat$Global_active_power, type="l", ylab="Global Active Power", xlab="")
###

### left-down
plot(times, dat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(times, dat$Sub_metering_2, col="red")
lines(times, dat$Sub_metering_3, col="blue")

names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
legend("topright", names, lty=1, col=c("black", "red", "blue"), bty="n")
###

### right up
plot(times, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")
###

### right down
plot(times, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
###

Sys.sleep(5)

dev.copy(png, filename="plot4.png")
dev.off()
