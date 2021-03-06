mydata = read.table("household_power_consumption.txt",header=TRUE,sep=";")
t<-paste(mydata$Date,mydata$Time)
r<-strptime(t,format="%d/%m/%Y%H:%M:%S")
w<-"2007-02-01 00:00:00"
e<-"2007-02-03 00:00:00"
w1<-strptime(w,format="%Y-%m-%d %H:%M:%S")
e1<-strptime(e,format="%Y-%m-%d %H:%M:%S")
w<-r>w1 & r<e1
truedata<-mydata$Global_active_power[w=="TRUE" & !is.na(w)]
truea<-as.numeric(as.matrix(truedata))
png('plot1.png')
hist(truea,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()