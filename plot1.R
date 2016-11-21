#read data
hpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ';')
#subset data from first two days of february 2007
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
#Convert types
hpc$Date_Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))

#Plot Global active power
png("plot1.png", width=480, height=480)
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()