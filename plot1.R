# Load data and initialize
loadAndInitialize <- function(){
    powCons <<- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", 
                        colClasses = c("character", "character", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric", "numeric"))
    
}

#create plot1
graph1 <- function(){
    png(filename = "plot1.png", width = 480, height = 480)

    hist(powCons$Global_active_power, col="red" ,
         xlab = "Global Active Power (kilowatts)", 
         main = "Global Active Power")
    
    dev.off()
}

loadAndInitialize()
graph1()
