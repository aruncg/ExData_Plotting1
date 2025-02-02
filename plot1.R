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

# Produce plot1.png
par(mfrow = c(1,1))
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()