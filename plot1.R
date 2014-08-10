
# Source loaddata.R file where generic loaddata() function is defined
source("loaddata.R")

# Extract data for 2007-02-01 and 2007-02-02 using loaddata()
data<-loaddata("c:/r/ExData_Plotting1/household_power_consumption.txt")


# Plot data to png graphic device
png(filename = "plot1.png",width = 480, height=480)
hist(data$globalactivepower, col="red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
