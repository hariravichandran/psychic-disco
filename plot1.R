##First Plot - Histogram of Global Active Power

#D stores the data table
D <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")

D1 <- D
D1$Date <- as.Date(D1$Date, format = '%d/%m/%Y') #Convert to Date Format

day1 <- as.Date("2007-02-01", format = "%Y-%m-%d") #Two days we are interested in
day2 <- as.Date("2007-02-02", format = "%Y-%m-%d")

D2 <- subset(D1, Date == day1 | Date == day2) #Subset by two days

write.csv(D2, file = "D2.csv")

#rm(D, D1) #Remove Variables to clear memory

png("plot1.png", width=480, height=480) #PNG file for saving the image

#Makes the Histogram
hist(D2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()