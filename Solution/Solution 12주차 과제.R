df = read.csv('C:/Users/user/Desktop/바탕화면/ch10.csv',header = TRUE)

names(df) = c('Y','X1','X2','X3','X4','X5','X6')
df

X.scaled = data.frame(scale(df, center= FALSE , scale=apply(df, 2, sd, na.rm = TRUE)))
X.scaled

# standardized vaiables line
model<-lm(Y~X1+X2+X3+X4+X5+X6,data=X.scaled)
model
summary(model)
# 설명력 1에 가깝지만 유의변수들이 적음 => collinearity 의심

model1 <- lm(Y~X1+X2+X3+X4+X5+X6,data=df)
model1
summary(model1)



cordata =cor(df[,2:7])
cordata

cordata1 = cor(X.scaled)
cordata1
plot(df[,2:7])
# collinearity 보임 (x가 증가하면 y가 증가하는)

df[,2:7]
pc <- prcomp(X.scaled[,2:7], scale = TRUE)
pc
v = pc$sdev^2
round(v,3)
condi =rep(0,6)
for(i in 1:6){
  condi[i] = sqrt(v[1]/v[i])
}
condi
screeplot(pc, main = "", col = "green", type = "lines", pch = 1, npcs = length(pc$sdev))

as.matrix(X.scaled[,2:7])%*%pc$rotation


stlong = scale(df)
stlong = as.data.frame(stlong)


pc = prcomp(x=stlong[,-1],center = T,scale = T)

pcley = as.matrix(stlong[,-1]) %*% pc$rotation
pc$rotation
pcley

round(cor(pcley),3)
# pc는 2 or 3까지 선택