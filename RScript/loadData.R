setwd("E:\\courses\\exploratory-data-analysis")
if(require('sqldf') == FALSE){
	install.packages('sqldf')
	require('sqldf')
}
par(mfrow = c(1, 1))
#load the required days
houseData = read.csv.sql("household_power_consumption.txt", sep=';',sql = "select * from file where Date == '1/2/2007' or date == '2/2/2007' ")
