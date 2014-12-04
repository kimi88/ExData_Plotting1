plot3 <- function(){
	data <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?");	
	range <- c(as.Date("1/02/2007",format = "%d/%m/%Y"),as.Date("2/02/2007",format = "%d/%m/%Y"))
	data_filter <- data[as.Date(data$Date,format = "%d/%m/%Y") %in% range,]
	
	x<- strptime(paste(data_filter$Date,data_filter$Time),"%d/%m/%Y %H:%M:%S")
	y1=data_filter$Sub_metering_1
	y2=data_filter$Sub_metering_2
	y3=data_filter$Sub_metering_3

	png("plot3.png",width = 480, height = 480)
	plot(x,y1,xlab = "", ylab= "Energy sub metering",type="n")
	lines(x,y1)
	lines(x,y2,col="red")
	lines(x,y3,col="blue")
	legend("topright", col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
	dev.off()
}