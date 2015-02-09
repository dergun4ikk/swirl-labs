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
