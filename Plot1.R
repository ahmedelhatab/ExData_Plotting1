library(readr)
library(lubridate)
library(tidyr)
library(dplyr)
data <- read.delim2(file="./data.txt",sep=";",
                    skip = 66637,nrows = 2879,
                    col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    colClasses = c(date,time,numeric,numberic,numeric,numeric,numeric,numeric,numeric))

png(file="./Plot1.png",width =480 ,height = 480)
hist( as.numeric(df$Global_active_power),col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power")
dev.off()