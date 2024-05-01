#5. Go to your R script and assign the values 3, 4, 5, 1, 2, 2, 8 to the object values_01 and the values 6, 5, 7, 8, 4, 6, NA to the object values_02.
#To create the two objects with the corresponding elements, we need the <- (assign) operator. Further, in order to tell R that several values belong together, we need the c() function:
  
values_01 <- c(3, 4, 5, 1, 2, 2, 8)
values_02 <- c(6, 5, 7, 8, 4, 6, NA)

#To check whether everything worked as expected, we can print out the results by just “executing” (i.e., writing their names in the syntax and running the lines of code with their names in) the names of the two objects:
values_01

## [1] 3 4 5 1 2 2 8

values_02

## [1]  6  5  7  8  4  6 NA

#6. Use the mean() function to calculate the mean of values_01 and values_02, respectively. If you do not get numeric results, use R‘s help() to find a way to get a result.

#As we have stored values_01 and values_02 as objects, we can directly execute the mean() function on each of them:
  
mean(values_01)
mean(values_02)

#However, if we try to calculate the mean of values_02 like above, we get a non-available (NA) result. We can access the function’s help file via ?mean or help(mean) and see that there is an argument called na.rm with its default on FALSE. This stands for “remove NAs”, and if we specify the argument as TRUE (i.e., na.rm = TRUE), we overwrite the default and edit the function in a way that missing values (NAs) are ignored. Therefore, the correct way to calculate the mean of values_02 is:
  
mean(values_02, na.rm = TRUE)


#7. Round the mean of values_01 to two decimals using round().
#We now need to nest functions. As R executes functions from the inside out, we need to place the mean() function inside the round() function. The round() function has another argument which specifies the decimals to round to. As we want two decimals, the code looks like this:


round(mean(values_01), digits = 2)



#8. Calculate the standard deviation of values_01 and values_02, respectively, by finding and applying a suitable function. Hint: Don‘t forget „“ in the help.search() function if you choose this way.

#If you do not know the name of an applicable function to execute a task that we want to have executed, there are several options to get information. On the one hand, browsing the internet will almost certainly provide you with all the information you need. However, similar to the help() function if we know the name of the function, we can also start search queries by topics within R:
  
  #In the lower right pane of RStudio, there is a search field at the upper right corner.
#The equivalent function for this search field is help.search(). Note, however, that you need to enclose your search term with "". This would look like this: help.search("standard deviation").

#When we browse for applicable functions to calculate the standard deviation, we can find the most commonly used, which is sd() in base R. To calculate the standard deviation of our two objects, we use the function equivalently to mean():'''
  
sd(values_01)

sd(values_02, na.rm = TRUE)


#Note that we could also include the na.rm = TRUE argument specification for values_01, i.e., sd(values_01, na.rm = TRUE). Since there are no missing values in values_01, the results are identical.'''

#9. Install and load the package psych. Find and apply a function in this package that „describes“ these objects, i.e., provides summary statistics for values_01 and values_02, respectively.

#To install and load the psych package, we run the following code:'''
  
install.packages("psych")
library(psych)

#Note that we need "" for the first, but not the second function. Also, we only need to install a package once, because R then downloads the package files to your harddrive. However, we need to load the package every time we open R again.

#Therefore, a useful way of making sure you always have the packages necessary for your syntax loaded is to put the code below at the beginning of your script and running these lines of code when you open your R session. In this example, we load just two packages, one of which is psych. Whenever you come across another package when extending your script, add that package into the p_load() function:'''
  
if(!"pacman" %in% rownames(installed.packages())) install.packages("pacman")
library(pacman)
pacman::p_load(psych, corrplot)

#Now we need a function to “describe” these objects in the psych package. There are several ways to find one:
  #We could use the browser or help.search() again.
#Open the Packages tab in the lower right pane, scroll down to the psych package and click on it. This opens the documentation of this package and lists all the entailed functions. Scrolling down to “D” shows you that there is a describe() function.

#Clicking on the functions name opens the Help tab again showing the function’s information. Applying it on the two objects produces the results below. Note that the psych:: notation ensures that we use the psych package’s describe() function. As you install more and more packages, there is a high probability to have several packages entailing functions with the same name, which can lead to unexpected problems in your analyses.'''

psych::describe(values_01)

##    vars n mean   sd median trimmed  mad min max range skew kurtosis  se
## X1    1 7 3.57 2.37      3    3.57 1.48   1   8     7  0.7    -0.99 0.9

psych::describe(values_02)

##    vars n mean   sd median trimmed  mad min max range skew kurtosis   se
## X1    1 6    6 1.41      6       6 1.48   4   8     4    0    -1.58 0.58


'''
10. Reproduce the mean() function yourself and name it mean_rebuilt. Hint: You might want to rely on other functions in your own function, e.g., a function to calculate a „sum“ and a way that helps to address only non-NA values like is.na().

As you know, the mean is the sum of a set of numbers divided by the amount of numbers that went into calculating their sum.

In R, there is the sum() function to calculate the sum of a vector’s elements. This can quite easily build the first part of our function mean_rebuilt().

However, for the second part - the amount of numbers - we cannot simply use length() as this function includes NAs when determining the length of the vector, which are not included in the calculation of the sum.

Therefore, we need to take another approach. The function is.na() returns the values TRUE or FALSE depending on whether the argument in the function is a missing value or not. Applied to a vector, the result is a vector of TRUEs and FALSEs, i.e., a Boolean vector. The values TRUE or FALSE themselves also represent the numbers 1 and 0, respectively. Therefore, we can do calculations with them, like counting (i.e., calculating the sum of 1s) the instances of TRUEs. This allows us to define our function correctly:
'''
  
mean_rebuilt <- function(x) {
    sum(x, na.rm = TRUE) / sum(!is.na(x))
  }

"11. Test mean_rebuilt() on values_01 and values_02.

As we saved our function in the Environment (see upper right pane), we can readily apply it like built-in functions:
"
mean_rebuilt(values_01)

## [1] 3.571429

mean_rebuilt(values_02)

## [1] 6

"Note that we did not specify an na.rm argument (although we could have) but included this automatically in our function definition. Therefore, we do not have to specify the argument when calling our function.
"
"At-Home Tasks & Solutions
1. Feel free to go over today’s content and re-do the In-Class Tasks again to get more familiar with R.

Just to remind you: R requires practice. Take your time and invest the effort of going over the exercise contents and doing the tasks yourself - you will benefit from it in the long term, both in the context of the MMA course and your future studies / jobs.

In case you were not able to solve a task or want to see potentially other ways to approach it, the RMarkdowns of each exercise are your go-to files. RMarkdown is another R file type, which allows you to produce and/or read both text and code in a more nicely formatted way to copy-paste in your script. The RMarkdowns of each session - like this one - contain both the solutions for the respective In-Class Tasks as well as At-Home Tasks.
2. Download the referenced Cheat Sheet: https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf.

Open the link and download the file. There is an overview of many of the core functionalities of (base) R at a single glance. You might use it as your go-to manual until it becomes second nature to you.

At this point, one could save the current workspace to continue from here next week. However, as you probably do that when closing your RStudio, there is no need for you to do that manually.
"
save.image("Workspace_Session01.RData")
