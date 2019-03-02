
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

#Plot 3

#Open png device, create "plot 3.png" in the working directory
png(file="plot3.png")

#Create plot
with(epc,{
  plot(datetime,Sub_metering_1,type="l",col="black", xlab="",ylab="Energy sub metering")
  lines(datetime,Sub_metering_2,col="red")
  lines(datetime,Sub_metering_3,col="blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.8)
})

#Close off the png device
dev.off()
