### Plot 3

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
timecon<-strptime(x,"%Y-%m-%d %H:%M:%S")

## convert values to numeric
z<-as.numeric(as.character(subdata$Sub_metering_1))
z2<-as.numeric(as.character(subdata$Sub_metering_2))
z3<-as.numeric(as.character(subdata$Sub_metering_3))

## plot and save it to PNG file
png(filename = "plot3.png",width = 480, height = 480)
plot(timecon,z,type="l",ylab="Energy sub metering",xlab="") ## create plot
lines(timecon,z2,type="l",col="red",xlab="") ## add sub metering 2
lines(timecon,z3,type="l",col="blue",xlab="") ## add sub metering 3
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off() ## close plotting device