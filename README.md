# Time Series Analysis - Building ARIMA models
## 1. Exploratory Data Analysis
The data used in this practice are ```cow.dat``` data measuring the daily morning temperature readings for a cow.

<p align="center"><img src="images/cow_data_plots"></p>
<h4 align="center">Figure 1: Cow Data Plots</h4>

Since the data in Figure 1 are not stationary, I decided to used differenced data (d=1).

<p align="center"><img src="images/dcow_data_plots"></p>
<h4 align="center">Figure 2: Differenced Cow Data Plots</h4>

Differenced data in Figure 2 seem to be stationary, so I created ACF and PACF plots with differenced data.

</br>
<p align="center"><img src="images/acf_pacf_plots"></p>
<h4 align="center">Figure 3: ACF and PACF Plots of Differenced Cow Data</h4>

Based on the two plots in Figure 3, I set p=2 and q=1. Then, I fitted plots of AR(2), MA(1), and ARMA(2,1) models using ```sarima()``` function in R.

## 2. Model Estimation & 3. Model Diagnostics
*All data used to fit below models are differenced data (d=1).*

### a. AR(2) Model
<p align="center"><img src="images/ar2"></p>
<h4 align="center">Figure 4: AR(2) Model of Differenced Cow Data</h4>

```
       Estimate       SE    t.value  p.value
ar1     -0.6848   0.1096    -6.2476   0.0000
ar2     -0.3149   0.1104    -2.8537   0.0057
xmean   -0.1514   0.4919    -0.3079   0.7591
```

In Figure 4, most of p-values are near the blue line. Hence, the H<sub>0</sub> might be wrong, and the residuals might not be white. The estimated coefficients are significant.

### b. MA(1) Model
<p align="center"><img src="images/ma1"></p>
<h4 align="center">Figure 5: MA(1) Model of Differenced Cow Data</h4>

```
       Estimate       SE    t.value  p.value
ma1     -0.8724   0.0983    -8.8787   0.0000
xmean   -0.2380   0.1339    -1.7766   0.0799
```

Based on the Figure 5, most of p-values are above the blue line. Hence, the H<sub>0</sub> might not be wrong, and the residuals were white. The estimated coefficients are significant.

### c. ARMA(2,1) Model
<p align="center"><img src="images/arma21"></p>
<h4 align="center">Figure 6: ARMA(2,1) Model of Differenced Cow Data</h4>

```
      Estimate       SE    t.value   p.value
ar1     0.1368   0.1155     1.1840    0.2404
ar2     0.1866   0.1159     1.6100    0.1119
ma1    -1.0000   0.0555   -18.0304    0.0000
xmean  -0.2396   0.0597    -4.0150    0.0001
```

Based on the Figure 6, most of p-values are near the blue line. Hence, the H0 might be wrong, and the residuals might not be white. The estimated values of &phi;'s are not significant.

## 4. Model Selection
(d=1)|AR(2)|MA(1)|ARMA(2,1)
-----|-----|-----|-----
Est Coeffs|**All significant**|**All significant**|ϕ’s not significant
Diagnostics|Ok|Ok|Ok
AIC|7.206017|**7.113665**|7.127148
AICc|7.21065|**7.115949**|7.134982
BIC|7.330561|**7.207073**|7.282828
<h4 align="left">Figure 7: Summary Table</h4>

Based on the Figure 7, I will choose MA(1) model with differenced data or ARIMA(0,1,1) of the original data.
