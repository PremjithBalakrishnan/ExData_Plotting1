#Read the file into a variable
energy.data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Subset to the specific dates
energy.data <- energy.data[energy.data$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the relevant variables
day.time <- strptime(paste(energy.data$Date, energy.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub.metering.1 <- energy.data$Sub_metering_1
sub.metering.2 <- energy.data$Sub_metering_2 
sub.metering.3 <- energy.data$Sub_metering_3 

#Initialize the PNG device
png("plot3.png", width=480, height=480)

#Draw the first line
plot(day.time,
     sub.metering.1, 
     type="l",
     xlab="",
     ylab="Energy sub metering"
    )

#Add the second line
lines(day.time,
      sub.metering.2, 
      type="l",
      col="red"
)

#Add the third line
lines(day.time,
      sub.metering.3, 
      type="l",
      col="blue"
)

#Add the legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lty=1
)

#Device close
dev.off()

