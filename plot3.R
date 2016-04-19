#Create directory dataset to store the dataset
if(!file.exists("./dataset")){
        dir.create("./dataset");
}
if(!file.exists("./household_power_consumption.txplot")){
        # download the dataset zip file
        zipfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
        download.file(zipfile,destfile = "./dataset/dataset.zip", mode="wb");
        unzip(zipfile = "./dataset/dataset.zip", files = NULL, list=FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)    
}



hh_pwr_consmp <- read.table("./household_power_consumption.txt", header = TRUE, colClasses=c("character", "character", rep("numeric",7)),sep = ";", na.strings   = "?" )

hh_pwr_consmp$Time <- strptime(paste(hh_pwr_consmp$Date, hh_pwr_consmp$Time), "%d/%m/%Y %H:%M:%S")
hh_pwr_consmp$Date <- strptime(hh_pwr_consmp$Date, "%d/%m/%Y")
dates <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
hh_pwr_consmp <- subset(hh_pwr_consmp, Date %in% dates )     
        

plot(hh_pwr_consmp$Time, hh_pwr_consmp$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering");
lines(hh_pwr_consmp$Time, hh_pwr_consmp$Sub_metering_2,  col="red");
lines(hh_pwr_consmp$Time, hh_pwr_consmp$Sub_metering_3,  col="blue");
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1));
dev.copy(png, file="plot3.png", width=480, height=480);
dev.off()

