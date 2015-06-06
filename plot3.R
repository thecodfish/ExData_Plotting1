household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";") ##import file
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y") ## convert date

sub <- subset(household_power_consumption,household_power_consumption$Date >= as.Date("2007-02-01")) ## subset lower bound
sub <- subset(sub,sub$Date <= as.Date("2007-02-02")) ##subset upper bound

sub$Time <- as.POSIXct(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S") ## convert to combined date/time


plot(sub$Time,as.numeric(as.character(sub$Sub_metering_1)),xlab = "",ylab = "Energy sub metering",type = "l") ##plot sub 1
lines(sub$Time,as.numeric(as.character(sub$Sub_metering_2)),col = "red") ##plot sub 2
lines(sub$Time,as.numeric(sub$Sub_metering_3),col = "blue") ## plot sub 3
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) ##build legend

dev.copy(png, file = "./plot3.png", height = 480, width = 480) ## copy to .png
dev.off() ## Close PNG device