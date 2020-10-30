#P75
a<-read.table("C:/Users/35865/Desktop/时间序列分析/数据/案例数据/file8.csv",sep=",",header=T)
x<-ts(a$kilometer,start=1950)
plot(x)
for(i in 1:2)print(Box.test(x,type='Ljung-Box',lag=6*i))
acf(x)
pacf(x)

#自动定阶
library(zoo)
library(forecast)
auto.arima(x)
--------------------------
Series: x 
ARIMA(2,0,0) with non-zero mean 

Coefficients:
         ar1      ar2     mean
      0.7185  -0.5294  11.0226
s.e.  0.1083   0.1067   3.0906

sigma^2 estimated as 384.7:  log likelihood=-258.23
AIC=524.46   AICc=525.2   BIC=532.77
---------------------------------
x.fit<-arima(x,order=c(2,0,0),method="ML")
x.fit
#白噪声检验
for(i in 1:2)print(Box.test(x.fit$residual,lag=6*i))

           Box-Pierce test

data:  x.fit$residual
X-squared = 2.0949, df = 6, p-value = 0.9108

	         Box-Pierce test

data:  x.fit$residual
X-squared = 2.8341, df = 12, p-value = 0.9966

> t1<-0.7185/0.1083
> pt(t1,df=56,lower.tail=F)
[1] 6.94276e-09
> t2<--0.5294/0.1067
> pt(t2,df=56,lower.tail=T)
[1] 3.43633e-06

> t0=11.0223/3.0906
> pt(t0,df=56,lower.tail=F)
[1] 0.0003748601

> forecast(x.fit,h=5)
     Point Forecast     Lo 80    Hi 80     Lo 95    Hi 95
2009       9.465302 -15.02455 33.95516 -27.98870 46.91930
2010       6.214789 -23.94131 36.37089 -39.90499 52.33456
2011       8.392250 -21.76556 38.55006 -37.73015 54.51465
2012      11.677647 -19.95516 43.31046 -36.70056 60.05586
2013      12.885518 -19.44684 45.21788 -36.56256 62.33360
> 
> x.for<-forecast(x.fit,h=5)
> plot(x.for)
