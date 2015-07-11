

## The data is extracted to the working directory as downloaded from  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep =";", stringsAsFactors=FALSE)

## subset on the data to get the dates we want
data <- fulldata[fulldata$Date=="2/2/2007" | fulldata$Date=="1/2/2007" ,]

library(lubridate)
## add a datetme variable to the data
data$Datetime <- dmy(data$Date) + hms(data$Time)

##open file
png(file = "plot4.png")


##create plot [note: I didn't include the "datetime" labels like in the example because I think they look strange :) ]
par(mfrow= c(2,2))
plot(data$Datetime,data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data$Datetime,data$Voltage, type="l", xlab="", ylab="Voltage")
plot(data$Datetime,data$Sub_metering_1, type="n", xlab="", ylab="Energy sub Metering")
    points(data$Datetime,data$Sub_metering_1, type="l", col= "black")
    points(data$Datetime,data$Sub_metering_2, type="l", col= "red")
    points(data$Datetime,data$Sub_metering_3, type="l", col= "blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(data$Datetime,data$Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power")

#close connection to file
dev.off()

##Note I would have changed the margins on this one as it's a bit spacey but my laptop is about to run out of battery so I don't have time :/ :(
