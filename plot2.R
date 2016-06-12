setwd('C:/Users/Allen/Google Drive/Coursera/Exploratory Data/Week 1/')
##Read in Data
dat<-read.table('household_power_consumption.txt', header=TRUE, sep = ';')
##Convert Date and Filter Data based on Date
dat$date_converted<-as.Date(dat$Date, format="%d/%m/%Y")
dat$datetime<-strptime(paste(dat$Date,dat$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
dat_filtered<-dat[(dat$date_converted==as.Date('2007-02-01'))|(dat$date_converted==as.Date('2007-02-02')),]
##Build Graph
plot(dat_filtered$datetime,as.numeric(as.character(dat_filtered$Global_active_power)), type='l',xlab = '',ylab='Global Active Power (kilowatts)')
##Save as png file
dev.copy(png,'plot2.png', height=480,width=480)
dev.off()