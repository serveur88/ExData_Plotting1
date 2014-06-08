data<-read.table('household_power_consumption.txt',sep=";",header=TRUE)

DateConvert = as.Date(strptime(data$Date, "%d/%m/%Y"))
head(DateConvert)
data$Weekday = weekdays(DateConvert)
data$Date = DateConvert

data<-subset(data,data$Date=='2007-02-01' | data$Date=='2007-02-02')

ActivePower<-as.character(data$Global_active_power)
ActivePower<-as.numeric(ActivePower)

data1<-data

data1$ActivePower<-ActivePower

DateTime<-paste(data1$Date, data1$Time)

DateTime<- strptime(DateTime, format="%Y-%m-%d %H:%M:%S")

data1$DateTime<-DateTime

par(mfrow=c(2,2))

plot(data1$DateTime,data1$ActivePower,type='l', ylab= 'Global Active Power',xlab='')

plot(data1$DateTime,data1$Voltage,type='l', ylab= 'Voltage',xlab='datetime')

plot(data1$DateTime,data1$Sub_metering_1,type='l', ylab= 'Energy sub metering',xlab='')

lines(data1$DateTime,data1$Sub_metering_2,col='Red')
lines(data1$DateTime,data1$Sub_metering_3, col='Blue')
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=0.3,col=c("black","red","blue"), cex=.5,bty='n',y.intersp=0.2, inset=-0.12,yjust=1)       

plot(data1$DateTime,data1$Global_reactive_power,type='l', ylab= 'Global_reactive_power',xlab='datetime')

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

