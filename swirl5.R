  |                                                                                                                      |   0%

| Missing values play an important role in statistics and data analysis. Often, missing values must not be ignored, but rather
| they should be carefully studied to see if there's an underlying pattern or cause for their missingness.

...

  |======                                                                                                                |   5%

| In R, NA is used to represent any value that is 'not available' or 'missing' (in the statistical sense). In this lesson,
| we'll explore missing values further.

...

  |============                                                                                                          |  11%

| Any operation involving NA generally yields NA as the result. To illustrate, let's create a vector c(44, NA, 5, NA) and
| assign it to a variable x.

> 
> x<-c(44, NA, 5, NA)

| You are doing so well!

  |===================                                                                                                   |  16%

| Now, let's multiply x by 3.

> x*3
[1] 132  NA  15  NA

| Nice work!

  |=========================                                                                                             |  21%

| Notice that the elements of the resulting vector that correspond with the NA values in x are also NA.

...

  |===============================                                                                                       |  26%

| To make things a little more interesting, lets create a vector containing 1000 draws from a standard normal distribution with
| y <- rnorm(1000).

> y <- rnorm(1000)

| That's a job well done!

  |=====================================                                                                                 |  32%

| Next, let's create a vector containing 1000 NAs with z <- rep(NA, 1000).

> z <- rep(NA, 1000)

| You got it right!

  |===========================================                                                                           |  37%

| Finally, let's select 100 elements at random from these 2000 values (combining y and z) such that we don't know how many NAs
| we'll wind up with or what positions they'll occupy in our final vector -- my_data <- sample(c(y, z), 100).

> my_data <- sample(c(y, z), 100)

| Nice work!

  |==================================================                                                                    |  42%

| Let's first ask the question of where our NAs are located in our data. The is.na() function tells us whether each element of
| a vector is NA. Call is.na() on my_data and assign the result to my_na.

> my_na,_na(my_data)
Error: unexpected ',' in "my_na,"
> my_na<-na(my_data)
Error: could not find function "na"
> my_na<-is.na(my_data)

| Nice work!

  |========================================================                                                              |  47%

| Now, print my_na to see what you came up with.

> my_na
  [1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE
 [21]  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE
 [41]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
 [61] FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 [81] FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE

| Great job!

  |==============================================================                                                        |  53%

| Everywhere you see a TRUE, you know the corresponding element of my_data is NA. Likewise, everywhere you see a FALSE, you
| know the corresponding element of my_data is one of our random draws from the standard normal distribution.

...

  |====================================================================                                                  |  58%

| In our previous discussion of logical operators, we introduced the `==` operator as a method of testing for equality between
| two objects. So, you might think the expression my_data == NA yields the same results as is.na(). Give it a try.

> 
> my_data == NA
  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [42] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [83] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

| Your dedication is inspiring!

  |===========================================================================                                           |  63%

| The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder for a quantity that is not
| available. Therefore the logical expression is incomplete and R has no choice but to return a vector of the same length as
| my_data that contains all NAs.

...

  |=================================================================================                                     |  68%

| Don't worry if that's a little confusing. The key takeaway is to be cautious when using logical expressions anytime NAs might
| creep in, since a single NA value can derail the entire thing.

...

  |=======================================================================================                               |  74%

| So, back to the task at hand. Now that we have a vector, my_na, that has a TRUE for every NA and FALSE for every numeric
| value, we can compute the total number of NAs in our data.

...

  |=============================================================================================                         |  79%

| The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and FALSE as the number 0.
| Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.

...

  |===================================================================================================                   |  84%

| Let's give that a try here. Call the sum() function on my_na to count the total number of TRUEs in my_na, and thus the total
| number of NAs in my_data. Don't assign the result to a new variable.

> sum(my_na)
[1] 53

| Keep working like that and you'll get there!

  |==========================================================================================================            |  89%

| Pretty cool, huh? Finally, let's take a look at the data to convince ourselves that everything 'adds up'. Print my_data to
| the console.

> my_data
  [1]  0.21420727          NA          NA          NA          NA  0.12720607 -0.75704268  0.43211508          NA          NA
 [11]          NA          NA          NA          NA          NA  1.01935065          NA -0.11269286 -0.86316877 -0.17608074
 [21]          NA          NA          NA  0.74733640  0.38819423          NA          NA          NA          NA          NA
 [31] -0.10231252          NA -0.57312258          NA -0.20793941          NA  0.77846331  0.80441329          NA          NA
 [41]          NA -0.41072295 -0.77097859  0.43815762          NA  0.84702696  0.33459315          NA -1.93817909  1.41838206
 [51]          NA -0.43426202 -0.06988123          NA -0.38808135  1.04460582 -1.60064033 -0.78472155 -0.87624238 -0.96686358
 [61]  0.38385887 -0.88205892          NA  0.77009097  1.01846404 -0.11297012          NA          NA          NA -0.46420851
 [71]  1.81840938 -0.36093336          NA          NA          NA          NA          NA          NA          NA -1.22405233
 [81]  0.85569381          NA          NA          NA          NA  0.31913473          NA -0.98492267          NA          NA
 [91]  0.21599339  0.23494306          NA          NA  0.62475660 -0.98599009          NA  0.79869800          NA          NA

| Your dedication is inspiring!

  |================================================================================================================      |  95%

| Now that we've got NAs down pat, let's look at a second type of missing value -- NaN, which stands for 'not a number'. To
| generate NaN, try dividing (using a forward slash) 0 by 0 now.

> 0/0
[1] NaN

| You are really on a roll!

  |======================================================================================================================| 100%

| Let's do one more, just for fun. In R, Inf stands for infinity. What happens if you subtract Inf from Inf?

> inf-inf
Error: object 'inf' not found
> Inf-Inf
[1] NaN

| Keep working like that and you'll get there!
