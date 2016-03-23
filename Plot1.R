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

# Reduce to just the column I want
 GAP<-sub3$Global_active_power

# Make R understand what the numbers are
 K<-as.numeric(as.character(GAP))

# Make the .png file, make the hist (the easiest part :-) and turn off .png
 png("plot1.png", width=480, height=480)
  hist(K, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
 dev.off()


