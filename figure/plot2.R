#############################################################
#write a plot "Global Active Power" into PNG file
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
#convert Date and Time into date format
Date_x<-strptime(paste(data$Date, data$Time, sep=" "),
                 '%d/%m/%Y %H:%M:%S')

#############################################################
#plot graph
png(file="plot2.png",width = 480, height = 480)

par(bg=NA)

plot(Date_x,data$Global_active_power ,main=NA, type="l", 
    ylab="Global Active Power (kilowatts)", xlab=NA)


dev.off()
