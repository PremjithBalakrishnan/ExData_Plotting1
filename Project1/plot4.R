#Read the file into a variable
energy.data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Subset to the specific dates
energy.data <- energy.data[energy.data$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the relevant variables
day.time <- strptime(paste(energy.data$Date, energy.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global.active.power <- energy.data$Global_active_power
global.reactive.power <- energy.data$Global_reactive_power
sub.metering.1 <- energy.data$Sub_metering_1
sub.metering.2 <- energy.data$Sub_metering_2 
sub.metering.3 <- energy.data$Sub_metering_3 
voltage <- energy.data$Voltage

#Initialize the PNG device
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#Draw the first plot
plot(day.time,
     global.active.power, 
     type="l",
     xlab="",
     ylab="Global Active Power"
)

#Add the second plot
plot(day.time,
     voltage, 
     type="l",
     xlab="datetime",
     ylab="Voltage"
)

#Add the third plot
plot(day.time,
     sub.metering.1, 
     type="l",
     xlab="",
     ylab="Energy sub metering"
    )

#Add the second line to the plot
lines(day.time,
      sub.metering.2, 
      type="l",
      col="red"
)

#Add the third line to the plot
lines(day.time,
      sub.metering.3, 
      type="l",
      col="blue"
)

#Add the legend to the plot
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lty=1
)

#Add the fourth plot
plot(day.time,
     global.reactive.power, 
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
)

#Device close
dev.off()

