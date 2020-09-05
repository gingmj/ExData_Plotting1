#Read in dataset
household_power_consumption <- read.csv("~/Documents/coursera/exploratory data analysis/project1/household_power_consumption.txt", sep=";")
head(household_power_consumption)

#Change date/time format
household_power_consumption$Date_Time <- strptime(paste(as.character(household_power_consumption$Date),household_power_consumption$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

#Subsetting dataset
power_consumption_sub <- subset(household_power_consumption,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

#clean missingupdate numeric field format
power_consumption_sub[3:9] <-sapply(power_consumption_sub[3:9], function(x) as.numeric(as.character(x)))

#plot3
quartz.save('plot3.png', type = "png", device = dev.cur(), dpi = 100)
plot(power_consumption_sub$Date_Time,power_consumption_sub$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='')
lines(power_consumption_sub$Date_Time,power_consumption_sub$Sub_metering_2,col='red')
lines(power_consumption_sub$Date_Time,power_consumption_sub$Sub_metering_3,col='blue')
legend(x= "topright",y=6,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1), ncol=1)
dev.off
