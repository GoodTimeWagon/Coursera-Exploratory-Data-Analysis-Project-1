dataFile<-"household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(dataSubSet$Global_active_power)
dataSubSetTime<-as.POSIXct(paste(dataSubSet$Date,dataSubSet$Time),format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(dataSubSetTime,globalActivePower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()