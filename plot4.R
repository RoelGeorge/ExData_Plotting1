## Assigning values to vriables 
fn <- "household_power_consumption.txt"

colNames = c("date", "time", "globalActivePower", "globalReactivePower",
             "voltage", "globalIntensity", "subMetering1", "subMetering2",
             "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )
## reading the data using the variables 
df <- read.table(fn, header=TRUE, sep=";", 
                 col.names=colNames, colClasses=colClasses, na.strings="?")
## changing class of df$date and formatting it correctly
df$date = as.Date(df$date, format="%d/%m/%Y")
df = df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]
## creating  plot4.png file 
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

##plotting plot1
plot(df$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))

##plotting plot2
plot(df$voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))


## plotting plot3
with(df, {
    plot(subMetering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
    lines(x=subMetering2, col="red")
    lines(x=subMetering3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

##plotting plot4
plot(df$globalReactivePower, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))

dev.off()
