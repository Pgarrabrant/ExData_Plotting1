library(dplyr)
# Read data file into Data
 Data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
# Check it loaded
head(Data)
# Can't figure out how to pull just those two dates, will pull each and paste them together
sub <-filter(Data, Date == "1/2/2007")

# Check it worked
dim(sub)

# Get the Feb 2nd data
 sub2 <-filter(Data, Date == "2/2/2007")

#Check that worked
dim(sub2)

# Paste them together into what I'll call sub3
 sub3<- rbind(sub, sub2)

#Check it worked
dim(sub3)

# Get x axis to understand it is days and time
Xaxis <- strptime(paste(sub3$Date, sub3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Get Global Active Power for y axis
GAP <- as.numeric(as.character(sub3$Global_active_power))


#Open .pdf
png("plot4.png", width=480, height=480)

# make remaining items for graphs
SM1 <- as.numeric (as.character(sub3$Sub_metering_1))
SM2 <- as.numeric (as.character(sub3$Sub_metering_2))
SM3 <- as.numeric (as.character(sub3$Sub_metering_3))
GRP <- as.numeric(as.character(sub3$Global_reactive_power))
Volt <- as.numeric (as.character (sub3$Voltage))

#set up 4 squares for the graphs
par (mfrow = c(2,2))

# Top Left
plot(Xaxis, GAP, type="l", xlab="", ylab="Global Active Power")

# Top RIght
plot(Xaxis, Volt, type="l", xlab="datetime", ylab="Voltage")

#Bottom Left
plot(Xaxis, SM1,  type="l", ylab="Energy Submetering", xlab="")
lines(Xaxis, SM2,  type="l", col = "red")
lines(Xaxis, SM3,  type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1)

#Bottom Right
plot(Xaxis, GRP, type="l", xlab="", ylab="Global_rective_power")

dev.off()
