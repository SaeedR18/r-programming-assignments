# Module 8 - Input/Output, String Manipulation, and plyr Package

# Install required package 
install.packages("plyr")

# Load library
library(plyr)

# STEP 1: Import dataset

# Use file.choose() so we can select the Assignment 6 Dataset.txt file
students <- read.table(file.choose(), header = TRUE, sep = ",")

# View dataset
students

# STEP 2: Calculate mean grade by Sex using plyr

students_gendered_mean <- ddply(
  students,
  "Sex",
  transform,
  Grade.Average = mean(Grade)
)

# View result
students_gendered_mean

# STEP 3: Write this output to a file

write.table(
  students_gendered_mean,
  "Students_Gendered_Mean.csv",
  sep = ",",
  row.names = FALSE
)

# STEP 4: Filter names containing the letter "i"

i_students <- subset(
  students,
  grepl("i", students$Name, ignore.case = TRUE)
)

# View filtered dataset
i_students

# STEP 5: Write filtered dataset to CSV

write.table(
  i_students,
  "Students_With_I.csv",
  sep = ",",
  row.names = FALSE
)
