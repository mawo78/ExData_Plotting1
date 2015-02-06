# Load data and initialize
loadAndInitialize <- function(){
    powCons <<- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", 
                        colClasses = c("character", "character", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric", "numeric"))

    #set locale to get the right day names
    Sys.setlocale("LC_ALL", "English")

    timeX <<- strptime(paste(sep = ", ", powCons$Date, powCons$Time), "%d/%m/%Y, %X")
    
    par(mfrow = c(2, 2))
}

#create plot2
graph2 <- function(){
    plot(timeX, powCons$Global_active_power, 
         lty="solid",xlab="", ylab = "Global Active Power", type="n")
    lines(timeX, powCons$Global_active_power)    
}

#create plot5
graph5 <- function(){
    plot(timeX, powCons$Voltage, 
         lty="solid",xlab="datetime", ylab = "Voltage", type="n")
    lines(timeX, powCons$Voltage)    
}

#create plot6
graph6 <- function(){
    plot(timeX, powCons$Global_reactive_power, 
         lty="solid",xlab="datetime", ylab = "Voltage", type="n")
    lines(timeX, powCons$Global_reactive_power)    
}

#create plot4
graph4 <- function(){
    plot(timeX, powCons$Sub_metering_1, 
         lty="solid",xlab="", ylab = "Energy sub metering", type="n")
    lines(timeX, powCons$Sub_metering_3, col = "blue")    
    lines(timeX, powCons$Sub_metering_1, col = "black")    
    lines(timeX, powCons$Sub_metering_2, col = "red")    
    legend("topright",
           col = c("blue","black", "red"), 
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
           lty=c(1, 1, 1), bty="n")
    
}

png(filename = "plot4.png", width = 480, height = 480)
loadAndInitialize()
graph2()
graph5()
graph4()
graph6()
dev.off()
