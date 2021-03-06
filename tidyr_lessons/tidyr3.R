| Scroll up to review the three characteristics of tidy data. Any dataset that violates at least one of these is considered messy. Therefore, all of the following are characteristics of messy data,
| EXCEPT...

1: Variables are stored in both rows and columns
2: Every column contains a different variable
3: Multiple variables are stored in one column
4: Multiple types of observational units are stored in the same table
5: Column headers are values, not variable names
6: A single observational unit is stored in multiple tables

Selection: 2

| Excellent work!

  |========                                                           |  11%

| The incorrect answers to the previous question are the most common symptoms of messy data. Let's work through a simple example of each of these five cases, then tidy some real data.

...

  |=========                                                          |  13%

| The first problem is when you have column headers that are values, not variable names. I've created a simple dataset called 'students' that demonstrates this scenario. Type students to take a look.

> students
  grade male female
1     A    1      5
2     B    5      0
3     C    5      2
4     D    5      5
5     E    7      4

| You are amazing!

  |==========                                                         |  15%

| The first column represents each of five possible grades that students could receive for a particular class. The second and third columns give the number of male and female students, respectively,
| that received each grade.

...

  |===========                                                        |  17%

| This dataset actually has three variables: grade, sex, and count. The first variable, grade, is already a column, so that should remain as it is. The second variable, sex, is captured by the second
| and third column headings. The third variable, count, is the number of students for each combination of grade and sex.

...

  |=============                                                      |  19%

| To tidy the students data, we need to have one column for each of these three variables. We'll use the gather() function from tidyr to accomplish this. Pull up the documentation for this function
| with ?gather.

> ?gather

| Keep up the great work!

  |==============                                                     |  21%

| Using the help file as a guide, call gather() with the following arguments (in order): students, sex, count, -grade. Note the minus sign before grade, which says we want to gather all columns EXCEPT
| grade.

> gather(students, sex, count, -grade)
   grade    sex count
1      A   male     1
2      B   male     5
3      C   male     5
4      D   male     5
5      E   male     7
6      A female     5
7      B female     0
8      C female     2
9      D female     5
10     E female     4

| You are really on a roll!

  |===============                                                    |  23%

| Each row of the data now represents exactly one observation, characterized by a unique combination of the grade and sex variables. Each of our variables (grade, sex, and count) occupies exactly one
| column. That's tidy data!

...

  |================                                                   |  25%

| It's important to understand what each argument to gather() means. The data argument, students, gives the name of the original dataset. The key and value arguments -- sex and count, respectively --
| give the column names for our tidy dataset. The final argument, -grade, says that we want to gather all columns EXCEPT the grade column (since grade is already a proper column variable.)

...

  |==================                                                 |  26%

| The second messy data case we'll look at is when multiple variables are stored in one column. Type students2 to see an example of this.

> students2
  grade male_1 female_1 male_2 female_2
1     A      3        4      3        4
2     B      6        4      3        5
3     C      7        4      3        8
4     D      4        0      8        1
5     E      1        1      2        7

| You are doing so well!

  |===================                                                |  28%

| This dataset is similar to the first, except now there are two separate classes, 1 and 2, and we have total counts for each sex within each class. students2 suffers from the same messy data problem
| of having column headers that are values (male_1, female_1, etc.) and not variable names (sex, class, and count).

...

  |====================                                               |  30%

| However, it also has multiple variables stored in each column (sex and class), which is another common symptom of messy data. Tidying this dataset will be a two step process.

...

  |=====================                                              |  32%

| Let's start by using gather() to stack the columns of students2, like we just did with students. This time, name the 'key' column sex_class and the 'value' column count. Save the result to a new
| variable called res. Consult ?gather again if you need help.

> res<- gather(students2, sex_class, value)
Warning message:
attributes are not identical across measure variables; they will be dropped 

| Try again. Getting it right on the first try is boring anyway! Or, type info() for more options.

| Call gather() with the following arguments (in order): students2, sex_class, count, -grade). Store the result in a variable called res.

> res<- gather(students2, sex_class, count, -grade)

| Excellent work!

  |=======================                                            |  34%

| Print res to the console to see what we accomplished.

> res
   grade sex_class count
1      A    male_1     3
2      B    male_1     6
3      C    male_1     7
4      D    male_1     4
5      E    male_1     1
6      A  female_1     4
7      B  female_1     4
8      C  female_1     4
9      D  female_1     0
10     E  female_1     1
11     A    male_2     3
12     B    male_2     3
13     C    male_2     3
14     D    male_2     8
15     E    male_2     2
16     A  female_2     4
17     B  female_2     5
18     C  female_2     8
19     D  female_2     1
20     E  female_2     7

| Keep up the great work!

  |========================                                           |  36%

| That got us half way to tidy data, but we still have two different variables, sex and class, stored together in the sex_class column. tidyr offers a convenient separate() function for the purpose of
| separating one column into multiple columns. Pull up the help file for separate() now.

> ?separate

| You nailed it! Good job!

  |=========================                                          |  38%

| Call separate() on res to split the sex_class column into sex and class. You only need to specify the first three arguments: data = res, col = sex_class, into = c("sex", "class"). You don't have to
| provide the argument names as long as they are in the correct order.

> separate(res, sex_class("sex", "class"))
Error: Invalid column specification
> separate(res, sex_class,("sex", "class"))
Error: unexpected ',' in "separate(res, sex_class,("sex","
> separate(res, sex_class,c("sex", "class"))
   grade    sex class count
1      A   male     1     3
2      B   male     1     6
3      C   male     1     7
4      D   male     1     4
5      E   male     1     1
6      A female     1     4
7      B female     1     4
8      C female     1     4
9      D female     1     0
10     E female     1     1
11     A   male     2     3
12     B   male     2     3
13     C   male     2     3
14     D   male     2     8
15     E   male     2     2
16     A female     2     4
17     B female     2     5
18     C female     2     8
19     D female     2     1
20     E female     2     7

| Nice work!

  |===========================                                        |  40%

| Conveniently, separate() was able to figure out on its own how to separate the sex_class column. Unless you request otherwise with the 'sep' argument, it splits on non-alphanumeric values. In other
| words, it assumes that the values are separated by something other than a letter or number (in this case, an underscore.)

...

  |============================                                       |  42%

| Tidying students2 required both gather() and separate(), causing us to save an intermediate result (res). However, just like with dplyr, you can use the %>% operator to chain multiple function calls
| together.

...

  |=============================                                      |  43%

| I've opened an R script for you to give this a try. Follow the directions in the script, then save the script and type submit() at the prompt when you are ready. If you get stuck and want to start
| over, you can type reset() to reset the script to its original state.

> submit()

| Sourcing your script...

   grade    sex class count
1      A   male     1     3
2      B   male     1     6
3      C   male     1     7
4      D   male     1     4
5      E   male     1     1
6      A female     1     4
7      B female     1     4
8      C female     1     4
9      D female     1     0
10     E female     1     1
11     A   male     2     3
12     B   male     2     3
13     C   male     2     3
14     D   male     2     8
15     E   male     2     2
16     A female     2     4
17     B female     2     5
18     C female     2     8
19     D female     2     1
20     E female     2     7

| That's a job well done!

  |==============================                                     |  45%

| A third symptom of messy data is when variables are stored in both rows and columns. students3 provides an example of this. Print students3 to the console.

> students3
    name    test class1 class2 class3 class4 class5
1  Sally midterm      A   <NA>      B   <NA>   <NA>
2  Sally   final      C   <NA>      C   <NA>   <NA>
3   Jeff midterm   <NA>      D   <NA>      A   <NA>
4   Jeff   final   <NA>      E   <NA>      C   <NA>
5  Roger midterm   <NA>      C   <NA>   <NA>      B
6  Roger   final   <NA>      A   <NA>   <NA>      A
7  Karen midterm   <NA>   <NA>      C      A   <NA>
8  Karen   final   <NA>   <NA>      C      A   <NA>
9  Brian midterm      B   <NA>   <NA>   <NA>      A
10 Brian   final      B   <NA>   <NA>   <NA>      C

| Great job!

  |================================                                   |  47%

| In students3, we have midterm and final exam grades for five students, each of whom were enrolled in exactly two of five possible classes.

...

  |=================================                                  |  49%

| The first variable, name, is already a column and should remain as it is. The headers of the last five columns, class1 through class5, are all different values of what should be a class variable.
| The values in the test column, midterm and final, should each be its own variable containing the respective grades for each student.

...

  |==================================                                 |  51%

| This will require multiple steps, which we will build up gradually using %>%. Edit the R script, save it, then type submit() when you are ready. Type reset() to reset the script to its original
| state.

> submit()

| Sourcing your script...

    name    test  class grade
1  Sally midterm class1     A
2  Sally   final class1     C
3  Brian midterm class1     B
4  Brian   final class1     B
5   Jeff midterm class2     D
6   Jeff   final class2     E
7  Roger midterm class2     C
8  Roger   final class2     A
9  Sally midterm class3     B
10 Sally   final class3     C
11 Karen midterm class3     C
12 Karen   final class3     C
13  Jeff midterm class4     A
14  Jeff   final class4     C
15 Karen midterm class4     A
16 Karen   final class4     A
17 Roger midterm class5     B
18 Roger   final class5     A
19 Brian midterm class5     A
20 Brian   final class5     C

| All that hard work is paying off!

  |===================================                                |  53%

| The next step will require the use of spread(). Pull up the documentation for spread() now.

> ?spread

| You're the best!

  |=====================================                              |  55%

| Edit the R script, then save it and type submit() when you are ready. Type reset() to reset the script to its original state.

> 
> submit()

| Sourcing your script...

Error : Invalid column specification

| Not quite right, but keep trying.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Error in `[.data.frame`(data, key_col) : undefined columns selected

| Not quite right, but keep trying.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

    name  class final midterm
1  Brian class1     B       B
2  Brian class5     C       A
3   Jeff class2     E       D
4   Jeff class4     C       A
5  Karen class3     C       C
6  Karen class4     A       A
7  Roger class2     A       C
8  Roger class5     A       B
9  Sally class1     C       A
10 Sally class3     C       B

| You're the best!

  |======================================                             |  57%

| Lastly, we want the values in the class column to simply be 1, 2, ..., 5 and not class1, class2, ..., class5. We can use the extract_numeric() function from tidyr to accomplish this. To see how it
| works, try extract_numeric("class5").

> extract_numeric("class5")
[1] 5

| That's correct!

  |=======================================                            |  58%

| Now, the final step. Edit the R script, then save it and type submit() when you are ready. Type reset() to reset the script to its original state.

> submit()

| Sourcing your script...


| Almost! Try again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> ?mutate
> submit()

| Sourcing your script...


| Give it another try.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Error in gsub("[^0-9.-]+", "", as.character(x)) : 
  argument "x" is missing, with no default

| That's not the answer I was looking for, but try again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Error in gsub("[^0-9.-]+", "", as.character(x)) : 
  argument "x" is missing, with no default

| That's not the answer I was looking for, but try again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Error in gsub("[^0-9.-]+", "", as.character(x)) : 
  argument "x" is missing, with no default

| That's not exactly what I'm looking for. Try again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> reset()

| I just reset the script to its original state. If it doesn't refresh immediately, you may need to click on it.

> submit()

| Sourcing your script...

Error in mutate_impl(.data, dots) : 
  could not find function "extract_number"

| Not quite! Try again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...


| Not exactly. Give it another go.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

    name class final midterm
1  Brian     1     B       B
2  Brian     5     C       A
3   Jeff     2     E       D
4   Jeff     4     C       A
5  Karen     3     C       C
6  Karen     4     A       A
7  Roger     2     A       C
8  Roger     5     A       B
9  Sally     1     C       A
10 Sally     3     C       B

| You are amazing!

  |========================================                           |  60%

| The fourth messy data problem we'll look at occurs when multiple observational units are stored in the same table. students4 presents an example of this. Take a look at the data now.

> 
> students4
    id  name sex class midterm final
1  168 Brian   F     1       B     B
2  168 Brian   F     5       A     C
3  588 Sally   M     1       A     C
4  588 Sally   M     3       B     C
5  710  Jeff   M     2       D     E
6  710  Jeff   M     4       A     C
7  731 Roger   F     2       C     A
8  731 Roger   F     5       B     A
9  908 Karen   M     3       C     C
10 908 Karen   M     4       A     A

| You are quite good my friend!

  |==========================================                         |  62%

| students4 is almost the same as our tidy version of students3. The only difference is that students4 provides a unique id for each student, as well as his or her sex (M = male; F = female).

...

  |===========================================                        |  64%

| At first glance, there doesn't seem to be much of a problem with students4. All columns are variables and all rows are observations. However, notice that each id, name, and sex is repeated twice,
| which seems quite redundant. This is a hint that our data contains multiple observational units in a single table.

...

  |============================================                       |  66%

| Our solution will be to break students4 into two separate tables -- one containing basic student information (id, name, and sex) and the other containing grades (id, class, midterm, final).
| 
| Edit the R script, save it, then type submit() when you are ready. Type reset() to reset the script to its original state.

> submit()

| Sourcing your script...

    id  name sex
1  168 Brian   F
2  168 Brian   F
3  588 Sally   M
4  588 Sally   M
5  710  Jeff   M
6  710  Jeff   M
7  731 Roger   F
8  731 Roger   F
9  908 Karen   M
10 908 Karen   M

| That's correct!

  |==============================================                     |  68%

| Notice anything strange about student_info? It contains five duplicate rows! See the script for directions on how to fix this. Save the script and type submit() when you are ready, or type reset()
| to reset the script to its original state.

> submit()

| Sourcing your script...

Error in source(e$script_temp_path) : 
  /tmp/RtmpRR1zXu/script6.R:13:1: unexpected SPECIAL
12:   unique
13: %>%
    ^

| That's not exactly what I'm looking for. Try again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

   id  name sex
1 168 Brian   F
3 588 Sally   M
5 710  Jeff   M
7 731 Roger   F
9 908 Karen   M

| Keep working like that and you'll get there!

  |===============================================                    |  70%

| Now, using the script I just opened for you, create a second table called gradebook using the id, class, midterm, and final columns (in that order).
| 
| Edit the R script, save it, then type submit() when you are ready. Type reset() to reset the script to its original state.

> submit()

| Sourcing your script...

    id class midterm final
1  168     1       B     B
2  168     5       A     C
3  588     1       A     C
4  588     3       B     C
5  710     2       D     E
6  710     4       A     C
7  731     2       C     A
8  731     5       B     A
9  908     3       C     C
10 908     4       A     A

| You are quite good my friend!

  |================================================                   |  72%

| It's important to note that we left the id column in both tables. In the world of relational databases, 'id' is called our 'primary key' since it allows us to connect each student listed in
| student_info with their grades listed in gradebook. Without a unique identifier, we might not know how the tables are related. (In this case, we could have also used the name variable, since each
| student happens to have a unique name.)

...

  |=================================================                  |  74%

| The fifth and final messy data scenario that we'll address is when a single observational unit is stored in multiple tables. It's the opposite of the fourth problem.

...

  |===================================================                |  75%

| To illustrate this, we've created two datasets, passed and failed. Take a look at passed now.

> passed
   name class final
1 Brian     1     B
2 Roger     2     A
3 Roger     5     A
4 Karen     4     A

| That's correct!

  |====================================================               |  77%

| Now view the contents of failed.

> failed
   name class final
1 Brian     5     C
2 Sally     1     C
3 Sally     3     C
4  Jeff     2     E
5  Jeff     4     C
6 Karen     3     C

| Great job!

  |=====================================================              |  79%

| Teachers decided to only take into consideration final exam grades in determining whether students passed or failed each class. As you may have inferred from the data, students passed a class if
| they received a final exam grade of A or B and failed otherwise.

...

  |======================================================             |  81%

| The name of each dataset actually represents the value of a new variable that we will call 'status'. Before joining the two tables together, we'll add a new column to each containing this
| information so that its not lost when we put everything together.

...

  |========================================================           |  83%

| Use dplyr's mutate() to add a new column to the passed table. The column should be called status and the value, "passed" (a character string), should be the same for all students. 'Overwrite' the
| current version of passed with the new one.

> passed<- mutate(passed, status="passed")

| You nailed it! Good job!

  |=========================================================          |  85%

| Now, do the same for the failed table, except the status column should have the value "failed" for all students.

> failed<- mutate(failed, status="failed")

| You got it!

  |==========================================================         |  87%

| Now, pass as arguments the passed and failed tables (in order) to the dplyr function bind_rows(), which will join them together into a single unit. Check ?bind_rows if you need help.
| 
| Note: bind_rows() is only available in dplyr 0.4.0 or later. If you have an older version of dplyr, please quit the lesson, update dplyr, then restart the lesson where you left off. If you're not
| sure what version of dplyr you have, type packageVersion('dplyr').

> ?bind_rows
> bind_rows(passed, failed)
Source: local data frame [10 x 4]

    name class final status
1  Brian     1     B passed
2  Roger     2     A passed
3  Roger     5     A passed
4  Karen     4     A passed
5  Brian     5     C failed
6  Sally     1     C failed
7  Sally     3     C failed
8   Jeff     2     E failed
9   Jeff     4     C failed
10 Karen     3     C failed

| Perseverance, that's the answer.

  |===========================================================        |  89%

| Of course, we could arrange the rows however we wish at this point, but the important thing is that each row is an observation, each column is a variable, and the table contains a single
| observational unit. Thus, the data are tidy.

...

  |=============================================================      |  91%

| We've covered a lot in this lesson. Let's bring everything together and tidy a real dataset.

...

  |==============================================================     |  92%

| The SAT is a popular college-readiness exam in the United States that consists of three sections: critical reading, mathematics, and writing. Students can earn up to 800 points on each section. This
| dataset presents the total number of students, for each combination of exam section and sex, within each of six score ranges. It comes from the 'Total Group Report 2013', which can be found here:
| 
| http://research.collegeboard.org/programs/sat/data/cb-seniors-2013

...

  |===============================================================    |  94%

| I've created a variable called 'sat' in your workspace, which contains data on all college-bound seniors who took the SAT exam in 2013. Print the dataset now.

> sat
Source: local data frame [6 x 10]

  score_range read_male read_fem read_total math_male math_fem math_total write_male write_fem write_total
1     700-800     40151    38898      79049     74461    46040     120501      31574     39101       70675
2     600-690    121950   126084     248034    162564   133954     296518     100963    125368      226331
3     500-590    227141   259553     486694    233141   257678     490819     202326    247239      449565
4     400-490    242554   296793     539347    204670   288696     493366     262623    302933      565556
5     300-390    113568   133473     247041     82468   131025     213493     146106    144381      290487
6     200-290     30728    29154      59882     18788    26562      45350      32500     24933       57433

| All that hard work is paying off!

  |================================================================   |  96%

| As we've done before, we'll build up a series of chained commands, using functions from both tidyr and dplyr. Edit the R script, save it, then type submit() when you are ready. Type reset() to reset
| the script to its original state.

> submit()

| Sourcing your script...

Error in source(e$script_temp_path) : 
  /tmp/RtmpRR1zXu/script8.R:20:39: unexpected SPECIAL
19:   gather(part_sex, value, -score_range) %>%
20:   separate(part_sex,c("part","sex"))> %>%
                                          ^

| One more time. You can do it!

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Error in source(e$script_temp_path) : 
  /tmp/RtmpRR1zXu/script8.R:20:39: unexpected SPECIAL
19:   gather(part_sex, value, -score_range) %>%
20:   separate(part_sex,c("part","sex")) >%>%
                                          ^

| That's not exactly what I'm looking for. Try again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Source: local data frame [36 x 4]

   score_range part  sex  value
1      700-800 read male  40151
2      600-690 read male 121950
3      500-590 read male 227141
4      400-490 read male 242554
5      300-390 read male 113568
6      200-290 read male  30728
7      700-800 read  fem  38898
8      600-690 read  fem 126084
9      500-590 read  fem 259553
10     400-490 read  fem 296793
..         ...  ...  ...    ...

| One more time. You can do it!

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Source: local data frame [36 x 4]

   score_range part  sex  value
1      700-800 read male  40151
2      600-690 read male 121950
3      500-590 read male 227141
4      400-490 read male 242554
5      300-390 read male 113568
6      200-290 read male  30728
7      700-800 read  fem  38898
8      600-690 read  fem 126084
9      500-590 read  fem 259553
10     400-490 read  fem 296793
..         ...  ...  ...    ...

| That's not exactly what I'm looking for. Try again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Source: local data frame [36 x 4]

   score_range part  sex  count
1      700-800 read male  40151
2      600-690 read male 121950
3      500-590 read male 227141
4      400-490 read male 242554
5      300-390 read male 113568
6      200-290 read male  30728
7      700-800 read  fem  38898
8      600-690 read  fem 126084
9      500-590 read  fem 259553
10     400-490 read  fem 296793
..         ...  ...  ...    ...

| You are doing so well!

  |================================================================== |  98%

| Finish off the job by following the directions in the script. Save the script and type submit() when you are ready, or type reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Error in source(e$script_temp_path) : 
  /tmp/RtmpRR1zXu/script9.R:20:3: unexpected ')'
19:          ###
20:   )
      ^

| You're close...I can feel it! Try it again.

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Error in source(e$script_temp_path) : 
  /tmp/RtmpRR1zXu/script9.R:19:3: unexpected SPECIAL
18:   mutate(total =sum(count), prop=count/total)
19:   %>%
      ^

| Keep trying!

| Read the directions in the script carefully. If R is giving you an error, try to understand what it is telling you. Save the script and type submit() at the prompt when you are ready, or type
| reset() to reset the script to its original state.

> submit()

| Sourcing your script...

Source: local data frame [36 x 6]
Groups: part, sex

   score_range part  sex  count  total       prop
1      700-800 read male  40151 776092 0.05173485
2      600-690 read male 121950 776092 0.15713343
3      500-590 read male 227141 776092 0.29267278
4      400-490 read male 242554 776092 0.31253253
5      300-390 read male 113568 776092 0.14633317
6      200-290 read male  30728 776092 0.03959324
7      700-800 read  fem  38898 883955 0.04400450
8      600-690 read  fem 126084 883955 0.14263622
9      500-590 read  fem 259553 883955 0.29362694
10     400-490 read  fem 296793 883955 0.33575578
..         ...  ...  ...    ...    ...        ...

| All that hard work is paying off!

  |===================================================================| 100%

| In this lesson, you learned how to tidy data with tidyr and dplyr. These tools will help you spend less time and energy getting your data ready to analyze and more time actually analyzing it.
