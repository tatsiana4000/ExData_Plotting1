#############################################################
#write a plot "Four plots" into PNG file
#############################################################

#read data
file<-"./household_power_consumption.txt"
data_consumption <- read.table(file, header = TRUE,sep =";", 
                               colClasses = c("factor","factor","numeric","numeric","numeric","numeric"),
                               na.strings="?")

sub1<-data_consumption [data_consumption$Date=='1/2/2007',]
sub2<-data_consumption [data_consumption$Date=='2/2/2007',]

data<-rbind(sub1,sub2)

#############################################################
#plot graph
png(file="plot4.png",width = 480, height = 480)

#convert Date and Time into date format
Date_x<-strptime(paste(data$Date, data$Time, sep=" "),
                 '%d/%m/%Y %H:%M:%S')
par(mfcol=c(2,2))

#----------------------------------------------------------
#plot nr.1
plot(Date_x,data$Global_active_power ,main=NA, type="l", 
     ylab="Global Active Power", xlab=NA)

#----------------------------------------------------------
#plot nr.2
plot(Date_x,data$Sub_metering_1 ,main=NA, type="n", 
     ylab="Energy sub metering",
     xlab=NA)

#add lines
lines(Date_x,data$Sub_metering_1,col="black")
lines(Date_x,data$Sub_metering_2,col="red")
lines(Date_x,data$Sub_metering_3,col="blue")

#add legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue")
)

#----------------------------------------------------------
#plot nr.3
plot(Date_x,data$Voltage ,main=NA, type="l", 
     ylab="Voltage", xlab="datetime")

#----------------------------------------------------------
#plot nr.4
plot(Date_x,data$Global_reactive_power ,main=NA, type="l", 
     xlab="datetime")


dev.off()
