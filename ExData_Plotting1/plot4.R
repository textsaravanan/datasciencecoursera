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

png(file="plot4.png",width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

with(power_cons_data, {
    plot(DateTime,Global_active_power, type="o", pch=".", ylab = "Global Active Power", xlab="")
    plot(DateTime,Voltage, type="o", pch=".", ylab = "Voltage", xlab="datetime")
    plot(DateTime,Sub_metering_1, type="n", pch=".", ylab = "Energy sub metering", xlab="")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1, 1, 1),  col=c("black","red","blue"), cex=0.75, bty="n")
        points(power_cons_data$DateTime,power_cons_data$Sub_metering_1, col="black", type="o", pch=".")
        points(power_cons_data$DateTime,power_cons_data$Sub_metering_2, col="red", type="o", pch=".")
        points(power_cons_data$DateTime,power_cons_data$Sub_metering_3, col="blue", type="o", pch=".")
    plot(DateTime,Global_reactive_power, type="o", pch=".", ylab = "Global_reactive_power", xlab="datetime")
}
)

dev.off()