test <- read.table('household_power_consumption.txt',sep=";")
test <- test[test[,1] == "1/2/2007" | test[,1] == "2/2/2007",]

time <- as.character(test$V2)
day <- as.character(test$V1)

datetime <- strptime(paste(day,time), "%d/%m/%Y %H:%M:%S")

y1 <- test$V7
y1 <- as.numeric(levels(y1))[y1]
y2 <- test$V8
y2 <- as.numeric(levels(y2))[y2]
y3 <- test$V9
y3 <- as.numeric(levels(y3))[y3]

png("plot3.png")
plot(y1,type="l",x=datetime,col="#777777",ylab="Energy sub metering")
lines(y2,x=datetime,col="red")
lines(y3,x=datetime,col="blue")
legend(x="topright",legend = c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("#777777","red","blue"),pch=20)
dev.off()