plot4 <- function(){
	data <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?");	
	range <- c(as.Date("1/02/2007",format = "%d/%m/%Y"),as.Date("2/02/2007",format = "%d/%m/%Y"))
	data_filter <- data[as.Date(data$Date,format = "%d/%m/%Y") %in% range,]
	
	x<- strptime(paste(data_filter$Date,data_filter$Time),"%d/%m/%Y %H:%M:%S")
	png("plot4.png",width = 480, height = 480)

	par(mfcol = c(2,2))
	plot0(data_filter,x)
	plot1(data_filter,x)
	plot2(data_filter,x)
	plot3(data_filter,x)

	dev.off()
}

plot0 <- function(data_filter, x){
	
	y <- data_filter$Global_active_power

	plot(x,y,xlab = "", ylab= "Global Active Power (Kilowatts)",pch = ".")
	lines(x,y)
}



plot1 <- function(data_filter, x){
	y1=data_filter$Sub_metering_1
	y2=data_filter$Sub_metering_2
	y3=data_filter$Sub_metering_3

	
	plot(x,y1,xlab = "", ylab= "Energy sub metering",type="n")
	lines(x,y1)
	lines(x,y2,col="red")
	lines(x,y3,col="blue")
	legend("topright", col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty = "n")
	
}

plot2 <- function(data_filter, x){
	
	y <- data_filter$Voltage

	plot(x,y,xlab = "datetime", ylab= "Voltage",pch = ".")
	lines(x,y)
}

plot3 <- function(data_filter, x){
	
	y<-data_filter$Global_reactive_power

	plot(x,y,xlab = "datetime", ylab= "Global_reactive_power",pch = ".")
	lines(x,y)
}

