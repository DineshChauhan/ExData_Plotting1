library(sqldf)    								#Include package to execute SQL on data frame
myFile <- "household_power_consumption.txt"					#Data File which has measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'" 	#SQL to fetch data for 2 days i.e.01-Feb-2007 & 02-Feb-2007 which is we are intrerested to plot
myData <- read.csv.sql(myFile,mySql,header=TRUE,sep=";") 			#Read a raw file and store datadrame into myData
png(filename="plot1.png", width = 480, height = 480)     			#Open png device to store the plot1
hist(as.numeric(as.character(myData$Global_active_power)),col="red",main = "Global Active Power",xlab="Global Active Power(kilowatts)") #Draw histogram for Global Active power.
dev.off()  						 			#Close the png device