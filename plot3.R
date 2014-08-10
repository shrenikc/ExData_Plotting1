
# Source loaddata.R file where generic loaddata() function is defined
source("loaddata.R")

# Extract data for 2007-02-01 and 2007-02-02 using loaddata()
data<-loaddata("c:/r/ExData_Plotting1/household_power_consumption.txt")


# Plot data to png graphic device
png(filename = "plot3.png",width = 480, height=480)


plot(data$datetime, data$submetering1, type="n", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$submetering1, col="black")
lines(data$datetime, data$submetering2, col="red")
lines(data$datetime, data$submetering3, col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
