household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";") ##import file
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y") ## convert date

sub <- subset(household_power_consumption,household_power_consumption$Date >= as.Date("2007-02-01")) ## subset lower bound
sub <- subset(sub,sub$Date <= as.Date("2007-02-02")) ##subset upper bound

sub$Time <- as.POSIXct(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S") ## convert to combined date/time

par(mfrow = c(2, 2)) ##set global settings

plot(sub$Time,as.numeric(as.vector(sub$Global_active_power)),type = "l",xlab = "",ylab = "Global Active Power (kilowatts)") ## set upper left plot
plot(sub$Time,as.numeric(as.vector(sub$Voltage)),type = "l",xlab = "datetime",ylab = "Voltage") ## set upper right plot
plot(sub$Time,as.numeric(as.character(sub$Sub_metering_1)),xlab = "",ylab = "Energy sub metering",type = "l") ##plot sub 1
lines(sub$Time,as.numeric(as.character(sub$Sub_metering_2)),col = "red") ##plot sub 2
lines(sub$Time,as.numeric(sub$Sub_metering_3),col = "blue") ## plot sub 3
legend("topright", lty = 1, bty = "n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) ##build legend
plot(sub$Time,as.numeric(as.vector(sub$Global_reactive_power)),type = "l",xlab = "datetime",ylab = "Global_reactive_power") ## set lower right plot

dev.copy(png, file = "./plot4.png", height = 480, width = 480) ## copy to .png
dev.off() ## Close PNG device