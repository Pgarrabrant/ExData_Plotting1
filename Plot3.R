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
png("plot3.png", width=480, height=480)

#Make and plot first line
SM1 <- as.numeric (as.character(sub3$Sub_metering_1))
plot(Xaxis, SM1,  type="l", ylab="Energy Submetering", xlab="")

#Make and plot second red line
SM2 <- as.numeric (as.character(sub3$Sub_metering_2))
lines(Xaxis, SM2,  type="l", col = "red")

#Make and plot third line (blue)
SM3 <- as.numeric (as.character(sub3$Sub_metering_3))
lines(Xaxis, SM3,  type="l", col = "blue")

# Make legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1)
dev.off()
