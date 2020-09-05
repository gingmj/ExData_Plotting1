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


#plot1
quartz.save('plot1.png', type = "png", device = dev.cur(), dpi = 100)
hist(power_consumption_sub$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off
