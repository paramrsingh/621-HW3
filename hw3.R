library(leaps)
library(bestglm)
training <- read.csv('crime-training-data.csv')
attach(training)

par(mfrow=c(4,4))
plot(zn,target, main="zn")
plot(indus,target, main="Indus")
plot(chas,target, main="chas") #dummy variable - not sure how you deal with this in glm
plot(nox,target, main="nox")
plot(rm,target, main="rm")
plot(age,target, main="age")
plot(dis,target, main="dis")
plot(rad,target, main="rad")
plot(tax,target, main="tax")
plot(ptratio,target, main="ptratio")
plot(black,target, main="black")
plot(lstat,target, main="lstat")
plot(medv,target, main="medv")

res.bestglm <- bestglm(Xy = training, family=binomial, IC="BIC")
res.bestglm
summary(res.bestglm)

logitmod <- glm(target ~ nox+rad+tax, family=binomial)
summary(logitmod)