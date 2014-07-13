#The following code generates the plot1.png file.

#Load the data
dataset <- read.csv("household_power_consumption.txt", sep=";")

#Subset data from 2007-02-01 and 2007-02-02
indices <- c(which(dataset[,"Date"]=="1/2/2007"), which(dataset[,"Date"]=="2/2/2007"))
dataset <- dataset[indices,]

#Select data that will be plotted from dataset and convert it to numeric
active_power <- factor(dataset[,"Global_active_power"])
active_power <- as.numeric(levels(active_power))[active_power]

#Plots histogram of active_power and saves it on plot1.png
png("plot1.png")
hist(active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200),col="orangered")
dev.off()
