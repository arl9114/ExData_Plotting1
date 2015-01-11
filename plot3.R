#Assume:
#1. necessary steps have been taken to download & unzip the household_power_consumption.txt data
#2. necessary libraries (e.g. sqldf) have been installed
#3. working directory has been set correctly
library(sqldf)
data<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <-paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")
png(file="plot3.png")
plot(data$DateTime,data$Sub_metering_1,type="l", ylab="Global Active Power (killowatts)", xlab= "")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() 