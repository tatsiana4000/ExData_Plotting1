#############################################################
#write a histogram "Global Active Power" into PNG file
#############################################################

#read data
file<-"household_power_consumption.txt"
data_consumption <- read.table(file, header = TRUE,sep =";", 
                               colClasses = c("factor","factor","numeric","numeric","numeric","numeric"),
                               na.strings="?")

sub1<-data_consumption [data_consumption$Date=='1/2/2007',]
sub2<-data_consumption [data_consumption$Date=='2/2/2007',]

data<-rbind(sub1,sub2)

#############################################################
#plot graph
png(file="plot1.png",width = 480, height = 480)

par(bg=NA)
hist(data$Global_active_power,main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.off()
