
## load data to R
rawdata <-read.csv("household_power_consumption.txt",header = TRUE ,na.strings = "?",sep = ";")

## filter data base on date 
febdata <- rawdata[rawdata$Date %in% (c('2/2/2007' , '1/2/2007')),]

## plot histogram 
hist( as.numeric(febdata$Global_active_power) , xlab = "Global Active Power (kilowatts)", main = "Global Active Power" , col="Red")

## copy plot to PNG file
dev.copy(png, file = "plot1.png")
## close the PNG device!
dev.off()
