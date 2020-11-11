# Time Series Analysis - Building ARIMA models
The data used in this practice are ```cow.dat``` data measuring the daily morning temperature readings for a cow.

**Figure 1:** Cow Data Plots
![](images/cow_data_plots)

Since the data in Figure 1 are not stationary, I decided to used differenced data (d=1).

**Figure 2:** Differenced Cow Data Plots
![](images/dcow_data_plots)

Differenced data in Figure 2 seem to be stationary, so I created ACF and PACF plots with differenced data.

**Figure 3:** ACF and PACF Plots of Differenced Cow Data
![](images/acf_pacf_plots)

Based on the two plots in Figure 3, I set p=2 and q=1. Then, I fitted plots of AR(2), MA(1), and ARMA(2,1) models using ```sarima()``` function in R.

*All data used to fit below models are differenced data (d=1).*

### AR(2) Model
**Figure 4:** AR(2) Model of Differenced Cow Data
![](images/ar2)

```
       Estimate       SE    t.value  p.value
ar1     -0.6848   0.1096    -6.2476   0.0000
ar2     -0.3149   0.1104    -2.8537   0.0057
xmean   -0.1514   0.4919    -0.3079   0.7591
```

In Figure 4, most of p-values are near the blue line. Hence, the H<sub>0</sub> might be wrong, and the residuals might not be white. The estimated coefficients are significant.

### MA(1) Model
**Figure 5:** MA(1) Model of Differenced Cow Data
![](images/ma1)

```
       Estimate       SE    t.value  p.value
ma1     -0.8724   0.0983    -8.8787   0.0000
xmean   -0.2380   0.1339    -1.7766   0.0799
```
Based on the Figure 5, most of p-values are above the blue line. Hence, the H<sub>0</sub> might not be wrong, and the residuals were white. The estimated coefficients are significant.
