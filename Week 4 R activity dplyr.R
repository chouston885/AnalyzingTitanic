#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))
library(datasets)
Titanic_dataset <- datasets::Titanic
titanic_df= as.data.frame(Titanic_dataset)
View(titanic_df)
#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(titanic_df,4)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(dplyr)

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
select(titanic_df, c('Survived','Sex'))


#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

survived_gender_titanic_df <- select(titanic_df, c('Survived','Sex'))

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
survived_gender_titanic_df <- select(survived_gender_titanic_df, -c('Sex'))

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
rename(titanic_df, Gender = Sex)


#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
gender_titanic_df<- rename(titanic_df, Gender = Sex)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
filter(gender_titanic_df,Gender=='Male')
males_titanic_df=filter(gender_titanic_df,Gender=='Male')

#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
arrange(gender_titanic_df,Gender)

#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:2201
sum(titanic_df$Freq)

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
filter(gender_titanic_df,Gender=='Female')
females_titanic_df=filter(gender_titanic_df,Gender=='Female')

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
union(males_titanic_df,females_titanic_df)
union_gender_titanic_df=union(males_titanic_df,females_titanic_df)



#Optional Task: add any of the other functions 
#you learned about from the dplyr package

summarise(titanic_df, n()) #counts the number of objects
titanic_df %>% summarise(n()) # different way to use functions, more similar to python etc
count(titanic_df, Class) #show counts, grouping by class
count(titanic_df, Sex) # show counts, grouping by sex
