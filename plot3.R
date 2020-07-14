plot3 <- function(){
        power_consumption_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                              nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
        concerned_data <- subset(power_consumption_data, Date %in% c("1/2/2007","2/2/2007"))
        concerned_data$Date <- as.Date(concerned_data$Date, format="%d/%m/%Y")
        
        datetime <- paste(as.Date(concerned_data$Date), concerned_data$Time)
        concerned_data$Datetime <- as.POSIXct(datetime)
        
        with(concerned_data, {
                plot(Sub_metering_1~Datetime, type="l",
                     ylab="Global Active Power (kilowatts)", xlab="Days")
                lines(Sub_metering_2~Datetime,col='Red')
                lines(Sub_metering_3~Datetime,col='Blue')
        })
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.copy(png, file="plot3.png", height=480, width=480)
        dev.off()
}