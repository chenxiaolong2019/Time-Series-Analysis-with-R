> a<-read.table("C:/Users/35865/Desktop/时间序列分析/习题2.2.csv",sep=",",header=T)
> co2<-ts(a,start=c(1975,1),frequency=12)

#序列时序图
> plot(co2,main="1975年-1980年夏威夷Munna Loa火山每月释放的CO2数据",xlab="年份",ylab="CO2 单位:ppm")

#计算自相关系数
> for(k in 1:24){r=acf(co2,lag=k)}
> r

#画自相关图
> acf(co2,lag=24)
