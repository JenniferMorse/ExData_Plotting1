setwd("/home/leejj8/Documents/Coursera")

#Read in table
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")
head(data)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")

#Subset to applicable dates
data2<-data[data$Date>=as.Date("2007-02-01") & data$Date<= as.Date("2007-02-02"),]

#Plot 4
par(mfrow = c(2,2))
with(data2,{plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power",type="l")
  plot(DateTime,Voltage,ylab="Voltage",type="l")
  plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
    lines(DateTime,Sub_metering_2,col="red")
    lines(DateTime,Sub_metering_3,col="blue")
    legend("topright",col=c("black","blue","red"),lty=1,bty = "n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DateTime,Global_reactive_power,type="l")
  })