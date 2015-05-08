rm(list=ls())

data<- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactor=FALSE)
is.na(data) <- data == "?"
data$DateTime <-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$Date <-as.Date(data$Date, format = "%d/%m/%Y")
power_cons_data<-subset(data, Date %in% as.Date(c('2007-02-01', '2007-02-02')))
rm(data)
#head(power_cons_data)
#nrow(power_cons_data)
power_cons_data<-transform(power_cons_data, Global_active_power = as.numeric(Global_active_power))
#nrow(power_cons_data[power_cons_data$Date %in% as.Date(c('2007-02-02')),])
#nrow(power_cons_data[power_cons_data$Date %in% as.Date(c('2007-02-01')),])
png(file="plot3.png",width = 480, height = 480, units = "px")

with(power_cons_data, plot(DateTime,Sub_metering_1, type="n", pch=".", ylab = "Energy sub metering", xlab=""))

with(power_cons_data,points(DateTime,Sub_metering_1, col="black", type="o", pch="."))
with(power_cons_data,points(DateTime,Sub_metering_2, col="red", type="o", pch="."))
with(power_cons_data,points(DateTime,Sub_metering_3, col="blue", type="o", pch="."))

legend("topright",lty = c(1, 1, 1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()