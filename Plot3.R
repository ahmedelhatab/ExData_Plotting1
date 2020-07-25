library(readr)
library(lubridate)
library(tidyr)
library(dplyr)
data <- read.delim2(file="./data.txt",sep=";",
                    skip = 66637,nrows = 2879,
                    col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                   

date <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
png(filename = "./Plot3.png",height = 480,width = 480)
plot(date,as.numeric(data$Sub_metering_1),type="l",ylab="Energy Submetering",xlab=" ")
points(date,as.numeric(data$Sub_metering_3),col="blue",type="l")
points(date,as.numeric(data$Sub_metering_2),col="red",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty =1 ,lwd = 3)
dev.off()