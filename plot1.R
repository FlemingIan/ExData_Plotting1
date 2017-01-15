#Read in field names, then data
DataNames<-read.table("household_power_consumption.txt", sep=";", na.strings="?", nrows=1, stringsAsFactors = FALSE)
DataNames1<-as.vector(DataNames)
t<-read.table("household_power_consumption.txt", sep=";", col.names=DataNames1, na.strings="?", skip=1, stringsAsFactors = FALSE)
#Convert date field to date format
t$Date<-as.Date(t$Date, "%d/%m/%Y")
#subset the data to specific dates
t1<-t[(t$Date>="2007-02-01" & t$Date<="2007-02-02"),]
#Create a plot
hist(t1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Output the plot to a file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()