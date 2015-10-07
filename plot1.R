setwd("/home/leejj8/Documents/Coursera")

#Read in table
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")
head(data)
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")
data$Time<-strptime(as.character(data$Time),"%H:%M:%S")

#Subset to applicable dates
data2<-data[data$Date>=as.Date("2007-02-01") & data$Date<= as.Date("2007-02-02"),]

#Plot 1
with(data2,hist(Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200),col="red"))

