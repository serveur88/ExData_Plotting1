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

plot(data1$DateTime,data1$Sub_metering_1,type='l', ylab= 'Energy sub metering',xlab='')

lines(data1$DateTime,data1$Sub_metering_2,col='Red')
lines(data1$DateTime,data1$Sub_metering_3, col='Blue')

legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(0.5,0.5,0.5),col=c("black","red","blue"), cex=0.75)       
         
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
