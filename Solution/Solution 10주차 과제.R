## Housing Starts data ##
housedata<-read.csv("C:/Users/user/Downloads/chp8_4.csv",header = TRUE)
housedata
attach(housedata)
fit.hou1<-lm(H~P)
summary(fit.hou1)
plot(rstandard(fit.hou1))
abline(h=0,lwd=2,col="red")
dwtest(fit.hou1)

# d_L = 1.288, d_U = 1.454 H0 reject!