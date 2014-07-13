#The following code generates the plot3.png file.

#Load the data
dataset <- read.csv("household_power_consumption.txt", sep=";")

#Subset data from 2007-02-01 and 2007-02-02
indices <- c(which(dataset[,"Date"]=="1/2/2007"), which(dataset[,"Date"]=="2/2/2007"))
dataset <- dataset[indices,]

#Join date and time columns by creating a new date/time format
date_time <- paste(dataset[,1],dataset[,2])
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

#Select data that will be plotted from dataset and convert it to numeric
active_power <- factor(dataset[,"Global_active_power"])
active_power <- as.numeric(levels(active_power))[active_power]

voltage <- factor(dataset[,"Voltage"])
voltage <- as.numeric(levels(voltage))[voltage]

sub_metering_1 <- factor(dataset[,"Sub_metering_1"])
sub_metering_1 <- as.numeric(levels(sub_metering_1))[sub_metering_1]

sub_metering_2 <- factor(dataset[,"Sub_metering_2"])
sub_metering_2 <- as.numeric(levels(sub_metering_2))[sub_metering_2]

sub_metering_3 <- factor(dataset[,"Sub_metering_3"])
sub_metering_3 <- as.numeric(levels(sub_metering_3))[sub_metering_3]

reactive_power <- factor(dataset[,"Global_reactive_power"])
reactive_power <- as.numeric(levels(reactive_power))[reactive_power]

#Plots four graphs on a 2x2 grid and saves it on plot4.png
png("plot4.png")
par(mfrow=c(2,2))
#global active power graph
plot(date_time,active_power,type="l",ylab="Global Active Power",xlab="")
#voltage graph
plot(date_time,voltage,type="l",ylab="Voltage",xlab="datetime")
#sub metering graph
plot(date_time,sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(date_time,sub_metering_2,col="orangered")
lines(date_time,sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","orangered","blue"),lty=1,lwd=1,bty="n")
#global reactive power graph
plot(date_time,reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
