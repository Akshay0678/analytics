#comment by starting #
women
#control+enterto execute command - its a comment
?women

#?before function to seek help

mtcars
?mtcars
#mtcars is a dataframe
mean(mtcars$mpg)
?names(mtcars)
names(mtcars)
mean(mtcars$hp)
colMeans(mtcars)
rowMeans(mtcars)
head(mtcars)   #first 6 rows
head(mtcars, 2)
rowMeans(head(mtcars, 2)) #mean of rowwise data
?head(mtcars, 2)  #info about head
tail(mtcars)      #last 6 rows
tail(mtcars, 1)   #last 1 row

hist(mtcars$mpg)   #histogram of mtcars - mpg
hist(mtcars$mpg, breaks=3)

#vectors
x = c(1,2,3,5,6)
x
class(x)

x1 = c(2L, 9L)
class(x1)
class(mtcars)

x3 = c("a", 6, 'B', 'Akshay')
class(x3)

x4 = c(TRUE, FALSE, T, F)
x4
class(x4)

x5 = 1:100000
x5
class(x5)
(x5 = 1:100000)   #only for learning purposes - assigns and prints together in one command

x6 <- 2   #default way of assigning a value to a variable ; another way is =
x6
class (x6)

x7 = rnorm(1000000)
x7
mean(x7)
sd(x7)
length(x7)
density(x7)
plot(density(x7))
hist(x7)
hist(x7, freq=F)
points(density(x7))
?points(density(x7))
?hist(x7, freq=F)

x8 = rnorm(100, mean = 60, sd = 10)
mean(x8)
sd(x8)
length(x8)
plot(density(x8))
hist(x8, freq = F)
points(density(x8))

library(e1071)   #loads library e1071
?kurtosis
kurtosis(x8)
skewness(x8)

x9 = runif(100, 30, 90)
x9
trunc(x9)
round(x9, 1)
floor (x9)
ceiling(x9)
?trunc
x10 = ceiling(x9)
x10
hist(x9, freq = F)
points(density(x9))

sort(x10)
sort(x10, decreasing = T)

mean(x10)
median(x10)
storage.mode(x10)
class(x10)
class(x10) == mode(x10)
?mode
?class
mode(x10)
?storage.mode
typeof(x10)

x10 [x10 > 60]
x10
x10[1:10]
x10[20:30]
x10[-c(1:20)]
x10[c(1,5,7)]
?c



#matrices
?matrix
is.matrix(x10)
is.vector(x10)
is.array(x10)

m1 = matrix(data = 1:24, nrow = 6, ncol = 4)
m1
dim(m1)
m2 = matrix(data = 1:104, ncol=8)
m2

m3 = matrix(data = 1:28, ncol = 4, byrow = T)   #, dimnames = list("a", "b", "c", "d"))
m3

colnames(m3) = month.abb[1:4]
rownames(m3) = paste('Product',1:7, sep='_')
m3

rowMeans(m3)
colMeans(m3)
rowSums(m3)
colSums(m3)
m1[ , 1:2]
m3[ , 1:2]
m3[c(1,3,5), ]
rowSums(m3[c(1,3,5), ])
m3[, c('Feb', 'Apr')]
m3
?rowSums
?rowsum
m3[1][1] = NULL
m3
logical(0)
logical(1)
logical(2)
?logical


#data.frame
n = 30   #number of students
rollno = paste('FMS2020_', 1:30, sep = '_')
sname = paste('Student', 1:30, sep = '@')

set.seed(123)   #sets the seed for RNG to 123
gender = sample(c('M', 'F'), size=n, replace = TRUE, prob = c(0.8, 0.2))
t1 = table(gender)
prop.table(t1)
?set.seed

set.seed(12)
college = sample(c('SRCC', 'FMS', 'IIM'), size=n, replace = TRUE, prob = c(0.4, 0.35, 0.25))
t2 = table(college)
prop.table(t2)


marks1 = round(rnorm(n=n, mean=60, sd=10), 0)
marks2 = round(rnorm(n=n, mean=55, sd=15), 0)

rollno; sname; gender; college; marks1; marks2
length(gender)

students = data.frame(rollno, sname, gender, college, marks1, marks2)
students
class(students)
head(students)
students$rollno
students[, c(2,5,6)]
students[, c('sname', 'marks1', 'marks2')]   #line 181 and 182 are exactly SAME

str(students)
summary(students)
quantile(students$marks1)
quantile(students$marks1, probs = seq(0, 1, 0.1))   #gives out marks for deciles
?seq
quantile(students$marks1, probs = seq(0, 1, 0.01))
seq(from=1, to=100, by=3)
seq(0,100,25)

summary(students)
str(students)
students$rollno = as.character(students$rollno)
students$sname = as.character(students$sname)
str(students)

head(students)
write.csv(students, 'fms.csv', row.names = F)
students2 = read.csv('fms.csv')
head(students2)
students3 = read.csv(file.choose())
head(students3)
str(students3)
students3$rollno = as.character(students3$rollno)
students3$sname = as.character(students3$sname)

students[students$marks1>60, ] #'sname']
students[students$gender=='F', ] #'sname']
students[students$gender=='F' & students$college=='SRCC', ] #'sname']
students[students$gender=='F' | students$college=='SRCC', ] #'sname']


library(dplyr)
#highest from all colleges
students %>% filter(gender=='M' & marks1 > 60)
#genderwise summary
students %>% group_by(gender) %>% summarise(mean(marks1), mean(marks2))
students %>% group_by(college) %>% summarise(max(marks1), max(marks2))
students %>% filter(college == 'FMS') %>% select(marks1, marks2)

     