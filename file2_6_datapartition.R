#partition the data into train and test set
mtcars
nrow(mtcars)
#train-70%, test-30%
sample(x=1:32, size=.7 * 32)
index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars), replace=F)
index
train= mtcars[index,]
test= mtcars[-index,]
nrow(train)
nrow(test)
nrow(train) + nrow(test)





#-------
data(mtcars)
#class(data(mtcars))
#class(mtcars)
## 75% of the sample size
smp_size <- floor(0.75 * nrow(mtcars))

## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(mtcars)), size = smp_size)

train <- mtcars[train_ind, ]
test <- mtcars[-train_ind, ]

# -----
require(caTools)
set.seed(101) 
sample = sample.split(mtcars$am, SplitRatio = .75)
sample
train = subset(mtcars, sample == TRUE)
test  = subset(mtcars, sample == FALSE)
train; test
table(train$am); table(test$am)

mtcars$id <- 1:nrow(mtcars)
train <- mtcars %>% dplyr::sample_frac(.75)
test  <- dplyr::anti_join(mtcars, train, by = 'id')

library(caret)
intrain<-createDataPartition(y=factor(mtcars$am),p=0.7,list=FALSE)
intrain
training<-mtcars[intrain,]
testing<-mtcars[-intrain,]
training  
testing
table(training$am)
table(testing$am)



women
head(women)
nrow(women)
library(dplyr)
windex = sample(1:nrow(women), size = 0.7 * nrow(women))
training_women = women[windex, ]
testing_women = women[-windex, ]
fit1 = lm(weight ~ height, data = training_women)
summary(fit1)
fitted(fit1)
residuals(fit1)
p1 = predict(fit1, newdata = testing_women, type = 'response')
p1
cbind(actual = testing_women$weight, Predicted = p1)  #column bind : can also do row bind or rbind

library(Metrics)
par(mfrow=c(2,2))
plot(fit1)
mse(testing_women$weight, p1)
?mse
