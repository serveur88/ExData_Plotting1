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

plot(data1$DateTime,data1$ActivePower,type='l', ylab= 'Global Active Power (Kilowatts)',xlab='')

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

