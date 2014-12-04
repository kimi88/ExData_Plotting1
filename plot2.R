plot2 <- function(){
	data <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?");	
	range <- c(as.Date("1/02/2007",format = "%d/%m/%Y"),as.Date("2/02/2007",format = "%d/%m/%Y"))
	data_filter <- data[as.Date(data$Date,format = "%d/%m/%Y") %in% range,]
	
	x<- strptime(paste(data_filter$Date,data_filter$Time),"%d/%m/%Y %H:%M:%S")
	y <- data_filter$Global_active_power

	png("plot2.png",width = 480, height = 480)
	plot(x,y,xlab = "", ylab= "Global Active Power (Kilowatts)",pch = ".")
	lines(x,y)
	dev.off()
}
