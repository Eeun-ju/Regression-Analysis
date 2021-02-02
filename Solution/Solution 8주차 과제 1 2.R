# CH4 Regression Diagnostics-1  


# 1. Consider the computer repair problem discussed in Section 2.3. In a second sampling period, 10 more observations on the variable Minutes and Units were obtained. Since all observations were collected by the same method from a fixed environment, all 24 observations were pooled to form one data set. The data appear in Table 4.6.  


# a) Fit a linear regression model relating Minutes to Units

library(broom)
library(olsrr)

df = read.table("C:/Users/user/Desktop/ch4_computer.txt",header = TRUE)
df

model = lm(Minutes ~ Units, data=df)
summary(model)
plot(formula=Minutes ~ Units, data=df)

# b) Check each of the standard regression assumptions and indicate which assumption(s) seems to be violated.

# b-1) Linearlity
model.diag.metrics = augment(model)
head(model.diag.metrics)
par(mfrow = c(2,2))
plot(model)

plot(model,1)
plot(formula=Minutes ~ Units, data=df)

# residual plot will show some pattern but -> look like non-linear relationship in the data units, minutes plot -> look like linear relationship in the data

# b-2) Homogeneity of variance
plot(model,3)

# 균등하게 퍼져있지 않음 -> non-constant variances in the residuals error(heteroscedasticity)

# b-3) Normality of residuals
plot(model,2)

# 대부분의 점들이 직전 근처에 있으므로 normality 가정할 수 있음


