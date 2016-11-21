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

#Plot Panel
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(hpc, plot(Date_Time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(hpc, plot(Date_Time, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
with(hpc, plot(Date_Time, Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(hpc, points(Date_Time, Sub_metering_1, col="black", type="l"))
with(hpc, points(Date_Time, Sub_metering_2, col="red", type="l"))
with(hpc, points(Date_Time, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
with(hpc, plot(Date_Time, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()