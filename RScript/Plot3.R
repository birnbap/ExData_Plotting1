
source('loadData.R')

#extract the day in the week
houseData$Day =  weekdays(strptime(houseData$Date, format="%d/%m/%Y"))
#find the first observation per day

t.first <- match(unique(houseData$Day), houseData$Day)
plot(houseData$Sub_metering_1,ylab="Energ Sub Metring",type='l',xlab='', xaxt='n')
#add more lines 
lines(houseData$Sub_metering_2,type='l',col='red')
lines(houseData$Sub_metering_3,type='l',col='blue')
# add the days of the week + Saturday for the las observation
axis(1, c(t.first,length(houseData$Day)),c(lab=houseData$Day[t.first],'Saturday'))
legend(2000,35.5,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))
dev.copy(png,'plot3.png')
dev.off()
