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

#Plot 2

#Get datetime data
epc<-epc %>%
  mutate(datetime=as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))

#Open png device, create "plot 2.png" in the working directory
png(file="plot2.png")

#Create plot
plot(epc$datetime,epc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")


#Close off the png device
dev.off()
