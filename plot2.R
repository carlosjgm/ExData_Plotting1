#The following code generates the plot2.png file.

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

#Plots the global active power graph and saves it on plot2.png
png("plot2.png")
plot(date_time,active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
