#Modeling
#Linear Regression - Linear, Multiple
#y ~ x1 (SLR); y~ x1 + x2 + .... (MLR)
#y - Dependent Variable, x - Independent Variable

head(women)
#y - weight
#x - height

cor(women$height, women$weight)  #direction of the relationship
#gives the strength and direction of relationship
cov(women$height, women$weight)  #magnitude of the relationship
#height increases, weight increases
plot(women$height, women$weight)

#Check for assumptions of Linear Regressions
fit1 = lm(weight ~ height, data = women)
summary(fit1)
#F Stats Pvalue << 0.05 : Linear Model exists
#at least 1 Independent variable is significant in predicting Dependent Variable
#Multiple Rsquare = 0.991 - Coefficient of Determination
#The adjusted R-squared is a modified version of R-squared that has been adjusted for the number of predictors in the model. The adjusted R-squared increases only if the new term improves the model more than would be expected by chance.
#Multiple when you have one IV, otherwise take adjusted Rsquared
#99% of the variation in Y is explained by Xs
#y = mx + c : weight = -87 + 3.45 * height
range(women$height)
#can only do interpolation, not extrapolation
women$weight
women$height
?lm
(y = -87 + 3.45 * women$height)
#predicted weights for actual heights
#predict.lm(fit1, women$height, level = 0.95)
fitted(fit1)
residuals(fit1)

summary(fit1)  #summary of the model
summary(residuals(fit1))
summary(students$marks1)
(newdata1 = data.frame(height=c(60.4, 55.9, 77.4, 80.1)))
(p1 = predict(fit1, newdata = newdata1, type = 'response'))
cbind(newdata1, p1)  #column bind : can also do row bind or rbind

plot(fit1)


