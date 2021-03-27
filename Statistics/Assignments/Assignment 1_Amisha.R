#Q1. What is the basic difference and similarity between a vector and a matrix?
# Difference: The basic difference lies in its structure. 
# Vector has a one dimensional structure whereas a matrix has more than one dimensions. 
# Similarity: Both vectors and matrix can contain data of the same datatype.

#Q2. What is the basic difference and similarity between a data frame and a matrix?
# Similarity: A data frame and matrix are data structures arranged in a row column fashion with multiple dimensions 
# Difference: A data frame can have values of different data types whereas a matrix can only contain data of the same datatype.

#Q3. Create a vector using (15, TRUE, “World”). What happened to your result?
v <- c(15, TRUE, "World")
v
class(v)
#The class of the vector was converted to character because of the presence of a character value. 
#The numeric and boolean values were also converted to character
#The reason for the same being that a vector can only contain data of the same type
#[1] "15"    "TRUE"  "World" 
#[1] "character"

#Q4. John’s score in final semester for the three subjects (95, 91, 88). 
#Subjects are Statistics, Linear Algebra and Calculus. 
#Using these create a vector and give names to all elements of the vector based on their subjects.
#Q5.Check types (character or numeric) of the vector you created. 
scores <- c(95,91,88)
class(scores)
#[1] "numeric"
subjects <- c("Statistics","Linear Algebra","Calculus")
class(subjects)
#[1] "character"
names(scores)<-subjects
scores
#Statistics Linear Algebra       Calculus 
#        95             91             88 
class(scores)
#[1] "numeric"

#Q6. You have three students in your class.
#Create a matrix using their score in above mentioned subjects (question 4) Student 1 (95, 91, 88), Student 2(96, 94, 97), Student 3(88, 98, 85).
#Create a matrix and also put column and row names.
stud1 <- c(95,91,88)
stud2 <- c(96,94,97)
stud3 <- c(88,95,85)
scores <- c(stud1,stud2,stud3)
Scores_matrix <- matrix(scores, nrow = 3, byrow = TRUE)
Scores_matrix
#      [,1] [,2] [,3]
# [1,]   95   91   88
# [2,]   96   94   97
# [3,]   88   95   85
rownames(Scores_matrix) <- c("Student 1","Student 2","Student 3")
colnames(Scores_matrix) <- subjects
Scores_matrix
#           Statistics Linear Algebra Calculus
# Student 1         95             91       88
# Student 2         96             94       97
# Student 3         88             95       85

# Q7. Convert the created matrix into a data frame.
Scores_df <- as.data.frame(Scores_matrix)
Scores_df
#           Statistics Linear Algebra Calculus
# Student 1         95             91       88
# Student 2         96             94       97
# Student 3         88             95       85
class(Scores_df)
#[1] "data.frame"

#Q8. Create three vectors using 5 countries (your choice) from the below given website. 
#First vector should be country names, second vector should be the total number of cases and third vector should contain total number of deaths. 
#Create a data frame using these vectors. 
country <- c("USA","India","Brazil","Russia","UK")
cases <- c(28523524,10963394,10030626,4125598,4083242)
deaths <- c(505309,156123,243610,81926,119387)
covid <- data.frame(country,cases,deaths)
covid
#   country    cases deaths
# 1     USA 28523524 505309
# 2   India 10963394 156123
# 3  Brazil 10030626 243610
# 4  Russia  4125598  81926
# 5      UK  4083242 119387
str(covid)
# 'data.frame':	5 obs. of  3 variables:
#   $ country: chr  "USA" "India" "Brazil" "Russia" ...
#   $ cases  : num  28523524 10963394 10030626 4125598 4083242
#   $ deaths : num  505309 156123 243610 81926 119387

#Q9. Please read mtcar car dataset from R. 
# It is an in built dataset. Check the structure of the data set.
# Also, if required, please convert them into their appropriate data types (character, logical, factor, etc).
# Save your results into a new data frame using a newname.
mtcars
str(mtcars)
# 'data.frame':	32 obs. of  11 variables:
# $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
# $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
# $ disp: num  160 160 108 258 360 ...
# $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
# $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
# $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
# $ qsec: num  16.5 17 18.6 19.4 17 ...
# $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
# $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
# $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
# $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
new_mtcars <- transform(mtcars, vs = as.factor(vs),am = as.factor(am),gear = as.factor(gear),cyl = as.factor(cyl))
str(new_mtcars)
# 'data.frame':	32 obs. of  11 variables:
#   $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
# $ cyl : Factor w/ 3 levels "4","6","8": 2 2 1 2 3 2 3 1 1 2 ...
# $ disp: num  160 160 108 258 360 ...
# $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
# $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
# $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
# $ qsec: num  16.5 17 18.6 19.4 17 ...
# $ vs  : Factor w/ 2 levels "0","1": 1 1 2 2 1 2 1 2 2 2 ...
# $ am  : Factor w/ 2 levels "0","1": 2 2 2 1 1 1 1 1 1 1 ...
# $ gear: Factor w/ 3 levels "3","4","5": 2 2 2 1 1 1 1 2 2 2 ...
# $ carb: Factor w/ 6 levels "1","2","3","4",..: 4 4 1 1 2 1 4 2 2 4 ...
#vs stands for Engine(v-shaped/straight), am for transmission type (automatic/manual)
#gear - Number of forward gears, cyl - number of cylinders