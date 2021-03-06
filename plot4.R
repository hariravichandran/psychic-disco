##Fourth Plot - 2 by 2 plot

#D stores the data table
D <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")

D1 <- D
D1$Date <- as.Date(D1$Date, format = '%d/%m/%Y') #Convert to Date Format

day1 <- as.Date("2007-02-01", format = "%Y-%m-%d") #Two days we are interested in
day2 <- as.Date("2007-02-02", format = "%Y-%m-%d")

D2 <- subset(D1, Date == day1 | Date == day2) #Subset by two days

rm(D, D1) #Remove Variables to clear memory

DateTime = paste(D2$Date, D2$Time) #Creates a DateTime Variable for the Plot
DateTimeP = as.POSIXlt(DateTime, format = "%Y-%m-%d %H:%M:%S")

D3 <- D2 #'D3' contains table with DateTime
D3$DateTime <- DateTimeP
D3 <- D3[c(10,3,4,5,6,7,8,9)] #Only required rows are added

png("plot4.png", width=480, height=480) #PNG file for saving the image
par(mfcol = c(2,2)) #Splits up into a 2 by 2 grid

#Plot A
plot(D3$DateTime, D3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot B
plot(D3$DateTime, D3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(D3$DateTime, D3$Sub_metering_2, col = "red")
lines(D3$DateTime, D3$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1))

#Plot C
plot(D3$DateTime, D3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot D
plot(D3$DateTime, D3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()