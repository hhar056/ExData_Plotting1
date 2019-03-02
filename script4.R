
#Install packages and set working directory

install.packages("dplyr")
install.packages("tidyverse")

library("dplyr")
library("tidyverse")
library("readr")

setwd("G:/GS Value Added Team/01 GS Analytics/Exploratory Analysis Assignment 1/ExData_plotting1")


## Read Data In
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","Power Consumption.zip")
unzip("Power Consumption.zip")

epc<-read_delim("household_power_consumption.txt",delim=";", na="?")

class(as.Date("2007-02-01"))

epc<-epc %>%
  mutate(Date=as.Date(Date,"%d/%m/%Y")) %>%
  filter(Date>= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


#Get datetime data
epc<-epc %>%
  mutate(datetime=as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))

#Plot 4

#Open png device, create "plot 4.png" in the working directory
png(file="plot4.png")

#Set up the grid
par(mfrow=c(2,2))

#Create plots
with(epc, {
  plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(datetime,Voltage,type="l",ylab="Voltage")
  plot(epc$datetime,epc$Sub_metering_1,type="l",col="black", xlab="",ylab="Energy sub metering")
  lines(epc$datetime,epc$Sub_metering_2,col="red")
  lines(epc$datetime,epc$Sub_metering_3,col="blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.8)
  plot(datetime,Global_reactive_power,type="l")
}
)

#Close off the png device
dev.off()
