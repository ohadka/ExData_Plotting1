### Plot 1

## Download Zip file and un-zip it
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ## file location
dest<-"data.zip" ## downloaded file name
download.file(fileurl,dest) ## download the file from the web
unzip(dest) ## unzip the data file
datafile<-"household_power_consumption.txt" ## source file name

## read table and subset it

alldata <- read.table(datafile,header=TRUE,sep=";") ## move data from text file to data frame
subdata<-subset(alldata,as.Date(Date,"%d/%m/%Y")=="2007-02-01" | as.Date(Date,"%d/%m/%Y")=="2007-02-02") ## subset to specific dates

# Convert date and time
subdata[,"Date"]<-as.Date(subdata$Date,"%d/%m/%Y")
x<-paste(subdata$Date,subdata$Time)
subdata[,"Time"]<-format(strptime(x,"%Y-%m-%d %H:%M:%S"),"%H:%M:%S")

## convert values to numeric
z<-as.numeric(as.character(subdata$Global_active_power))


## save it to PNG file
png(filename = "plot1.png",width = 480, height = 480)
hist(z,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)") ## create plot
dev.off() ## close plotting device