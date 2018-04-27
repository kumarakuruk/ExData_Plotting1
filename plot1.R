
household<-read.csv.sql("./data/household_power_consumption.txt", "select * 
 from file where  Date = '1/2/2007' or  Date =  '2/2/2007'",sep=';', header=TRUE)

with(household, hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",
                     main="Global Active Power"))
dev.copy(png, file="./data/plot1.png")
dev.off()
