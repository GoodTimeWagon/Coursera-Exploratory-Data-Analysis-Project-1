dataFile<-"household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(dataSubSet$Global_active_power)
dataSubSetTime<-as.POSIXct(paste(dataSubSet$Date,dataSubSet$Time),format="%d/%m/%Y %H:%M:%S")
subMetering1<-as.numeric(dataSubSet$Sub_metering_1)
subMetering2<-as.numeric(dataSubSet$Sub_metering_2)
subMetering3<-as.numeric(dataSubSet$Sub_metering_3)
globalReactivePower<-as.numeric(dataSubSet$Global_reactive_power)
voltage<-as.numeric(dataSubSet$Voltage)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(dataSubSetTime,globalActivePower,type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(dataSubSetTime,voltage,type="l",xlab="datetime",ylab="Voltage")

plot(dataSubSetTime,subMetering1,type="l",xlab="",ylab="Energy sub metering")
lines(dataSubSetTime,subMetering2,col="red")
lines(dataSubSetTime,subMetering3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(dataSubSetTime,globalReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()