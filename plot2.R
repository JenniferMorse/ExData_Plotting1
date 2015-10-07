setwd("/home/leejj8/Documents/Coursera")

#Read in table
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")
head(data)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")

#Subset to applicable dates
data2<-data[data$Date>=as.Date("2007-02-01") & data$Date<= as.Date("2007-02-02"),]

#Plot 2
with(data2,plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
