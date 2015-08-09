#Read the file into a variable
energy.data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Subset to the specific dates
energy.data <- energy.data[energy.data$Date %in% c("1/2/2007","2/2/2007") ,]

#Initialize the PNG device
png("plot1.png", width=480, height=480)

#Draw the histogram
hist(energy.data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)"
)

#Device close
dev.off()