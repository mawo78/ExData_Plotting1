# Load data and initialize
loadAndInitialize <- function(){
    powCons <<- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", 
                        colClasses = c("character", "character", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric", "numeric"))
    
    Sys.setlocale("LC_ALL", "English")
}

#create plot2
graph2 <- function(){
    png(filename = "plot2.png", width = 480, height = 480)

    timeX <- strptime(paste(sep = ", ", powCons$Date, powCons$Time), "%d/%m/%Y, %X")
    plot(timeX, powCons$Global_active_power, 
         lty="solid",xlab="", ylab = "Global Active Power (kilowatts)", type="n")
    lines(timeX, powCons$Global_active_power)    
    dev.off()
}

loadAndInitialize()
graph2()
