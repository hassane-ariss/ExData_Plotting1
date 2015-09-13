
## load data to R
rawdata <-read.csv("household_power_consumption.txt",header = TRUE ,na.strings = "?",sep = ";")

## filter data base on date 
febdata <- rawdata[rawdata$Date %in% (c('2/2/2007' , '1/2/2007')),]

##create new column with date and time combined
newdate <- paste(febdata$Date,febdata$Time)
newdate <- strptime(newdate,"%d/%m/%Y %H:%M:%S")
mydata <- cbind(febdata,newdate)

## plot  
par(mfrow=c(1,1) , mar=c(3,5,2,2), cex=0.75)
plot( mydata$newdate , mydata$Sub_metering_1 , ylab = "Energy Sub metering" , type="n")
points(mydata$newdate,mydata$Sub_metering_1,col="Black",type = "l")
points(mydata$newdate,mydata$Sub_metering_2,col="Red" , type = "l")
points(mydata$newdate,mydata$Sub_metering_3,col="Blue" , type = "l")
legend("topright" ,lty = "solid" , col = c("Black","Red","Blue") , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## copy plot to PNG file
dev.copy(png, file = "plot3.png")
## close the PNG device!
dev.off()

