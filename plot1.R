# Load data
data <- read.table("household_power_consumption.txt",header =TRUE, sep=";")

# Filter the data to the two dates mentioned 
Consumptiondata<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

png("plot2.png", width=480, height=480)

# Create Histogram
hist(as.numeric(as.character(Consumptiondata$Global_active_power)), col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()
