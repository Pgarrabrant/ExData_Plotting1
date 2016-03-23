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

# make the .pdf plot
png("plot2.png", width=480, height=480)
plot(Xaxis, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#shutoff .pdf
dev.off()

