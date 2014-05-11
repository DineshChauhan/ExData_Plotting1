library(sqldf)									#Include package to execute SQL on data frame
myFile <- "household_power_consumption.txt"					#Data File which has measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"	#SQL to fetch data for 2 days i.e.01-Feb-2007 & 02-Feb-2007 which is we are intrerested to plot
myData <- read.csv.sql(myFile,mySql,header=TRUE,sep=";")			#Read a raw file and store datadrame into myData
DateTime<-strptime(paste(myData$Date,myData$Time),"%d/%m/%Y %H:%M:%S")		#Combine Date & Time columns & strip out time
png(filename="plot4.png", width = 480, height = 480)				#Open png device to store the plot3
par(mfcol = c(2,2))								#Draw four boxes which will hold four different plots
plot(DateTime,myData$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)") #Draw plot between DateTime vs Global Active Power
plot(DateTime,myData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering") #Draw plot between DateTime vs Sub_metering_1
lines(DateTime, as.numeric(as.character(myData$Sub_metering_2)), type = "l", col = "red")	#Draw lines between DateTime vs Sub_metering_2
lines(DateTime, as.numeric(as.character(myData$Sub_metering_3)), type = "l", col = "blue")	#Draw line between DateTime vs Sub_metering_3
legend("topright", col=c("black", "red", "blue"), cex = 0.95, lty=1,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
										#Add legend at top right corner
plot(DateTime,myData$Voltage,type="l",xlab="datetime",ylab="Voltage")		#Draw plot between DateTime vs Voltage
plot(DateTime,myData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power") #Draw plot between DateTime vs Global Reactive Power
dev.off()