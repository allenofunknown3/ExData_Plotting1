setwd('C:/Users/Allen/Google Drive/Coursera/Exploratory Data/Week 1/')
##Read in Data
dat<-read.table('household_power_consumption.txt', header=TRUE, sep = ';')
##Convert Date and Filter Data based on Date
dat$date_converted<-as.Date(dat$Date, format="%d/%m/%Y")
dat$datetime<-strptime(paste(dat$Date,dat$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
dat_filtered<-dat[(dat$date_converted==as.Date('2007-02-01'))|(dat$date_converted==as.Date('2007-02-02')),]
##Split Graph 2x2
par(mfrow=c(2,2))
##Graph 1
plot(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Global_active_power)), type='l',xlab = '',ylab='Global Active Power')
##Graph 2
plot(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Voltage)), type='l',xlab = 'datetime',ylab='Voltage')
##Graph 3
plot(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Sub_metering_1)), type='l',xlab = '',ylab='Energy Sub Metering')
lines(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Sub_metering_2)), col='red')
lines(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Sub_metering_3)), col='blue')
##Graph 4
plot(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Global_reactive_power)), type='l',xlab = 'datetime',ylab='Global Reactive Power')
##Save as png file
dev.copy(png,'plot4.png', height=480,width=480)
dev.off()