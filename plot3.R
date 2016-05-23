mydata = read.table("household_power_consumption.txt",header=TRUE,sep=";")
t<-paste(mydata$Date,mydata$Time)
r<-strptime(t,format="%d/%m/%Y%H:%M:%S")
w<-"2007-02-01 00:00:00"
e<-"2007-02-03 00:00:00"
w1<-strptime(w,format="%Y-%m-%d %H:%M:%S")
e1<-strptime(e,format="%Y-%m-%d %H:%M:%S")
w<-r>w1 & r<e1
truedata<-mydata$Sub_metering_1[w=="TRUE" & !is.na(w)]
truea<-as.numeric(as.matrix(truedata))
truedata<-mydata$Sub_metering_2[w=="TRUE" & !is.na(w)]
trueb<-as.numeric(as.matrix(truedata))
truedata<-mydata$Sub_metering_3[w=="TRUE" & !is.na(w)]
truec<-as.numeric(as.matrix(truedata))
a<-cbind(truea,trueb,truec)
png('plot3.png',width=480,height=480)
p<-w=="TRUE"&!is.na(w)
plot(r[p],a[,1],type="l",ylab="Energy sub metering",xlab="")
lines(r[p],a[,2],col="red")
lines(r[p],a[,3],col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()