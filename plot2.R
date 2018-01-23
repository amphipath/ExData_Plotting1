test <- read.table('household_power_consumption.txt',sep=";")
test <- test[test[,1] == "1/2/2007" | test[,1] == "2/2/2007",]

y <- test$V3
y <- as.numeric(levels(y))[y]
time <- as.character(test$V2)
day <- as.character(test$V1)

packages.install("chron")
library(chron)
datetime <- chron(dates = day, time, format = c(dates = "d/m/y", times = "h:m:s"))

png("plot2.png")
plot(y, x = datetime, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()