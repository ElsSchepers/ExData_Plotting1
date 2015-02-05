## R-program plot3.R
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
     
    ##transform to numeric
    globalActivePower <- as.numeric(powerdata$Global_active_power)
    globalReactivePower <- as.numeric(powerdata$Global_reactive_power)
    metering1 <- as.numeric(powerdata$Sub_metering_1)
    metering2 <- as.numeric(powerdata$Sub_metering_2)
    metering3 <- as.numeric(powerdata$Sub_metering_3)
    volt <- as.numeric(powerdata$Voltage)
    
    ##add datetime
    datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    
   
    ##draw the graphs in png format
    
    png("plot4.png", width=480, height=480)
    par(mfrow = c(2, 2)) 
        
        ##graph1
        plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
    
        ##graph2
        plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
    
        ##graph3
        plot(datetime, metering1, type="l", ylab="Energy Submetering", xlab="")
        lines(datetime, metering2, type="l", col="red")
        lines(datetime, metering3, type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

        ##graph4
        plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
    
    dev.off()

     
  
    
   