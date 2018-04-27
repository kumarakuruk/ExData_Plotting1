library(sqldf)

household<-read.csv.sql("./data/household_power_consumption.txt", "select * 
                        from file where  Date = '1/2/2007' or 
                        Date =  '2/2/2007'" ,sep=';', header=TRUE)

h_date<-as.Date(household$Date, format='%d/%m/%Y')
h_date_time<- as.POSIXct(paste(h_date, household$Time))

with(household, plot(h_date_time, Global_active_power, type="line",  xlab="", 
                     ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file="./data/plot2.png")
dev.off()