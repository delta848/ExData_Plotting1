

## The data is extracted to the working directory as downloaded from  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep =";", stringsAsFactors=FALSE)

## subset on the data to get the dates we want
data <- fulldata[fulldata$Date=="2/2/2007" | fulldata$Date=="1/2/2007" ,]

library(lubridate)
## add a datetme variable to the data
data$Datetime <- dmy(data$Date) + hms(data$Time)

##open file
png(file = "plot2.png")

##create plot
plot(data$Datetime,data$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

#close connection to file
dev.off()
