household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";") ##import file
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y") ## convert date

sub <- subset(household_power_consumption,household_power_consumption$Date >= as.Date("2007-02-01")) ## subset lower bound
sub <- subset(sub,sub$Date <= as.Date("2007-02-02")) ##subset upper bound

sub$Time <- as.POSIXct(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S") ## convert to combined date/time
plot(sub$Time,as.numeric(as.vector(sub$Global_active_power)),type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "./plot2.png", height = 480, width = 480) ## copy to .png
dev.off() ## Close PNG device