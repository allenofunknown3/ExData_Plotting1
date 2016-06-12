setwd('C:/Users/Allen/Google Drive/Coursera/Exploratory Data/Week 1/')
##Read in Data
dat<-read.table('household_power_consumption.txt', header=TRUE, sep = ';')
##Convert Date and Filter Data based on Date
dat$date_converted<-as.Date(dat$Date, format="%d/%m/%Y")
dat$datetime<-strptime(paste(dat$Date,dat$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
dat_filtered<-dat[(dat$date_converted==as.Date('2007-02-01'))|(dat$date_converted==as.Date('2007-02-02')),]
##Build Graph
plot(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Sub_metering_1)), type='l',xlab = '',ylab='Energy Sub Metering')
lines(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Sub_metering_2)), col='red')
lines(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Sub_metering_3)), col='blue')
legend(strptime("02/02/2007 11:00:00",format="%d/%m/%Y %H:%M:%S"),40, 
       c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
##Save as png file
dev.copy(png,'plot3.png', height=480,width=480)
dev.off()
