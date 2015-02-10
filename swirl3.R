| In this lesson, you'll learn how to examine your local workspace in R and begin to explore the relationship between your
| workspace and the file system of your machine.

...

  |==                                                             |   2%

| Because different operating systems have different conventions with regards to things like file paths, the outputs of
| these commands may vary across machines.

...

  |===                                                            |   5%

| Let's jump right in so you can get a feel for how these special functions work!

...

  |=====                                                          |   7%

| Determine which directory your R session is using as its current working directory using getwd().

> 
> 
> 
> 
> 
> 
> 
> geetwd()
Error: could not find function "geetwd"
> getwd()
[1] "/home/igromov"

| Excellent job!

  |======                                                         |  10%

| List all the objects in your local workspace using ls().

> ls()
character(0)

| All that practice is paying off!

  |========                                                       |  12%

| Some R commands are the same as the Unix equivalents. This is another reason why learning Unix is a good idea.

...

  |=========                                                      |  15%

| In the first two questions above, we told you the exact command to use. But isn't that too easy? Going forward we won't
| do that.

...

  |===========                                                    |  17%

| Instead, we will word the questions in such a way that a web search should lead you to the appropriate R command. In this
| case, searching for "R list objects workspace" should work well.)

...

  |============                                                   |  20%

| Assign 9 to x using x <- 9.

> x <- 9

| Keep up the great work!

  |==============                                                 |  22%

| Having created x, you should now see x when you try ls() again. You can do this by suspending this swirl lesson with
| play() at the command prompt. Once you have run the ls() command to confirm that x exists in the workspace, you can
| re-start the lesson from the same location with nxt(). Try it (after hitting return to get to a command prompt)!

...play()

  |===============                                                |  24%

| List all the files in your working directory.

> ls()
[1] "x"

| Not exactly. Give it another go. Or, type info() for more options.

| Type list.files() to all the files in your working directory.

> nxt()

| Resuming lesson...


| List all the files in your working directory.

> ls()
[1] "x"

| Almost! Try again. Or, type info() for more options.

| Type list.files() to all the files in your working directory.

> list.files()
 [1] "bandittest.py"    "bandittest.py~"   "Canopy"           "canopy"           "%dap"             "Desktop"         
 [7] "Documents"        "Downloads"        "Enthought"        "examples.desktop" "github"           "github~"         
[13] "host_lab.odt"     "Music"            "Pictures"         "Public"           "R"                "readme"          
[19] "SRT411"           "srt411"           "swirl1.r"         "swirl-labs"       "Templates"        "Videos"          

| You are amazing!

  |=================                                              |  27%

| As we go through this lesson, you should be examining the help page for each new function.

...

  |==================                                             |  29%

| Pull up the help for list.files().

> 
> halp list.files()
Error: unexpected symbol in "halp list.files"
> help list.files()
Error: unexpected symbol in "help list.files"
> list.files() ?
+ 
+ 
+ 
+ 
+ ?
+ /s
Error: unexpected '/' in:
"?
/"
> ?list.files()

| You're close...I can feel it! Try it again. Or, type info() for more options.

| Type ?list.files to retrieve the help file for list.files.

> ?list.files

| All that practice is paying off!

  |====================                                           |  32%

| One of the most helpful parts of any R help file is the See Also section. Read that section for list.files. Some of these
| functions may be used in later portions of this lesson.

...

  |======================                                         |  34%

| Using the args() function on a function name is also a handy way to see what arguments a function can take.

...

  |=======================                                        |  37%

| Use the args() function to determine the arguments to list.files().

> 
> args(list.files())
NULL

| Not quite, but you're learning! Try again. Or, type info() for more options.

| Type args(list.files) to see the arguments to list.files.

> args(list.files)
function (path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, 
    recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, 
    no.. = FALSE) 
NULL

| Excellent job!

  |=========================                                      |  39%

| Assign the value of the current working directory to a variable called "old.dir".

> old.dir<-getwd()

| Perseverance, that's the answer.

  |==========================                                     |  41%

| We will use old.dir at the end of this lesson to move back to the place that we started. A lot of query functions like
| getwd() have the useful property that they return the answer to the question as a result of the function.

...

  |============================                                   |  44%

| Create a directory in the current working directory called "testdir".

> 
> mkdir testdir
Error: unexpected symbol in "mkdir testdir"
> play()

| Entering play mode. Experiment as you please, then type nxt() when you are ready to resume the lesson.

> mkdir testdir
Error: unexpected symbol in "mkdir testdir"
> nxt()

| Resuming lesson...


| Create a directory in the current working directory called "testdir".

> dir.create("testdir")

| Excellent job!

  |=============================                                  |  46%

| We will do all our work in this new directory and then delete it after we are done. This is the R analog to "Take only
| pictures, leave only footprints."

...

  |===============================                                |  49%

| Set your working directory to "testdir".

> 
> setwd("testdir")

| Keep up the great work!

  |================================                               |  51%

| In general, you will want your working directory to be someplace sensible, perhaps created for the specific project that
| you are working on. In fact, organizing your work in R packages using R Studio is an excellent option. But those topics
| are beyond the scope of this lesson.

...

  |==================================                             |  54%

| Create a file in your working directory called "mytest.R".

> 
> file.create("mytest.R")
[1] TRUE

| That's the answer I was looking for.

  |===================================                            |  56%

| This should be the only file in this newly created directory. Issue the R command (which we have already covered) that
| will show this.

> 
> list.files()
[1] "mytest.R"

| That's correct!

  |=====================================                          |  59%

| Check to see if "mytest.R" exists in the working directory

> 
> file.exists("mytest.R")
[1] TRUE

| That's a job well done!

  |======================================                         |  61%

| These sorts of functions are excessive for interactive use. But, if you are running a program that loops through a series
| of files and does some processing on each one, you will want to check to see that each exists before you try to process
| it.

...

  |========================================                       |  63%

| Access information about the file "mytest.R". That is, what command, along with the appropriate argument, will return
| information about the file "mytest.R"?

> 
> file.info("mytest.R")
         size isdir mode               mtime               ctime               atime  uid  gid   uname  grname
mytest.R    0 FALSE  664 2015-02-09 17:29:17 2015-02-09 17:29:17 2015-02-09 17:29:17 1000 1000 igromov igromov

| All that hard work is paying off!

  |=========================================                      |  66%

| You can use the $ operator --- e.g., file.info("mytest.R")$mode --- to grab specific items.

...

  |===========================================                    |  68%

| Change the name of the file "mytest.R" to "mytest2.R".

> 
> file.rename("mytest.R", "mytest2.R")
[1] TRUE

| Nice work!

  |=============================================                  |  71%

| Your operating system will provide simpler tools for these sorts of tasks. But having the ability to manipulate files
| programatically is useful. You might now try to delete mytest.R using file.remove("mytest.R"), but that won't work since
| mytest.R no longer exists. You have already renamed it.

...

  |==============================================                 |  73%

| Make a copy of "mytest2.R" called "mytest3.R".

> 
> file.copy("mytest2.R", "mytest3.R")
[1] TRUE

| That's a job well done!

  |================================================               |  76%

| You now have two files in the current directory. That may not seem very interesting. But what if you were working with
| dozens, or millions, of individual files? In that case, being able to programatically act on many files would be
| absolutely necessary. Don't forget that you can, temporarily, leave the lesson by typing play() and then return by typing
| nxt().

...

  |=================================================              |  78%

| Provide the full path to the file "mytest3.R".

> 
> file.path("mytest3.R")
[1] "mytest3.R"

| Keep up the great work!

  |===================================================            |  80%

| Create a directory in the current working directory called "testdir2" and a subdirectory for it called "testdir3", all in
| one command.

> dir.create("testdir2/testdir3" recursive=yes)
Error: unexpected symbol in "dir.create("testdir2/testdir3" recursive"
> dir.create("testdir2/testdir3" recursive=TRUE)
Error: unexpected symbol in "dir.create("testdir2/testdir3" recursive"
> dir.create("testdir2/testdir3", recursive=TRUE)

| You got it right!

  |====================================================           |  83%

| Delete the "testdir2" directory that you created.

> 
> unlink("testdir2/", recursive = TRUE)

| Give it another try. Or, type info() for more options.

| unlink("testdir2", recursive = TRUE) works.

> unlink("testdir2", recursive = TRUE)

| Excellent job!

  |======================================================         |  85%

| Again, you need the recursive = TRUE argument. Otherwise, R is concerned that you are unaware that, when deleting
| testdir2, you are also deleting testdir3, which is nested within it. R reasons that, if you don't tell it that recursive
| equals TRUE, you don't know that something is in testdir2. So, it tries to prevent you from making a mistake.

...

  |=======================================================        |  88%

| Why is this command named "unlink" rather than something more sensible like "dir.delete" or "dir.remove"? Mainly,
| history. unlink is the traditional Unix command for removing directories.

...

  |=========================================================      |  90%

| Go back to your original working directory. (Recall that we created the variable old.dir with the full path for the
| orginal working directory at the start of these questions.)

> 
> dir("old.dir")
character(0)

| Not quite, but you're learning! Try again. Or, type info() for more options.

| Use setwd(old.dir).

> setwd(old.dir)

| Excellent job!

  |==========================================================     |  93%

| It is often help to save the settings that you had before you began an analysis and then go back to them at the end. This
| trick is often used within functions; you save, say, the par() settings that you started with, mess around a bunch, and
| then set them back to the original values at the end. This isn't the same as what we have done here, but it seems similar
| enough to mention.

...

  |============================================================   |  95%

| Delete the "testdir" directory that you just left (and everything in it)

> 
> unlink("testdir", recursive = True)
Error in unlink("testdir", recursive = True) : object 'True' not found
> unlink("testdir", recursive = TRUE)

| Nice work!

  |=============================================================  |  98%

| Take nothing but results. Leave nothing but assumptions. That sounds like "Take nothing but pictures. Leave nothing but
| footprints." But it makes no sense! Surely our readers can come up with a better motto . . .

...

  |===============================================================| 100%

| In this lesson, you learned how to examine your R workspace and work with the file system of your machine from within R.

...

| Are you currently enrolled in the Coursera course associated with this lesson?

1: Yes
2: No

Selection: yes
Enter an item from the menu, or 0 to exit
Selection: 1

| Would you like me to notify Coursera that you've completed this lesson? If so, I'll need to get some more info from you.

1: Yes
2: No
3: Maybe later

Selection: 2

| You've reached the end of this lesson! Returning to the main menu...

| Please choose a course, or type 0 to exit swirl.

1: R Programming
2: Take me to the swirl course repository!

Selection: 1

| Please choose a lesson, or type 0 to return to course menu.

 1: Basic Building Blocks      2: Workspace and Files        3: Sequences of Numbers       4: Vectors                    5: Missing Values             6: Subsetting Vectors         7: Matrices and Data Frames   8: Logic                      9: lapply and sapply       
10: vapply and tapply         11: Looking at Data           12: Simulation                13: Dates and Times           14: Base Graphics             

Selection: 3

  |                                                                                                                                                                                                                                                                                     |   0%

| In this lesson, you'll learn how to create sequences of numbers in R.

...

  |=============                                                                                                                                                                                                                                                                        |   5%

| The simplest way to create a sequence of numbers in R is by using the `:` operator. Type 1:20 to see how it works.

> 1:20
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

| You are really on a roll!

  |=========================                                                                                                                                                                                                                                                            |   9%

| That gave us every integer between (and including) 1 and 20. We could also use it to create a sequence of real numbers. For
| example, try pi:10.

> pi:10
[1] 3.141593 4.141593 5.141593 6.141593 7.141593 8.141593 9.141593

| Nice work!

  |======================================                                                                                                                                                                                                                                               |  14%

| The result is a vector of real numbers starting with pi (3.142...) and increasing in increments of 1. The upper limit of 10
| is never reached, since the next number in our sequence would be greater than 10.

...

  |==================================================                                                                                                                                                                                                                                   |  18%

| What happens if we do 15:1? Give it a try to find out.

> 
> 15:1
 [1] 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1

| You are really on a roll!

  |===============================================================                                                                                                                                                                                                                      |  23%

| It counted backwards in increments of 1! It's unlikely we'd want this behavior, but nonetheless it's good to know how it
| could happen.

...

  |============================================================================                                                                                                                                                                                                         |  27%

| Remember that if you have questions about a particular R function, you can access its documentation with a question mark
| followed by the function name: ?function_name_here. However, in the case of an operator like the colon used above, you must
| enclose the symbol in backticks like this: ?`:`. (NOTE: The backtick (`) key is generally located in the top left corner of a
| keyboard, above the Tab key. If you don't have a backtick key, you can use regular quotes.)

...

  |========================================================================================                                                                                                                                                                                             |  32%

| Pull up the documentation for `:` now.

> ?':'

| Great job!

  |=====================================================================================================                                                                                                                                                                                |  36%

| Often, we'll desire more control over a sequence we're creating than what the `:` operator gives us. The seq() function
| serves this purpose.

...

  |=================================================================================================================                                                                                                                                                                    |  41%

| The most basic use of seq() does exactly the same thing as the `:` operator. Try seq(1, 20) to see this.

> 
> seq(1,20)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

| You are amazing!

  |==============================================================================================================================                                                                                                                                                       |  45%

| This gives us the same output as 1:20. However, let's say that instead we want a vector of numbers ranging from 0 to 10,
| incremented by 0.5. seq(0, 10, by=0.5) does just that. Try it out.

> seq(0,10,by=0.5)
 [1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5  8.0  8.5  9.0  9.5 10.0

| Keep up the great work!

  |==========================================================================================================================================                                                                                                                                           |  50%

| Or maybe we don't care what the increment is and we just want a sequence of 30 numbers between 5 and 10. seq(5, 10,
| length=30) does the trick. Give it a shot now and store the result in a new variable called my_seq.

> 
> seq(5,1,lenght=30)
[1] 5 4 3 2 1
Warning message:
In seq.default(5, 1, lenght = 30) :
  extra argument ‘lenght’ will be disregarded

| Not quite! Try again. Or, type info() for more options.

| You're using the same function here, but changing its arguments for different results. Be sure to store the result in a new
| variable called my_seq, like this: my_seq <- seq(5, 10, length=30).

> seq(5,10,lenght=30)
[1]  5  6  7  8  9 10
Warning message:
In seq.default(5, 10, lenght = 30) :
  extra argument ‘lenght’ will be disregarded

| You almost had it, but not quite. Try again. Or, type info() for more options.

| You're using the same function here, but changing its arguments for different results. Be sure to store the result in a new
| variable called my_seq, like this: my_seq <- seq(5, 10, length=30).

> my_seq <- seq(5, 10, lenght=30)
Warning message:
In seq.default(5, 10, lenght = 30) :
  extra argument ‘lenght’ will be disregarded

| Almost! Try again. Or, type info() for more options.

| You're using the same function here, but changing its arguments for different results. Be sure to store the result in a new
| variable called my_seq, like this: my_seq <- seq(5, 10, length=30).

> my_seq <- seq(5, 10, length=30)

| You nailed it! Good job!

  |=======================================================================================================================================================                                                                                                                              |  55%

| To confirm that my_seq has length 30, we can use the length() function. Try it now.

> length()
Error in length() : 0 arguments passed to 'length' which requires 1
> length(my_seq)
[1] 30

| That's a job well done!

  |====================================================================================================================================================================                                                                                                                 |  59%

| Let's pretend we don't know the length of my_seq, but we want to generate a sequence of integers from 1 to N, where N
| represents the length of the my_seq vector. In other words, we want a new vector (1, 2, 3, ...) that is the same length as
| my_seq.

...

  |================================================================================================================================================================================                                                                                                     |  64%

| There are several ways we could do this. One possibility is to combine the `:` operator and the length() function like this:
| 1:length(my_seq). Give that a try.

> 1:length(my_seq)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30

| All that hard work is paying off!

  |=============================================================================================================================================================================================                                                                                        |  68%

| Another option is to use seq(along.with = my_seq). Give that a try.

> seq(along.with=my_seq)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30

| You are amazing!

  |=========================================================================================================================================================================================================                                                                            |  73%

| However, as is the case with many common tasks, R has a separate built-in function for this purpose called seq_along(). Type
| seq_along(my_seq) to see it in action.

> seq_along(my_seq)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30

| That's the answer I was looking for.

  |======================================================================================================================================================================================================================                                                               |  77%

| There are often several approaches to solving the same problem, particularly in R. Simple approaches that involve less typing
| are generally best. It's also important for your code to be readable, so that you and others can figure out what's going on
| without too much hassle.

...

  |===================================================================================================================================================================================================================================                                                  |  82%

| If R has a built-in function for a particular task, it's likely that function is highly optimized for that purpose and is
| your best option. As you become a more advanced R programmer, you'll design your own functions to perform tasks when there
| are no better options. We'll explore writing your own functions in future lessons.

...

  |===============================================================================================================================================================================================================================================                                      |  86%

| One more function related to creating sequences of numbers is rep(), which stands for 'replicate'. Let's look at a few uses.

...

  |============================================================================================================================================================================================================================================================                         |  91%

| If we're interested in creating a vector that contains 40 zeros, we can use rep(0, times = 40). Try it out.

> rep(0,times=40)
 [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

| That's a job well done!

  |========================================================================================================================================================================================================================================================================             |  95%

| If instead we want our vector to contain 10 repetitions of the vector (0, 1, 2), we can do rep(c(0, 1, 2), times = 10). Go
| ahead.

> rep(c(0,1,2), times=10)
 [1] 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2

| You are really on a roll!

  |=====================================================================================================================================================================================================================================================================================| 100%

| Finally, let's say that rather than repeating the vector (0, 1, 2) over and over again, we want our vector to contain 10
| zeros, then 10 ones, then 10 twos. We can do this with the `each` argument. Try rep(c(0, 1, 2), each = 10).

> rep(c(0,1,2), each=10)
 [1] 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2

| That's correct!
