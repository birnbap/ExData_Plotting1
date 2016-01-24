
source('loadData.R')
#extract the day in the week
houseData$Day =  weekdays(strptime(houseData$Date, format="%d/%m/%Y"))
plot(houseData$Global_active_power,ylab="Global Active Power (kilowatts)",type='l',xlab='', xaxt='n')
#find the first observation per day

t.first <- match(unique(houseData$Day), houseData$Day)
# add the days of the week + Saturday for the las observation
axis(1, c(t.first,length(houseData$Day)),c(lab=houseData$Day[t.first],'Saturday'))
dev.copy(png,'plot2.png')
dev.off()
