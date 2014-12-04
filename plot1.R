plot1 <- function(){
	data <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?");	
	range <- c(as.Date("1/02/2007",format = "%d/%m/%Y"),as.Date("2/02/2007",format = "%d/%m/%Y"))
	data_filter <- data[as.Date(data$Date,format = "%d/%m/%Y") %in% range,]
	x <- data_filter$Global_active_power
	png("plot1.png",width = 480, height = 480)
	hist(x, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")
	dev.off()
}
