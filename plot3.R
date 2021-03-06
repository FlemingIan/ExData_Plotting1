library(lubridate)
#Read in field names, then data
DataNames<-read.table("household_power_consumption.txt", sep=";", na.strings="?", nrows=1, stringsAsFactors = FALSE)
DataNames1<-as.vector(DataNames)
t<-read.table("household_power_consumption.txt", sep=";", col.names=DataNames1, na.strings="?", skip=1, stringsAsFactors = FALSE)
#Convert date field to date format
t$Date<-as.Date(t$Date, "%d/%m/%Y")
#subset the data to specific dates
t1<-t[(t$Date>="2007-02-01" & t$Date<="2007-02-02"),]
t2<-paste(t1$Date, t1$Time, sep=" ")
datetimes<-as.POSIXct(strptime(t2, format="%Y-%m-%d %H:%M:%S"))
DataFinal<-cbind(t1, datetimes)
#Create a plot
with(DataFinal, plot(datetimes, Sub_metering_1, ylab="Energy sub metering", type="l", xlab=""))
with(DataFinal, lines(datetimes, Sub_metering_2, col="red"))
with(DataFinal, lines(datetimes, Sub_metering_3, col="blue"))
#Create a legend
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Output the plot to a file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()