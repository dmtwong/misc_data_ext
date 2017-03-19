install.packages("Quandl")
library(Quandl)

Quandl.api_key("XXXXXXXXXX") #Replace by own quandl key

#mydata = Quandl("FRED/DEXCHUS", start_date="1993-01-01", end_date="2017-03-14")
#mydata[6037,]

mydata = Quandl("FRED/DEXCHUS", collapse="monthly", start_date="1993-01-01")
str(mydata)

mydata <- mydata[order(as.Date(mydata$DATE)), ]

mydata$CNYUSD <- 1/(mydata$VALUE)
mydata[290:291, ]

# mydata$DATE <- format(mydata$DATE, "%m-%Y")
str(mydata)

par(mfrow = c(2,1))

names(mydata) <- c("DATE", "USDCNY", "CNYUSD")
plot(USDCNY~DATE, data=mydata, type="l", col = "red")
plot(CNYUSD~DATE, data=mydata, type="l", col = "blue")

mydata$DATE <- format(mydata$DATE, "%m-%Y")

par(mfrow = c(1,1))

plot(USDCNY~DATE, data=mydata, type="l", col = "red")
plot(CNYUSD~DATE, data=mydata, type="l", col = "blue")

setwd('C:/Users/Davif Wong/Desktop')
write.csv(mydata, file = "ChinaExRate_20170315.csv", row.names = T)
