## R-program plot2.R
## Author : Els Schepers

## Functionality
##     Creation of a graph

    library(data.table)
    
    ##read textfile
    incomingdata <- fread("household_power_consumption.txt", sep = ";", header = T, colClasses = 'character')
   
    ##select data from the dates 2007-02-01 and 2007-02-02
    powerdata <- incomingdata[incomingdata$Date %in% c("1/2/2007","2/2/2007") ,]
    
    ##empty memory for objects that will not be used further
    rm(incomingdata)
     
    ##transform global active power to numeric
    globalActivePower <- as.numeric(powerdata$Global_active_power)
    
    ##add datetime
    datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
        
    ##draw the graph in png format
    png("plot2.png", width=480, height=480)
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()

     
  
    
   