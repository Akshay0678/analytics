#comment by starting #
#control+enterto execute command - its a comment

#?before function to seek help

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
seq(1, 10)
class(seq(1, 10))

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


# Uisng "dplyr" library
library(dplyr)
#highest from all colleges
students %>% filter(gender=='M' & marks1 > 60)
#All students with Gender Male and marks1 more than 60
#genderwise summary
students %>% group_by(gender) %>% summarise(mean(marks1), mean(marks2))
#mean marks of subject 1 and subject 2 of all students Gender-wise
students %>% group_by(college) %>% summarise(max(marks1), max(marks2))
students %>% filter(college == 'FMS') %>% select(marks1, marks2)

students %>% group_by(college, gender) %>% summarise(count_Total=n()) 
?n()
#n() is a dplyr count function

students %>% tally()
?tally()
students %>% summarise(n())
# 85 and 87 are equivalent. Tally() is a wrapper function for n()
students %>% group_by(college, gender) %>% summarise(count_Total=n(), mean(marks1), mean(marks2))

students %>% mutate(Total_Marks = marks1 + marks2)
?mutate
#mutate adds new variables and preserves existing.

students %>% transmute(sname, Total_Marks = marks1 + marks2)
#transmute adds new variables and drops existing

students %>% mutate(Total_Marks = marks1 + marks2) %>% arrange(Total_Marks)
?arrange
#arrange rows by variables, use a negative is decreasing order is required. By default, increasing.

students %>% mutate(Total_Marks = marks1 + marks2) %>% arrange(Total_Marks) %>% head(n=2)
?head
#prints first 2 rows

students %>% slice(seq(1,30,2)) #every alternate row is printed
?slice   #selects rows by position

students %>% sample_n(5)   #gives 5 random samples from the data
students %>% sample_frac(0.3)   #gives 30% samples by random

students %>% transmute(sname, Total_marks = marks1+marks2) %>% filter(Total_marks == max(Total_marks))
?filter
#students %>% transmute(sname, Total_marks = marks1+marks2) %>% summarise(top_n(2))
