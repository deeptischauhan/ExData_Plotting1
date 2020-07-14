plot1 <- function(){
        power_consumption_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                              nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
        concerned_data <- subset(power_consumption_data, Date %in% c("1/2/2007","2/2/2007"))
        concerned_data$Date <- as.Date(concerned_data$Date, format="%d/%m/%Y")
        
        #histogram of Global Active Power 
        hist(concerned_data$Global_active_power, main="Global Active Power", 
             xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
        dev.copy(png, file="plot1.png", height=480, width=480)
        dev.off()
}