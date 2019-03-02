
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


#Open png device, create "plot 1.png" in the working directory
png(file="plot1.png")

## Plot 1
hist(epc$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     xlim=c(0,8),
     ylim=c(0,1200),
     breaks=24,
     xaxt="n")
axis(1,at=c(0,2,4,6))


#Close off the png device
dev.off()

