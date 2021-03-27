## Assignment 2
## By- Amisha Murarka

#Solution 1
score <- c(4,2)
names(score) <- c("France","Croatia")
if (score[1]>score[2]) {
  paste("Team",names(score[1]),"Wins")
} else {
  paste("Team",names(score[2]),"Wins")
}
# Output: [1] "France"

#Solution 2
# The mtcars data set has several factor variables. However, R is reading them as numeric. 
# Please convert them into factors using a for loop. Please use column 8 to 11 for the loop.
str(mtcars)
mtcars
for (i in c(2,8:11)) {
  mtcars[,i] <- as.factor(mtcars[,i])
}
str(mtcars)
# Output:
# 'data.frame':	32 obs. of  11 variables:
# $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
# $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
# $ disp: num  160 160 108 258 360 ...
# $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
# $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
# $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
# $ qsec: num  16.5 17 18.6 19.4 17 ...
# $ vs  : Factor w/ 2 levels "0","1": 1 1 2 2 1 2 1 2 2 2 ...
# $ am  : Factor w/ 2 levels "0","1": 2 2 2 1 1 1 1 1 1 1 ...
# $ gear: Factor w/ 3 levels "3","4","5": 2 2 2 1 1 1 1 2 2 2 ...
# $ carb: Factor w/ 6 levels "1","2","3","4",..: 4 4 1 1 2 1 4 2 2 4 ...

# Solution 3
## Function Definitions
# Write a function to get percentage of NAs in each column.
na_percent <- function(data)
{
  #mean(is.na(data))
  colSums(is.na(data))/prod(dim(data))*100
}
# Write a function to get percentage of NAs in each row.
na_percent_row <- function(data)
{
  row_nas <- c()
  for(i in 1:nrow(data)){
    a <- mean(is.na(data[i,])) * 100
    row_nas <- c(row_nas, a) 
  }
  row_nas
}
# Write a function to get summary of numeric columns (use summary function) 
# such as THC, CO, CO2 etc. in data set. In same function try to generate boxplot using base R.
summary_numeric <- function(data){
  df <- data.frame(matrix(ncol = 0, nrow = 0))
  numeric_cols <- apply(data, 2, is.numeric)
  for(i in 1:ncol(data)){
    if(numeric_cols[i] == TRUE){
      df <- cbind(df, data[,i])
    }
  }
  summary(df)
  # #input <- data[,c('THC','CO','CO2','NOx','CH4','N2O')]
  input <- data[,c('THC','Tested.Transmission.Type')]
  boxplot(THC ~ Tested.Transmission.Type, data = data)
  boxplot(THC ~ Vehicle.Type, data = data)
  boxplot(Test.Veh.Displacement.L ~ Vehicle.Type, data = data)
}
summary_numeric(data)
# Write a function to create histograms of numeric columns such as THC, CO, CO2 etc. in data set. 
# Use ggpot2 to generate figure.
draw_hist <- function(df) {
  ggplot(df, aes(x=CO)) + geom_histogram(binwidth = 0.5) 
}

## Calling functions
library(readxl)
data <- readxl::read_excel("C:/Users/Amisha/Desktop/Dataset - 2.1.xlsx")
# Write a function to get percentage of NAs in each column.
na_percent(data)
# Write a function to get percentage of NAs in each row.
na_percent_row(data)
# Write a function to get summary of numeric columns (use summary function) 
# such as THC, CO, CO2 etc. in data set. In same function try to generate boxplot using base R.
summary_numeric(data)
# Write a function to create histograms of numeric columns such as THC, CO, CO2 etc. in data set. 
# Use ggpot2 to generate figure.
library(ggplot2)
draw_hist(data)

# Solution 4

# Data set contains date columns. All of these date columns are untidy. 
# Please create a better formatted dataset. 
# Date should be dd/mm/yyyy in final format. Use column 2, 3 and 5 only

mydata <- read.csv("Data set - 2.2.csv")
str(mydata)
library(lubridate) 
# mydata$First.FD.Date <- mdy(mydata$First.FD.Date) 
# mydata$First.FD.Date <- format(mydata$First.FD.Date, "%d-%m-%Y")
# For difference in format
# parse_date_time(mydata$First.FD.Date, orders = c('mdy', 'dmy'))
# str(mydata)
for(i in c(2,3,5)) {
  mydata[,i] <- mdy(mydata[,i])
  mydata[,i] <- format(mydata[,i], "%d-%m-%Y")
}
str(mydata)

# Date of birth column contains month in string format. 
# Please create a tidy data column with months in numeric format. 
# Now your data should be similar to previous question.

# Buggy code
# mydata$Date.of.Birth <- as.Date(mydata$Date.of.Birth, format = "%d-%b-%y")
# mydata$Date.of.Birth <- format(mydata$Date.of.Birth, "%d-%m-%Y")
# The above code gives wrong year conversions for eg 2065 for 65 instead of 1965
# Date of birth cannot be greater than current date
# Fix 1 below
mydata$Date.of.Birth <- as.Date(mydata$Date.of.Birth, "%d-%b-%y")
mydata$Date.of.Birth <- as.Date(ifelse(mydata$Date.of.Birth > Sys.Date(), format(mydata$Date.of.Birth, "19%y-%m-%d"), format(mydata$Date.of.Birth)))
mydata$Date.of.Birth <- format(mydata$Date.of.Birth, "%d-%m-%Y")
str(mydata)

# Convert all dates into Date format; they are currently in character variable format.

for(i in c(2,3,5,8)) {
  mydata[,i] <- dmy(mydata[,i])
}
str(mydata)

# Create a new column age based on date of birth column and First FD column. 
# Date format is necessary to do basic arithmetic.
library(eeptools)
age <- floor(age_calc(na.omit(mydata$Date.of.Birth), enddate = na.omit(mydata$First.FD.Date), units = "years", precise = TRUE))
mydata <- cbind(mydata, age)
mydata
summary(mydata)
  