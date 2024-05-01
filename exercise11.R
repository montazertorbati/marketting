
MMA Exercise Session 01 R Markdown
Felix Lang
OVGU - Otto von Guericke University
Joshua Schramm
OVGU - Otto von Guericke University
Prof. Dr. Marcel Lichters
OVGU - Otto von Guericke University
2024-04-17
Introduction to R, Data & Measurement
Part I / IV
Solutions to In-Class & At-Home Tasks as well as Additional Information
In-Class Tasks & Solutions
1. Open RStudio.

Opening RStudio is easily done by running your RStudio desktop application. Opening RStudio will automatically run R as well.

Note, however, that you need to have installed both R and RStudio before.
2. Create a new R project called „MMA_Exercise_Rproject“ in your preferred folder location (e.g., in your course material folder for the MMA exercise).

You can access the R New Project Wizard via multiple ways:

    Use the tab File New Project in the upper left corner.

    Use the R project icon available in upper right corner of the interface Select New Project… to create a new project.

Navigate through the R New Project Wizard:

    Select New Directory (at least in most cases). This allows to define a file path on your harddrive where R stores the created project and all files of the project (scripts, data, workspace, …) in the next window.

    Besides defining your file path (also called working directory), type in the name for your R project.

R then creates a folder, and in that folder you find the newly created project for you to open it whenever you want.
3. Create and save a new R script called „MMA_Exercise_01_RIntroDataMeasurement_Script“. You may want to create a new folder in your project working directory (e.g., „01_RIntroDataMeasurement“ – be sparse with spaces in names).

You can open a new R script via multiple ways:

    Click the File tab in the upper left corner, hover over New File and select R Script.

    Click on the icon below the File tab and select R Script.

    Press Ctrl + Shift + N (Windows OS).

Ideally, you directly save that script under the suggested name. As the MMA exercise content and tasks are organized in chapters (like the lecture, beyond the sessions themselves), you might want to create a new folder on your harddrive in your project working directory where you save the created script. You can use this script for all sessions that cover the chapter / topic Introduction to R, Data & Measurement (i.e., sessions 1 - 3). For new topics, you may want to create a new script and folder to neatly organize the files according to their belonging to the different chapters.

    Note: A general suggestion is to be sparse with spaces when working with R. Although there is usually a way to work it, R often treats spaces in ways that create problems, so it is better to avoid it in the first place by being mindful about hitting the space bar.

4. Go back to your script and do the following:
1. Type in: # This is my header for this script (or replace this text with a useful header)
2. Type in a new line: 2 + 3
3. Type in a new line: 2 == 3
4. Type in a new line: c(2, 3)
5. Type in a new line: mean(c(2, 3))
6. Type in a new line: result <- 2 + 3
7. Type in a new line: result
8. Type in a new line: Result
9. Highlight all the code and execute it (either using the Run button in the upper right corner of the source editor or by using the shortcut Ctrl + Enter (Windows & Linux) / Cmd + Enter (MacOS). Try to get a first understanding of what R is doing here.

Now it’s actually time to write some code. Just copy and paste the syntax highlighted in grey into your script and run the code as described in task 4.9.

    Note whenever something is highlighted like this in a Markdown, then the text either represents syntax that can be executed in R or it stands for elements contained in R, e.g., packages or functions.

These tasks are just supposed for you to get a first glimpse into the functioning of R. Therefore, there is no real “solution” to discuss here, as code and what it stands for were discussed in the exercise session.

However, just to show what the syntax does, see below:

# This is my header for this script
2 + 3

2==3

c(2 ,3)

mean(c(2, 3))

result <- 2 + 3
result

Result

5. Go to your R script and assign the values 3, 4, 5, 1, 2, 2, 8 to the object values_01 and the values 6, 5, 7, 8, 4, 6, NA to the object values_02.

To create the two objects with the corresponding elements, we need the <- (assign) operator. Further, in order to tell R that several values belong together, we need the c() function:

values_01 <- c(3, 4, 5, 1, 2, 2, 8)
values_02 <- c(6, 5, 7, 8, 4, 6, NA)

To check whether everything worked as expected, we can print out the results by just “executing” (i.e., writing their names in the syntax and running the lines of code with their names in) the names of the two objects:

values_01

values_02

6. Use the mean() function to calculate the mean of values_01 and values_02, respectively. If you do not get numeric results, use R‘s help() to find a way to get a result.

As we have stored values_01 and values_02 as objects, we can directly execute the mean() function on each of them:

mean(values_01)

mean(values_02)

However, if we try to calculate the mean of values_02 like above, we get a non-available (NA) result. We can access the function’s help file via ?mean or help(mean) and see that there is an argument called na.rm with its default on FALSE. This stands for “remove NAs”, and if we specify the argument as TRUE (i.e., na.rm = TRUE), we overwrite the default and edit the function in a way that missing values (NAs) are ignored. Therefore, the correct way to calculate the mean of values_02 is:

mean(values_02, na.rm = TRUE)

7. Round the mean of values_01 to two decimals using round().

We now need to nest functions. As R executes functions from the inside out, we need to place the mean() function inside the round() function. The round() function has another argument which specifies the decimals to round to. As we want two decimals, the code looks like this:

round(mean(values_01), 2)

8. Calculate the standard deviation of values_01 and values_02, respectively, by finding and applying a suitable function. Hint: Don‘t forget „“ in the help.search() function if you choose this way.

If you do not know the name of an applicable function to execute a task that we want to have executed, there are several options to get information. On the one hand, browsing the internet will almost certainly provide you with all the information you need. However, similar to the help() function if we know the name of the function, we can also start search queries by topics within R:

    In the lower right pane of RStudio, there is a search field at the upper right corner.
    The equivalent function for this search field is help.search(). Note, however, that you need to enclose your search term with "". This would look like this: help.search("standard deviation").

When we browse for applicable functions to calculate the standard deviation, we can find the most commonly used, which is sd() in base R. To calculate the standard deviation of our two objects, we use the function equivalently to mean():

sd(values_01)

sd(values_02, na.rm = TRUE)

Note that we could also include the na.rm = TRUE argument specification for values_01, i.e., sd(values_01, na.rm = TRUE). Since there are no missing values in values_01, the results are identical.
9. Install and load the package psych. Find and apply a function in this package that „describes“ these objects, i.e., provides summary statistics for values_01 and values_02, respectively.

To install and load the psych package, we run the following code:

install.packages("psych")
library(psych)

Note that we need "" for the first, but not the second function. Also, we only need to install a package once, because R then downloads the package files to your harddrive. However, we need to load the package every time we open R again.

Therefore, a useful way of making sure you always have the packages necessary for your syntax loaded is to put the code below at the beginning of your script and running these lines of code when you open your R session. In this example, we load just two packages, one of which is psych. Whenever you come across another package when extending your script, add that package into the p_load() function:

if(!"pacman" %in% rownames(installed.packages())) install.packages("pacman")
library(pacman)
pacman::p_load(psych, corrplot)

Now we need a function to “describe” these objects in the psych package. There are several ways to find one:

    We could use the browser or help.search() again.
    Open the Packages tab in the lower right pane, scroll down to the psych package and click on it. This opens the documentation of this package and lists all the entailed functions. Scrolling down to “D” shows you that there is a describe() function.

Clicking on the functions name opens the Help tab again showing the function’s information. Applying it on the two objects produces the results below. Note that the psych:: notation ensures that we use the psych package’s describe() function. As you install more and more packages, there is a high probability to have several packages entailing functions with the same name, which can lead to unexpected problems in your analyses.

psych::describe(values_01)

psych::describe(values_02)

10. Reproduce the mean() function yourself and name it mean_rebuilt. Hint: You might want to rely on other functions in your own function, e.g., a function to calculate a „sum“ and a way that helps to address only non-NA values like is.na().

As you know, the mean is the sum of a set of numbers divided by the amount of numbers that went into calculating their sum.

In R, there is the sum() function to calculate the sum of a vector’s elements. This can quite easily build the first part of our function mean_rebuilt().

However, for the second part - the amount of numbers - we cannot simply use length() as this function includes NAs when determining the length of the vector, which are not included in the calculation of the sum.

Therefore, we need to take another approach. The function is.na() returns the values TRUE or FALSE depending on whether the argument in the function is a missing value or not. Applied to a vector, the result is a vector of TRUEs and FALSEs, i.e., a Boolean vector. The values TRUE or FALSE themselves also represent the numbers 1 and 0, respectively. Therefore, we can do calculations with them, like counting (i.e., calculating the sum of 1s) the instances of TRUEs. This allows us to define our function correctly:

mean_rebuilt <- function(x) {
  sum(x, na.rm = TRUE) / sum(!is.na(x))
}

11. Test mean_rebuilt() on values_01 and values_02.

As we saved our function in the Environment (see upper right pane), we can readily apply it like built-in functions:

mean_rebuilt(values_01)

mean_rebuilt(values_02)

Note that we did not specify an na.rm argument (although we could have) but included this automatically in our function definition. Therefore, we do not have to specify the argument when calling our function.
At-Home Tasks & Solutions
1. Feel free to go over today’s content and re-do the In-Class Tasks again to get more familiar with R.

Just to remind you: R requires practice. Take your time and invest the effort of going over the exercise contents and doing the tasks yourself - you will benefit from it in the long term, both in the context of the MMA course and your future studies / jobs.

In case you were not able to solve a task or want to see potentially other ways to approach it, the RMarkdowns of each exercise are your go-to files. RMarkdown is another R file type, which allows you to produce and/or read both text and code in a more nicely formatted way to copy-paste in your script. The RMarkdowns of each session - like this one - contain both the solutions for the respective In-Class Tasks as well as At-Home Tasks.
2. Download the referenced Cheat Sheet: https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf.

Open the link and download the file. There is an overview of many of the core functionalities of (base) R at a single glance. You might use it as your go-to manual until it becomes second nature to you.

    At this point, one could save the current workspace to continue from here next week. However, as you probably do that when closing your RStudio, there is no need for you to do that manually.


save.image("Workspace_Session01.RData")


