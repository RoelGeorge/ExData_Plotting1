## Assigning values to vriables 
fn <- "household_power_consumption.txt"

colNames = c("date", "time", "globalActivePower", "globalReactivePower",
             "voltage", "globalIntensity", "subMetering1", "subMetering2",
             "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )
## reading the data using the variables  
df <- read.table(fn, header=TRUE, sep=";", 
                 col.names=colNames, colClasses=colClasses, na.strings="?")
## changing class of df$date and formatting it correctily
df$date = as.Date(df$date, format="%d/%m/%Y")
df = df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]
## creating plot1.png
png(filename="plot1.png", width=480, height=480, units="px")
## Plotting plot1.png
hist(df$globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()