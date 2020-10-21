> x<-c(1:20)
> for(k in 1:6){r=acf(x,lag=k)}
> r

Autocorrelations of series ‘x’, by lag

    0     1     2     3     4     5     6 
1.000 0.850 0.702 0.556 0.415 0.280 0.153 

> acf(x,lag=)
