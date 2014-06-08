data<-read.table('household_power_consumption.txt',sep=";",header=TRUE)

DateConvert = as.Date(strptime(data$Date, "%d/%m/%Y"))
head(DateConvert)
data$Weekday = weekdays(DateConvert)
data$Date = DateConvert

data<-subset(data,data$Date=='2007-02-01' | data$Date=='2007-02-02')

ActivePower<-as.character(data$Global_active_power)
ActivePower<-as.numeric(ActivePower)

par(mar=c(4,4,4,4))

hist(ActivePower,col='Red',main="Global Active Power",xlab="Global Active Power (Kilowatts)",cex.lab=0.75, cex.axis=0.75, cex.main=0.75)

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
