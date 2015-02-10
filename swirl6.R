  |                                                                                                                      |   0%

| In this lesson, we'll see how to extract elements from a vector based on some conditions that we specify.

...

  |===                                                                                                                   |   3%

| For example, we may only be interested in the first 20 elements of a vector, or only the elements that are not NA, or only
| those that are positive or correspond to a specific variable of interest. By the end of this lesson, you'll know how to
| handle each of these scenarios.

...

  |======                                                                                                                |   5%

| I've created for you a vector called x that contains a random ordering of 20 numbers (from a standard normal distribution)
| and 20 NAs. Type x now to see what it looks like.

> 
> x
 [1] -1.5537258         NA -0.8568618 -0.2226319         NA  0.2564868         NA         NA -0.5934525         NA  0.3545111
[12] -0.6652788         NA  0.6836960 -1.6292345         NA         NA -2.1561970         NA  0.8927607  0.3233894 -0.8216092
[23] -0.1284036  1.1209035         NA         NA  0.1468616 -0.2357678         NA -1.3422114         NA         NA         NA
[34]  0.8434012         NA  2.3944117         NA         NA         NA         NA

| That's the answer I was looking for.

  |=========                                                                                                             |   8%

| The way you tell R that you want to select some particular elements (i.e. a 'subset') from a vector is by placing an 'index
| vector' in square brackets immediately following the name of the vector.

...

  |============                                                                                                          |  11%

| For a simple example, try x[1:10] to view the first ten elements of x.

> x[1:10]
 [1] -1.5537258         NA -0.8568618 -0.2226319         NA  0.2564868         NA         NA -0.5934525         NA

| You're the best!

  |================                                                                                                      |  13%

| Index vectors come in four different flavors -- logical vectors, vectors of positive integers, vectors of negative integers,
| and vectors of character strings -- each of which we'll cover in this lesson.

...

  |===================                                                                                                   |  16%

| Let's start by indexing with logical vectors. One common scenario when working with real-world data is that we want to
| extract all elements of a vector that are not NA (i.e. missing data). Recall that is.na(x) yields a vector of logical values
| the same length as x, with TRUEs corresponding to NA values in x and FALSEs corresponding to non-NA values in x.

...

  |======================                                                                                                |  18%

| What do you think x[is.na(x)] will give you?

1: A vector of TRUEs and FALSEs
2: A vector of length 0
3: A vector of all NAs
4: A vector with no NAs

Selection: 3

| You got it!

  |=========================                                                                                             |  21%

| Prove it to yourself by typing x[is.na(x)].

> x[is.na(x)]
 [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

| Excellent job!

  |============================                                                                                          |  24%

| Recall that `!` gives us the negation of a logical expression, so !is.na(x) can be read as 'is not NA'. Therefore, if we want
| to create a vector called y that contains all of the non-NA values from x, we can use y <- x[!is.na(x)]. Give it a try.

> y <- x[!is.na(x)]

| Your dedication is inspiring!

  |===============================                                                                                       |  26%

| Print y to the console.

> y
 [1] -1.5537258 -0.8568618 -0.2226319  0.2564868 -0.5934525  0.3545111 -0.6652788  0.6836960 -1.6292345 -2.1561970  0.8927607
[12]  0.3233894 -0.8216092 -0.1284036  1.1209035  0.1468616 -0.2357678 -1.3422114  0.8434012  2.3944117

| You are amazing!

  |==================================                                                                                    |  29%

| Now that we've isolated the non-missing values of x and put them in y, we can subset y as we please.

...

  |=====================================                                                                                 |  32%

| Recall that the expression y > 0 will give us a vector of logical values the same length as y, with TRUEs corresponding to
| values of y that are greater than zero and FALSEs corresponding to values of y that are less than or equal to zero. What do
| you think y[y > 0] will give you?

1: A vector of all NAs
2: A vector of TRUEs and FALSEs
3: A vector of all the positive elements of y
4: A vector of length 0
5: A vector of all the negative elements of y

Selection: 3

| Great job!

  |========================================                                                                              |  34%

| Type y[y > 0] to see that we get all of the positive elements of y, which are also the positive elements of our original
| vector x.

> y[y > 0]
[1] 0.2564868 0.3545111 0.6836960 0.8927607 0.3233894 1.1209035 0.1468616 0.8434012 2.3944117

| You got it right!

  |===========================================                                                                           |  37%

| You might wonder why we didn't just start with x[x > 0] to isolate the positive elements of x. Try that now to see why.

> x[x > 0]
 [1]        NA        NA 0.2564868        NA        NA        NA 0.3545111        NA 0.6836960        NA        NA        NA
[13] 0.8927607 0.3233894 1.1209035        NA        NA 0.1468616        NA        NA        NA        NA 0.8434012        NA
[25] 2.3944117        NA        NA        NA        NA

| Nice work!

  |===============================================                                                                       |  39%

| Since NA is not a value, but rather a placeholder for an unknown quantity, the expression NA > 0 evaluates to NA. Hence we
| get a bunch of NAs mixed in with our positive numbers when we do this.

...

  |==================================================                                                                    |  42%

| Combining our knowledge of logical operators with our new knowledge of subsetting, we could do this -- x[!is.na(x) & x > 0].
| Try it out.

> -- x[!is.na(x) & x > 0]
[1] 0.2564868 0.3545111 0.6836960 0.8927607 0.3233894 1.1209035 0.1468616 0.8434012 2.3944117

| That's not the answer I was looking for, but try again. Or, type info() for more options.

| Try x[!is.na(x) & x > 0] to see what you get.

> x[!is.na(x) & x > 0]
[1] 0.2564868 0.3545111 0.6836960 0.8927607 0.3233894 1.1209035 0.1468616 0.8434012 2.3944117

| You are quite good my friend!

  |=====================================================                                                                 |  45%

| In this case, we request only values of x that are both non-missing AND greater than zero.

...

  |========================================================                                                              |  47%

| I've already shown you how to subset just the first ten values of x using x[1:10]. In this case, we're providing a vector of
| positive integers inside of the square brackets, which tells R to return only the elements of x numbered 1 through 10.

...

  |===========================================================                                                           |  50%

| Many programming languages use what's called 'zero-based indexing', which means that the first element of a vector is
| considered element 0. R uses 'one-based indexing', which (you guessed it!) means the first element of a vector is considered
| element 1.

...

  |==============================================================                                                        |  53%

| Can you figure out how we'd subset the 3rd, 5th, and 7th elements of x? Hint -- Use the c() function to specify the element
| numbers as a numeric vector.

> 
> x[c(3,5,7)]
[1] -0.8568618         NA         NA

| You are amazing!

  |=================================================================                                                     |  55%

| It's important that when using integer vectors to subset our vector x, we stick with the set of indexes {1, 2, ..., 40} since
| x only has 40 elements. What happens if we ask for the zeroth element of x (i.e. x[0])? Give it a try.

> x[0]
numeric(0)

| You nailed it! Good job!

  |====================================================================                                                  |  58%

| As you might expect, we get nothing useful. Unfortunately, R doesn't prevent us from doing this. What if we ask for the
| 3000th element of x? Try it out.

> x[3000]
[1] NA

| Nice work!

  |=======================================================================                                               |  61%

| Again, nothing useful, but R doesn't prevent us from asking for it. This should be a cautionary tale. You should always make
| sure that what you are asking for is within the bounds of the vector you're working with.

...

  |===========================================================================                                           |  63%

| What if we're interested in all elements of x EXCEPT the 2nd and 10th? It would be pretty tedious to construct a vector
| containing all numbers 1 through 40 EXCEPT 2 and 10.

...

  |==============================================================================                                        |  66%

| Luckily, R accepts negative integer indexes. Whereas x[c(2, 10)] gives us ONLY the 2nd and 10th elements of x, x[c(-2, -10)]
| gives us all elements of x EXCEPT for the 2nd and 10 elements.  Try x[c(-2, -10)] now to see this.

> x[c(-2, -10)]
 [1] -1.5537258 -0.8568618 -0.2226319         NA  0.2564868         NA         NA -0.5934525  0.3545111 -0.6652788         NA
[12]  0.6836960 -1.6292345         NA         NA -2.1561970         NA  0.8927607  0.3233894 -0.8216092 -0.1284036  1.1209035
[23]         NA         NA  0.1468616 -0.2357678         NA -1.3422114         NA         NA         NA  0.8434012         NA
[34]  2.3944117         NA         NA         NA         NA

| That's a job well done!

  |=================================================================================                                     |  68%

| A shorthand way of specifying multiple negative numbers is to put the negative sign out in front of the vector of positive
| numbers. Type x[-c(2, 10)] to get the exact same result.

> x[-c(2, 10)]
 [1] -1.5537258 -0.8568618 -0.2226319         NA  0.2564868         NA         NA -0.5934525  0.3545111 -0.6652788         NA
[12]  0.6836960 -1.6292345         NA         NA -2.1561970         NA  0.8927607  0.3233894 -0.8216092 -0.1284036  1.1209035
[23]         NA         NA  0.1468616 -0.2357678         NA -1.3422114         NA         NA         NA  0.8434012         NA
[34]  2.3944117         NA         NA         NA         NA

| You are doing so well!

  |====================================================================================                                  |  71%

| So far, we've covered three types of index vectors -- logical, positive integer, and negative integer. The only remaining
| type requires us to introduce the concept of 'named' elements.

...

  |=======================================================================================                               |  74%

| Create a numeric vector with three named elements using vect <- c(foo = 11, bar = 2, norf = NA).

> vect <- c(foo = 11, bar = 2, norf = NA)

| Keep up the great work!

  |==========================================================================================                            |  76%

| When we print vect to the console, you'll see that each element has a name. Try it out.

> vect
 foo  bar norf 
  11    2   NA 

| Perseverance, that's the answer.

  |=============================================================================================                         |  79%

| We can also get the names of vect by passing vect as an argument to the names() function. Give that a try.

> names(vect)
[1] "foo"  "bar"  "norf"

| Great job!

  |================================================================================================                      |  82%

| Alternatively, we can create an unnamed vector vect2 with c(11, 2, NA). Do that now.

> vect2<c(11, 2, NA)
Error: object 'vect2' not found
> vect2<-c(11, 2, NA)

| Great job!

  |===================================================================================================                   |  84%

| Then, we can add the `names` attribute to vect2 after the fact with names(vect2) <- c("foo", "bar", "norf"). Go ahead.

> names(vect2) <- c("foo", "bar", "norf")

| You are amazing!

  |======================================================================================================                |  87%

| Now, let's check that vect and vect2 are the same by passing them as arguments to the identical() function.

> identical(vect,vect2)
[1] TRUE

| You got it!

  |==========================================================================================================            |  89%

| Indeed, vect and vect2 are identical named vectors.

...

  |=============================================================================================================         |  92%

| Now, back to the matter of subsetting a vector by named elements. Which of the following commands do you think would give us
| the second element of vect?

1: vect["2"]
2: vect["bar"]
3: vect[bar]

Selection: 3

| Not quite! Try again.

| If we want the element named "bar" (i.e. the second element of vect), which command would get us that?

1: vect[bar]
2: vect["2"]
3: vect["bar"]

Selection: 3

| You got it right!

  |================================================================================================================      |  95%

| Now, try it out.

> vect["bar"]
bar 
  2 

| Your dedication is inspiring!

  |===================================================================================================================   |  97%

| Likewise, we can specify a vector of names with vect[c("foo", "bar")]. Try it out.

> vect[c("foo", "bar")]
foo bar 
 11   2 

| Excellent job!

  |======================================================================================================================| 100%

| Now you know all four methods of subsetting data from vectors. Different approaches are best in different scenarios and when
| in doubt, try it out!

...
