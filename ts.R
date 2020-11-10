# Sophie Youk
# Time Series Analysis

library(stats)

################################ P1
cow <- scan("cow.dat")
ts.plot(cow)
acf(cow, lag.max = 20)

dcow <- diff(cow)
ts.plot(dcow)
acf(dcow, lag.max = 20)
acf2(dcow, max.lag = 20) # p=2, d=1, q=1

sarima(dcow, 2,0,0) # AR(2)
sarima(dcow, 0,0,1) # MA(1)
sarima(dcow, 2,0,1) # ARIMA(2,0,1)


################################ P2
bicoal <- scan("bicoal.dat")
ts.plot(bicoal)
acf(bicoal, lag.max = 20)
acf2(bicoal, max.lag = 20)# p=1, d=0, q=0

dbicoal <- diff(bicoal)
ts.plot(dbicoal)
acf(dbicoal, lag.max = 20)
acf2(dbicoal, max.lag = 20) # p=2, d=1, q=2

sarima(dbicoal, 2,0,0) # AR(2)
sarima(dbicoal, 0,0,1) # MA(2)
sarima(dbicoal, 2,0,1) # ARMA(2,2)



