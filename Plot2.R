library(readr)
library(lubridate)
library(tidyr)
library(dplyr)
data <- read.delim2(file="./data.txt",sep=";",
                    skip = 66637,nrows = 2879,
                    col.names = c("Date",
                                  "Time",
                                  "Global_active_power",
                                  "Global_reactive_power"
                                  ,"Voltage","Global_intensity"
                                  ,"Sub_metering_1",
                                  "Sub_metering_2"
                                  ,"Sub_metering_3"))

date <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
png(filename = "./Plot2.png",width = 480,height = 480)
plot(date,as.numeric(data$Global_active_power),xlab=" ",ylab="Global Active Power (Kilowatts)",type="l")
dev.off()