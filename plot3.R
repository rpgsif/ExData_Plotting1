
library("sqldf")
dat <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

times <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

X11()
plot(times, dat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(times, dat$Sub_metering_2, col="red")
lines(times, dat$Sub_metering_3, col="blue")

names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 

legend("topright", names, lty=1, col=c("black", "red", "blue"))

#Sys.sleep(5)

dev.copy(png, filename="plot3.png")
dev.off()
