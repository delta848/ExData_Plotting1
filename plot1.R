

## The data is extracted to the working directory as downloaded from  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep =";", stringsAsFactors=FALSE)

## subset on the data to get the dates we want (I didn't convert to date as it didn't seem necessary)

data <- fulldata[fulldata$Date=="2/2/2007" | fulldata$Date=="1/2/2007" ,]

##open file
png(file = "plot1.png")

##create plot
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close connection to file
dev.off()
