test <- read.table('household_power_consumption.txt',sep=";")
test <- test[test[,1] == "1/2/2007" | test[,1] == "2/2/2007",]
y <- test$V3
y <- as.numeric(levels(y))[y]

png("plot1.png")
hist(y, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()