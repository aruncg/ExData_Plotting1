# Read and process the data
dat <- read.csv("household_power_consumption.txt", sep=";")
dat <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
dat <- mutate(dat, DateTime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
dat <- mutate(dat, Global_active_power = as.numeric(Global_active_power))
dat <- mutate(dat, Global_reactive_power = as.numeric(Global_reactive_power))
dat <- mutate(dat, Voltage = as.numeric(Voltage))
dat <- mutate(dat, Global_intensity = as.numeric(Global_intensity))
dat <- mutate(dat, Sub_metering_1 = as.numeric(Sub_metering_1))
dat <- mutate(dat, Sub_metering_2 = as.numeric(Sub_metering_2))
dat <- mutate(dat, Sub_metering_3 = as.numeric(Sub_metering_3))

# Produce plot4.png
par(mfrow = c(2, 2))
# plot-1
n <- length(dat$DateTime)
plot(1:n, dat$Global_active_power, xaxt = "n", pch=NA, ylab = "Global Active Power", xlab= "")
lines(1:n, dat$Global_active_power)
axis(1, at = c(1, n / 2, n), labels = c("Thu", "Fri", "Sat"))
# plot-2
plot(1:n, dat$Voltage, xaxt = "n", pch=NA, ylab = "Voltage", xlab= "datetime")
lines(1:n, dat$Voltage)
axis(1, at = c(1, n / 2, n), labels = c("Thu", "Fri", "Sat"))
# plot-3
xdata <- c(1:n, 1:n, 1:n)
ydata <- c(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3)
plot(xdata, ydata, xaxt = "n", pch=NA, ylab = "Energy sub metering", xlab= "")
lines(1:n, dat$Sub_metering_1, col = "black")
lines(1:n, dat$Sub_metering_2, col = "red")
lines(1:n, dat$Sub_metering_3, col = "blue")
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
# plot-4
plot(1:n, dat$Global_reactive_power, xaxt = "n", pch=NA, ylab = "Global_reactive_power", xlab= "datetime")
lines(1:n, dat$Global_reactive_power)
axis(1, at = c(1, n / 2, n), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot4.png")
dev.off()