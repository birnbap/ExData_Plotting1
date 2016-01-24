source('loadData.R')
#to show 4 plot side by side
par(mfrow = c(2, 2))
#extract the day in the week
houseData$Day =  weekdays(strptime(houseData$Date, format="%d/%m/%Y"))
plot(houseData$Global_active_power,ylab="Global Active Power (kilowatts)",type='l',xlab='', xaxt='n')
#find the first observation per day
t.first <- match(unique(houseData$Day), houseData$Day)
# add the days of the week + Saturday for the las observation
axis(1, c(t.first,length(houseData$Day)),c(lab=houseData$Day[t.first],'Saturday'))

plot(houseData$Voltage,ylab="Voltage",type='l',xlab='datetime', xaxt='n')
t.first <- match(unique(houseData$Day), houseData$Day)
axis(1, c(t.first,length(houseData$Day)),c(lab=houseData$Day[t.first],'Saturday'))

plot(houseData$Sub_metering_1,ylab="Energ Sub Metring",type='l',xlab='', xaxt='n')
lines(houseData$Sub_metering_2,type='l',col='red')
lines(houseData$Sub_metering_3,type='l',col='blue')
axis(1, c(t.first,length(houseData$Day)),c(lab=houseData$Day[t.first],'Saturday'))
legend('topright',c("Sub_meter_1","Sub_meter_2","Sub_meter_3"),lty=c(1,1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),density=NULL,bty='n')


plot(houseData$Global_reactive_power,ylab="Global_reactive_power",type='l',xlab='datetime', xaxt='n')
t.first <- match(unique(houseData$Day), houseData$Day)
axis(1, c(t.first,length(houseData$Day)),c(lab=houseData$Day[t.first],'Saturday'))
dev.copy(png,'plot4.png')
dev.off()

