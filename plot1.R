## R-program plot1.R
## Author : Els Schepers

## Functionality
##     Creation of a histogram
    

    library(data.table)

    ##read textfile
    incomingdata <- fread("household_power_consumption.txt", sep = ";", header = T, colClasses = 'character')

    ##select data from the dates 2007-02-01 and 2007-02-02
    powerdata <- incomingdata[incomingdata$Date %in% c("1/2/2007","2/2/2007") ,]
    
    
    ##empty memory for objects that will not be used further
    rm(incomingdata)
     
    ##transform global active power to numeric
    globalActivePower <- as.numeric(powerdata$Global_active_power)
     
    ##draw the histogram in png format
    png("plot1.png", width=480, height=480)
    hist(globalActivePower, col="red", main="Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    dev.off()  

     
  
    
   