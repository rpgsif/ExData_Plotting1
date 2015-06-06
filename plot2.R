
library("sqldf")
dat <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

times <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

X11()
plot(times, dat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, filename="plot2.png")
dev.off()
