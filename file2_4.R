#Graphs

mtcars
names(mtcars)
table(mtcars$cyl)
table(mtcars$cyl, mtcars$am)
?table
#cross tabulation and table creation

mtcars$mpg
#continuous data - histogram, box plot
hist(mtcars$mpg)
boxplot(mtcars$mpg, horizontal = T)
boxplot(mpg ~ gear, data=mtcars, col=2:4)

?boxplot
t1 = table(mtcars$gear)
t1
barplot(t1, col = 2:4)
barplot(c(10,3,5), col = 2:4)
pie(c(10,3,5), col = 2:4)

t2 = table(students$college)
barplot(t2, col = 3:5)

t3 = table(students$gender)
barplot(t3, col = 2:3)
title('this is a bar plot', sub = 'Subtitle')
pie(t3, labels = c('M', 'F'), edges = 400, radius = 1, density = NULL, angle = 90, border = 4, lty = NULL, col = 2:3)
?pie
