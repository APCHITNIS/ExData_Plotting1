
if(!file.exists("household_power_consumption.txt")){
        # download the dataset zip file
        zipfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
        download.file(zipfile,destfile = "dataset.zip", mode="wb");
        unzip(zipfile = "dataset.zip", files = NULL, list=FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)    
}



hh_pwr_consmp <- read.table("./household_power_consumption.txt", header = TRUE, colClasses=c("character", "character", rep("numeric",7)),sep = ";", na.strings   = "?" )

hh_pwr_consmp$Time <- strptime(paste(hh_pwr_consmp$Date, hh_pwr_consmp$Time), "%d/%m/%Y %H:%M:%S")
hh_pwr_consmp$Date <- strptime(hh_pwr_consmp$Date, "%d/%m/%Y")
dates <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
hh_pwr_consmp <- subset(hh_pwr_consmp, Date %in% dates )     
        
        
        
hist(hh_pwr_consmp$Global_active_power, main="Global Active Power",   xlab="GlobalActive Power (kilowatts)",  ylab="Frequency",col="red")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
