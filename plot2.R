
## load data to R
rawdata <-read.csv("household_power_consumption.txt",header = TRUE ,na.strings = "?",sep = ";")

## filter data base on date 
febdata <- rawdata[rawdata$Date %in% (c('2/2/2007' , '1/2/2007')),]

##create new column with date and time combined
newdate <- paste(febdata$Date,febdata$Time)
newdate <- strptime(newdate,"%d/%m/%Y %H:%M:%S")
mydata <- cbind(febdata,newdate)

## plot  
plot( mydata$newdate , as.numeric(mydata$Global_active_power)  ,type = "l" , ylab = "Global Active Power (kilowatts)")

## copy plot to PNG file
dev.copy(png, file = "plot2.png")
## close the PNG device!
dev.off()
