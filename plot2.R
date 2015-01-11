#Assume:
#1. necessary steps have been taken to download & unzip the household_power_consumption.txt data
#2. necessary libraries (e.g. sqldf) have been installed
#3. working directory has been set correctly
library(sqldf)
data<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <-paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")
plot(data$DateTime,data$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
dev.copy(png,"plot2.png")
dev.off() 