
MMA Exercise Session 02 R Markdown
Felix Lang
OVGU - Otto von Guericke University
Joshua Schramm
OVGU - Otto von Guericke University
Prof. Dr. Marcel Lichters
OVGU - Otto von Guericke University
2024-04-17
Introduction to R, Data & Measurement
Part II / IV
Solutions to In-Class & At-Home Tasks as well as Additional Information

    Note: We’ll continue here where we finished at the end of the last exercise session. Therefore, tasks will address objects that you have created previously. If you have cleared your Environment in the meantime, just run the code of last session’s RMarkdown (or load it if you have saved it) to create the workspace necessary to continue working on this session’s tasks. The code belows loads the workspace using the name at the end of last week’s RMarkdown - however, yours might differ:

load("Workspace_Session01.RData")

In-Class Tasks & Solutions
1. Save values_01 as an rds-file using saveRDS() in the folder on your harddrive you created for this session (e.g., „01_RIntroDataMeasurement“).

Find the task’s solution below:

saveRDS(object = values_01, file = "01_RIntroDataMeasurement/values_01.rds")

Note that we specified the extension of the R projects working directory to the folder “01_RIntroDataMeasurement”. The / then tells R to save your object in that folder under the name specified after the /. You can also specify a chain of folders or even a completely different folder (see getwd() and set() for a more convenient long-term solution.
2. Remove values_01 from the current Environment in R.

This is just done with the rm() function:

rm(values_01)

This function is useful to clean up your Environment once in a while. To delete all objects from your Environment, use rm(list = ls()).
3. Load the rds-file saved on your harddrive using readRDS() back into your R session and store it again as values_01. You can delete the file from your harddrive now.

As you have stored values_01 on your harddrive, you can load it in easily with the readRDS() function:

values_01 <- readRDS("01_RIntroDataMeasurement/values_01.rds")

Note that you have to specify the folder location again for R to find the file you want to load to your Environment. Also, in order to have this file permanently accessible in your Environment again, you have to assign it to a name and create an object.

Further, as this task was for exercise purposes only, you can delete the rds-file from your harddrive. However, you have to do that manually.
4. Clear the current R workspace / Environment from all currently saved objects.

As the objects created until now are not very purposeful and therefore only for demonstration purposes, you can clear your R Environment:

rm(list = ls())

5. Create three numeric vectors of length 10:
1. Assign the values of 1 to 10 to the vector my_vector_1. Hint: Use the : sequence operator.

To create my_vector_1 we could use the c() function again, placing the numbers 1 to 10 in the parenthesis. However, there is a more elegant way using :, which basically serves as the function of producing a sequence of numbers from the argument before to after the : in ascending (or descending) order, already as a vector. Therefore, we don’t need the c() anymore, just <-:

my_vector_1 <- 1:10

2. Assign the sequence of 1 to 5 twice to the vector my_vector_2. Hint: Use the rep() function.

The function rep() replicates the values of x (its first argument) in a way specified by the other argument(s). As always, if you want to understand the function, use?rep,F1` or your search browser to get more information.

Here, we want to create the sequence of 1 to 5 and replicate the whole sequence. Therefore, we can define the argument x as a vector using :, and specifying times = 2:

my_vector_2 <- rep(1:5, times = 2)

3. Assign the values of 1 to 5 each twice to the vector my_vector_3. Hint: Use the rep() function.

Here, we just replace the times argument with each = 2 to specify that each element of 1:5 should be repeated twice instead of the whole sequence:

my_vector_3 <- rep(1:5, each = 2)

To check our results, we can just execute the names of the three vectors:

my_vector_1

##  [1]  1  2  3  4  5  6  7  8  9 10

my_vector_2

##  [1] 1 2 3 4 5 1 2 3 4 5

my_vector_3

##  [1] 1 1 2 2 3 3 4 4 5 5

Generally, there are more variations of rep() as well as other functions to produce sequences (e.g., seq()) or other collections of values (e.g., rnorm()) which can be very helpful to quickly produce or simulate data.
6. Create a character vector of length 10 called my_chr containing the strings „Group1“ and „Group2“ in alternation. Hint: Use the rep() function.

To create a character vector containing the values “Group1” and “Group2” in alternation, we can use rep() again, just specifying x as the vector containing the two character strings and replicate it five times:

my_chr <- rep(c("Group1", "Group2"), times = 5)
my_chr

##  [1] "Group1" "Group2" "Group1" "Group2" "Group1" "Group2" "Group1" "Group2"
##  [9] "Group1" "Group2"

7. In my_chr, replace the 9th element with „Gr1“ and the 10th element with „Gr2“.

To access (specific) elements of a vector, we can specify their position in [] behind the name of the vector. To replace those, we just need to assign new values to those elements using <-:

my_chr[c(9, 10)] <- c("Gr1", "Gr2")
my_chr

##  [1] "Group1" "Group2" "Group1" "Group2" "Group1" "Group2" "Group1" "Group2"
##  [9] "Gr1"    "Gr2"

8. Convert the vector my_chr to a factor called my_factor. Check its levels and the frequency of each level.

To convert a character vector (or any other vector class) to a factor, we need a coercion function, in this case as.factor() (or just factor()):

my_factor <- as.factor(my_chr)

To access its levels (i.e., the categories), we just apply levels(). To see how many elements fall into each category, table() does the trick:

levels(my_factor)

## [1] "Gr1"    "Gr2"    "Group1" "Group2"

table(my_factor)

## my_factor
##    Gr1    Gr2 Group1 Group2 
##      1      1      4      4

9. Overwrite my_factor so that it only contains the two levels and labels „Group1“ and „Group2“. Check the factor() function‘s help page to identify and apply a way to „merge levels“. See whether you were successful.

As usual, ?factor gives us the help page for the function. There we see that we - when creating a factor - can assign different levels of the soon-to-be factor to the same labels and thereby merging levels. To do that, we need the levels and labels arguments:

my_factor <- factor(my_chr, 
                    levels = c("Group1", "Gr1", "Group2", "Gr2"),
                    labels = c("Group1", "Group1", "Group2", "Group2"))
levels(my_factor)

## [1] "Group1" "Group2"

table(my_factor)

## my_factor
## Group1 Group2 
##      5      5

Alternatively, we could just execute levels(my_factor) <- c("Group1", "Group2", "Group1", "Group2") to overwrite the levels Gr1 and Gr2 with “Group1” and “Group2”, respectively.
10. Combine the three vectors my_vector_1, my_vector_2 and my_vector_3 to a matrix called red_pill. Check whether red_pill is really a matrix.

To create red_pill, we just need to “glue” the three vectors together side by side. The function cbind() (“column bind”) does exactly that. “Asking” R the Boolean function is.matrix(), we see that red_pill` is indeed a matrix:

red_pill <- cbind(my_vector_1, my_vector_2, my_vector_3)
red_pill

##       my_vector_1 my_vector_2 my_vector_3
##  [1,]           1           1           1
##  [2,]           2           2           1
##  [3,]           3           3           2
##  [4,]           4           4           2
##  [5,]           5           5           3
##  [6,]           6           1           3
##  [7,]           7           2           4
##  [8,]           8           3           4
##  [9,]           9           4           5
## [10,]          10           5           5

is.matrix(red_pill)

## [1] TRUE

Alternatively, calling red_pill’s class we see that red_pill is both a matrix and an array. This is because a matrix is just a 2-dimensional array..

class(red_pill)

## [1] "matrix" "array"

    Note that if we would have also included the character vector my_chr with the other three vectors when creating a matrix, the matrix would be of the class chr instead of being numeric, as character being the “lowest” level of elements contained determine the class and “overwrite” the other numeric values to characters as well.

11. Create a new matrix called blue_pill which contains the first column of red_pill in reversed order (i.e., the values of 10 to 1) as well as the second and third columns without any manipulations.

To create blue_pill, we can just make it a copy of red_pill and overwrite the first column with the vector / sequence 10:1. To address the first column, we use the [,] notation with the first entry left blank to tell R to use all rows and the second entry being equal to 1 to indicate the first column:

blue_pill <- red_pill
blue_pill[, 1] <- 10:1
blue_pill

##       my_vector_1 my_vector_2 my_vector_3
##  [1,]          10           1           1
##  [2,]           9           2           1
##  [3,]           8           3           2
##  [4,]           7           4           2
##  [5,]           6           5           3
##  [6,]           5           1           3
##  [7,]           4           2           4
##  [8,]           3           3           4
##  [9,]           2           4           5
## [10,]           1           5           5

Alternatively, we could cbind() the vector / sequence 10:1 together with the second and third columns of red_pill. Note, however, that this approach results in blue_pill having a non-existent name for the first column as we did not specify a name for it:

blue_pill <- cbind(10:1, red_pill[, c(2, 3)])
blue_pill

##          my_vector_2 my_vector_3
##  [1,] 10           1           1
##  [2,]  9           2           1
##  [3,]  8           3           2
##  [4,]  7           4           2
##  [5,]  6           5           3
##  [6,]  5           1           3
##  [7,]  4           2           4
##  [8,]  3           3           4
##  [9,]  2           4           5
## [10,]  1           5           5

colnames(blue_pill)

## [1] ""            "my_vector_2" "my_vector_3"

We could just assign a value to the first column afterwards (although not necessary for our purposes):

colnames(blue_pill)[1] <- "my_vector_1"
colnames(blue_pill)

## [1] "my_vector_1" "my_vector_2" "my_vector_3"

12. Double the values in the second column of blue_pill.

To do that, we just assign the current second column of the matrix multiplied by 2 (note that this multiplies each element by 2 as this column itself is a vector) to the second column again:

blue_pill[, 2] <- blue_pill[, 2] * 2
blue_pill

##       my_vector_1 my_vector_2 my_vector_3
##  [1,]          10           2           1
##  [2,]           9           4           1
##  [3,]           8           6           2
##  [4,]           7           8           2
##  [5,]           6          10           3
##  [6,]           5           2           3
##  [7,]           4           4           4
##  [8,]           3           6           4
##  [9,]           2           8           5
## [10,]           1          10           5

13. Create a new matrix called morpheus which contains only the first two columns of blue_pill.

There are, as usual, several ways to do that. One straighforward approach is to just assign the first to columns of blue_pill - indicated by [, c(1, 2)] - to the new matrix:

morpheus <- blue_pill[, c(1, 2)]
morpheus

##       my_vector_1 my_vector_2
##  [1,]          10           2
##  [2,]           9           4
##  [3,]           8           6
##  [4,]           7           8
##  [5,]           6          10
##  [6,]           5           2
##  [7,]           4           4
##  [8,]           3           6
##  [9,]           2           8
## [10,]           1          10

Alternatively, we could just drop the third column of blue_pill with the - sign:

morpheus <- blue_pill[, -3]
morpheus

##       my_vector_1 my_vector_2
##  [1,]          10           2
##  [2,]           9           4
##  [3,]           8           6
##  [4,]           7           8
##  [5,]           6          10
##  [6,]           5           2
##  [7,]           4           4
##  [8,]           3           6
##  [9,]           2           8
## [10,]           1          10

At-Home Tasks & Solutions
1. Create a 10-by-10 matrix called my_matrix that contains the values of 1 to 100 so that each column‘s elements increase by 10 from row to row (e.g., column 1: 1, 11, 21, …; column 2: 2, 12, 22, …).

To create my_matrix, we just use the matrix() function. The dimensionality of the matrix is defined with the nrow and ncol arguments, in this case 10 each. Note that only one of those arguments would suffice here as the specification of the other already defines my_matrix unambiguously.

For the data to store in my_matrix, we need the values of 1 to 100. Here, the : operator is again a quick way of producing this sequence as a vector. Note that the : operator does not require the c() function to create a vector.

Lastly, to achieve that each column’s elements increase by 10 from row to row, we specify the byrow argument as TRUE, so that the first row contains the values 1 to 10, the second 11 to 20, and so on:

my_matrix <- matrix(
  data = 1:100,
  nrow = 10, ncol = 10,
  byrow = TRUE
)

2. Have a look at the 1st and 10th column of my_matrix to see whether you were successful. Calculate the mean of the 1st column.

To print the 1st and the 10th column, we use the [ , ] notation. We leave the row index empty to print all rows of the specified columns. As we want to print only the 1st and 10th column, the quickest way is to use the c() function to indicate the columnn indices:

my_matrix[, c(1, 10)]

##       [,1] [,2]
##  [1,]    1   10
##  [2,]   11   20
##  [3,]   21   30
##  [4,]   31   40
##  [5,]   41   50
##  [6,]   51   60
##  [7,]   61   70
##  [8,]   71   80
##  [9,]   81   90
## [10,]   91  100

To calculate the mean of the first column, we just wrap around the mean() function (without column 10):

mean(my_matrix[, 1])

## [1] 46

3. Overwrite my_matrix with itself, but reverse the column order (i.e., the 10th column becomes the 1st, the 9th becomes the 2nd, …).

Again, we use the [ , ] notation with an empty row index. To reverse the column order, we can use the : operator again, but this time from 10 to 1 to create the descending sequence. To overwrite my_matrix, we need to save the re-ordered matrix as my_matrix again:

my_matrix <- my_matrix[, 10:1]
my_matrix

##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
##  [1,]   10    9    8    7    6    5    4    3    2     1
##  [2,]   20   19   18   17   16   15   14   13   12    11
##  [3,]   30   29   28   27   26   25   24   23   22    21
##  [4,]   40   39   38   37   36   35   34   33   32    31
##  [5,]   50   49   48   47   46   45   44   43   42    41
##  [6,]   60   59   58   57   56   55   54   53   52    51
##  [7,]   70   69   68   67   66   65   64   63   62    61
##  [8,]   80   79   78   77   76   75   74   73   72    71
##  [9,]   90   89   88   87   86   85   84   83   82    81
## [10,]  100   99   98   97   96   95   94   93   92    91

4. Save my_matrix as an rds-file on your harddrive.

To save my_matrix as a file of the type rds, we use the the saveRDS() function and specify my_matrix as the object to save. Further we define the argument file as the name of the file (here, my_matrix as well) and the file type after the file’s name:

saveRDS(my_matrix, file = "my_matrix.rds")

Remember that you can easily adapt the folder location according to your preferences. For example, if add remove 01_RIntroDataMeasurement/ within the quotation marks before the file name, R saves your object in the folder you might have created for this introduction to R.
5. Load the file from your harddrive into R again, but save it as and convert it to a 1-dimensional vector called my_matrix_vector where all the columns are „glued“ together.

To load the file, we use readRDS(), with the functions argument being exactly the same as the file argument from saveRDS(). When we execute the code, we see that R imports the file my_matrix exactly the way we saved it (i.e., as the data structure matrix). We can specifically test that by asking R whether the loaded object is indeed a matrix:

readRDS("my_matrix.rds")

##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
##  [1,]   10    9    8    7    6    5    4    3    2     1
##  [2,]   20   19   18   17   16   15   14   13   12    11
##  [3,]   30   29   28   27   26   25   24   23   22    21
##  [4,]   40   39   38   37   36   35   34   33   32    31
##  [5,]   50   49   48   47   46   45   44   43   42    41
##  [6,]   60   59   58   57   56   55   54   53   52    51
##  [7,]   70   69   68   67   66   65   64   63   62    61
##  [8,]   80   79   78   77   76   75   74   73   72    71
##  [9,]   90   89   88   87   86   85   84   83   82    81
## [10,]  100   99   98   97   96   95   94   93   92    91

is.matrix(readRDS("my_matrix.rds"))

## [1] TRUE

This shows us that we can directly manipulate that object as we learned to. In our case, we just want to take every row and attach them to one long row, i.e., a 1-dimensional vector. Combining the [ , ] notation inside the c() function to create a vector, we get the result we want:

my_matrix_vector <- c(readRDS("my_matrix.rds")[, 1:10])
my_matrix_vector

##   [1]  10  20  30  40  50  60  70  80  90 100   9  19  29  39  49  59  69  79
##  [19]  89  99   8  18  28  38  48  58  68  78  88  98   7  17  27  37  47  57
##  [37]  67  77  87  97   6  16  26  36  46  56  66  76  86  96   5  15  25  35
##  [55]  45  55  65  75  85  95   4  14  24  34  44  54  64  74  84  94   3  13
##  [73]  23  33  43  53  63  73  83  93   2  12  22  32  42  52  62  72  82  92
##  [91]   1  11  21  31  41  51  61  71  81  91

6. Identify the position in my_matrix_vector with the lowest value (i.e., 1). If you do not know the (base R) function for that, use R‘s help (or your browser).

If we do not know the name of the function, we search by topic. In this case, we use something like help.search("minimum"). When we then browse the help page with the list of the functions that pops up, we see that the which.min() function returns the position of the minimum of a vector:

which.min(my_matrix_vector)

## [1] 91

7. Remove only my_matrix and my_matrix_vector from your Environment (and the former from your harddrive, if you want to).

As for now, we want to keep our Environment as it is to proceed with the upcoming exercise sessions, we just remove the two objects specifying their name inside the rm() function:

rm(my_matrix, my_matrix_vector)

    At this point, one could save the current workspace to continue from here next week. However, as you probably do that when closing your RStudio, there is no need for you to do that manually.

save.image("Workspace_Session02.RData")

