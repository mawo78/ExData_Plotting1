# Load data and initialize
loadAndInitialize <- function(){
    powCons <<- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", 
                        colClasses = c("character", "character", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric", "numeric"))
    
    Sys.setlocale("LC_ALL", "English")
}

#create plot3
graph3 <- function(){
    png(filename = "plot3.png", width = 480, height = 480)

    timeX <- strptime(paste(sep = ", ", powCons$Date, powCons$Time), "%d/%m/%Y, %X")
    plot(timeX, powCons$Sub_metering_1, 
         lty="solid",xlab="", ylab = "Energy sub metering", type="n")
    lines(timeX, powCons$Sub_metering_3, col = "blue")    
    lines(timeX, powCons$Sub_metering_1, col = "black")    
    lines(timeX, powCons$Sub_metering_2, col = "red")    
    legend("topright",
           col = c("blue","black", "red"), 
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
           lty=c(1, 1, 1))
    
    dev.off()
}

loadAndInitialize()
graph3()
