

## The data is extracted to the working directory as downloaded from  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep =";", stringsAsFactors=FALSE)

## subset on the data to get the dates we want
data <- fulldata[fulldata$Date=="2/2/2007" | fulldata$Date=="1/2/2007" ,]

library(lubridate)
## add a datetme variable to the data
data$Datetime <- dmy(data$Date) + hms(data$Time)

##open file
png(file = "plot3.png")

##create plot
plot(data$Datetime,data$Sub_metering_1, type="n", xlab="", ylab="Energy sub Metering")
points(data$Datetime,data$Sub_metering_1, type="l", col= "black")
points(data$Datetime,data$Sub_metering_2, type="l", col= "red")
points(data$Datetime,data$Sub_metering_3, type="l", col= "blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#close connection to file
dev.off()
