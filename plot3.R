library(sqldf)

household<-read.csv.sql("./data/household_power_consumption.txt", "select * 
                        from file where  Date = '1/2/2007' or 
                        Date =  '2/2/2007'" ,sep=';', header=TRUE)

h_date<-as.Date(household$Date, format='%d/%m/%Y')
h_date_time<- as.POSIXct(paste(h_date, household$Time))

plot(h_date_time, household$Sub_metering_1, type="n",  xlab="", 
                     ylab = "Energy sub metering")

points(h_date_time, household$Sub_metering_1, type="line")
points(h_date_time, household$Sub_metering_2, type="line", col="red")
points(h_date_time, household$Sub_metering_3, type="line", col="blue")

legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1)
       )

dev.copy(png, file="./data/plot3.png")
dev.off()


