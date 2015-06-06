household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";") ##import file
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y") ## convert date

sub <- subset(household_power_consumption,household_power_consumption$Date >= as.Date("2007-02-01")) ## subset lower bound
sub <- subset(sub,sub$Date <= as.Date("2007-02-02")) ##subset upper bound

hist(as.numeric(as.vector(sub$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = 2) ## create histogram

dev.copy(png, file = "./plot1.png", height = 480, width = 480) ## copy to .png
dev.off() ## Close PNG device