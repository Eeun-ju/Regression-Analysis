data = read.table("C:/Users/user/Desktop/heights.txt",header = TRUE)
head(data)
tail(data)

#a) compute the covariance between the heights of the H and W

cov(data$Husband,data$Wife)

#b) What would the covariance be if heights were measured in inches rather than in centimeters?

cov(data$Husband/2.54,data$Wife/2.54)

#c) compute the correlation coefficient between the heights of the H and W

cor(data$Husband,data$Wife)

#d) What would the correlation be if heights were measured in inches rather than in centimeters?

cor(data$Husband/2.54,data$Wife/2.54)

#e) What would the correlation be if every man married a woman exactly 5 centimeters shorter than him?

cor(data$Husband,data$Husband-5)

#f) We wish to fit a regression model relating the heights of husbands and wives. Which one of the two variables would you choose as the response variable? Justify your answer.

# sol) 반응 변수로 어떤 변수를 선택해도 상관 없다. 남편의 키를 통해 아내의 키를 알고 싶다면 아내의 키를 종속변수로 두고 반대의 경우에는 반대로 바꿔준다.다음 문제를 위해 아내의 키를 통해 남편의 키를 알아보는 것을 선택하겠다.

# g) Using your choice of the response variable in Exercise 2.1O(f), test the null hypothesis that the slope is zero.

linear_model = lm(Husband ~ Wife,data = data)
summary(linear_model)

# h) Using your choice of the response variable in Exercise 2.1O(f), test the null hypothesis that the intercept is zero.

# sol) g), h) 모두 p-value가 0.05보다 작으므로 null hypothesis를 기각한다.