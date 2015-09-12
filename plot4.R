# plot4

# Read in data
p <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")

# Prep data
p$Date <- as.Date(p$Date, '%d/%m/%Y')
p <- p[p$Date == '2007-02-01' | p$Date == '2007-02-02',]
p$GAP <- as.numeric(levels(p$Global_active_power))[p$Global_active_power]
p$SM1 <- as.numeric(levels(p$Sub_metering_1))[p$Sub_metering_1]
p$SM2 <- as.numeric(levels(p$Sub_metering_2))[p$Sub_metering_2]
p$Voltage <- as.numeric(levels(p$Voltage))[p$Voltage]
p$Global_reactive_power <- as.numeric(levels(p$Global_reactive_power))[p$Global_reactive_power]

# Make charts
png(filename="plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

plot(p$GAP,type="l", axes=F, , xlab="", ylab="Global Active Power")
box()
axis(1, at = c(0,1500,2900), labels = c('Thu', 'Fri', 'Sat'))
axis(2)

plot(p$Voltage,type="l", axes=F, , xlab="datetime", ylab="Voltage")
box()
axis(1, at = c(0,1500,2900), labels = c('Thu', 'Fri', 'Sat'))
axis(2)

plot(p$SM1,type="l", axes=F, , xlab="", ylab="Energy sub metering")
lines(p$SM2, col = "Red")
lines(p$Sub_metering_3, col = "Blue")
box()
axis(1, at = c(0,1450,2900), labels = c('Thu', 'Fri', 'Sat'))
axis(2)
legend("topright", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

plot(p$Global_reactive_power,type="l", axes=F, , xlab="datetime", ylab="Global_reactive_power")
box()
axis(1, at = c(0,1500,2900), labels = c('Thu', 'Fri', 'Sat'))
axis(2)

dev.off()