# Generic function to load data from household_power_consumption.txt file
# Argument : Valid filepath to electric data. 
# for e.g. "c:/r/ExData_Plotting1/household_power_consumption.txt"
#
# This function skips first 66637 records and reads next 2880 records because
# We need to load data only for 2007-02-01 and 2007-02-02
#


loaddata<-function(filename) {
        
        # Can't read header as we are skipping first 66637 rows
        # Header will be set later using names()
        data<-read.table(file = filename,header = FALSE, 
                         sep = ";", skip = 66637,nrows = 2880,na.strings = "?", 
                         dec=".", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        
        # Concatnate Date and Timestamp columns. 
        # This will represented in ""POSIXlt" and POSIXct objects
        dttime <-strptime(paste0(data$V1,data$V2), "%d/%m/%Y%H:%M:%S")
        
        # Drop Date and Timestamp columns from data frame
        data$V1<-NULL
        data$V2<-NULL
        
        # Add concatnated Date Timestamp variable to data frame
        data<-cbind(dttime,data)
        
        # Assign names to data frame
        names(data)<-c("datetime","globalactivepower","globalreactivepower","voltage","globalintensity","submetering1","submetering2","submetering3")
        
        data
}