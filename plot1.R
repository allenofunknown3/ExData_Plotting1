setwd('C:/Users/Allen/Google Drive/Coursera/Exploratory Data/Week 1/')
##Read in Data
dat<-read.table('household_power_consumption.txt', header=TRUE, sep = ';')
##Convert Date and Filter Data based on Date
dat$date_converted<-as.Date(dat$Date, format="%d/%m/%Y")
dat_filtered<-dat[(dat$date_converted==as.Date('2007-02-01'))|(dat$date_converted==as.Date('2007-02-02')),]
##Build Histogram
hist(as.numeric(as.character(dat_filtered$Global_active_power)),
     breaks=14, 
     xlim = c(0,6), 
     xaxt = 'n',
     ylim=c(0,1200),
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col="red",
     main="Global Active Power"
     )
axis(1,at=seq(0,6,2),labels=T)
##Save as png file
dev.copy(png,'plot1.png', height=480,width=480)
dev.off()
