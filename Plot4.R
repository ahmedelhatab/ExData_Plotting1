library(readr)
library(lubridate)
library(tidyr)
library(dplyr)
data <- read.delim2(file="./data.txt",sep=";",
                    skip = 66637,nrows = 2879,
                    col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))


date <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

png(filename="./plot4.png",width = 480,height=480)
par(mfrow=c(2,2))
plot(date,as.numeric(data$Global_active_power),xlab=" ",ylab="Global Active Power (Kilowatts)",type="l")
plot(date,as.numeric(data$Voltage),xlab="datetime",ylab="voltage",type="l")
plot(date,as.numeric(data$Sub_metering_1),type="l",ylab="Energy Submetering",xlab=" ")
points(date,as.numeric(data$Sub_metering_3),col="blue",type="l")
points(date,as.numeric(data$Sub_metering_2),col="red",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty =1 ,lwd = 3)
plot(date,as.numeric(data$Global_reactive_power),xlab="datetime",type="l",ylab="Global_reactive_power")
dev.off()