#Read the file into a variable
energy.data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Subset to the specific dates
energy.data <- energy.data[energy.data$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the relevant variables
day.time <- strptime(paste(energy.data$Date, energy.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global.active.power <- energy.data$Global_active_power 

#Initialize the PNG device
png("plot2.png", width=480, height=480)

#Draw the line
plot(day.time,
     global.active.power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
    )

#Device close
dev.off()