##If you have not installed these packages yet, delete double hashtags from "install.packages" to start importing packages

##install.packages("tidyverse")
##install.packages("caTools")
##install.packages("randomForest")
##install.packages("e1071")

##Loads libraries, some plotting ones to be used at a later date for visualizations.
library(tidyverse)
library(caTools)
library(randomForest)


# Reads the CSV file, make sure you enter correct filepath!
strokeTable <- read.csv("Stroketable.csv filepath place here")

# Display the first few rows of the dataframe for reference
head(strokeTable)

# Small general cleaning which converts strokeTable to data_cleaned,the StrokeTablegenerator file works good but you always want to make sure. Also note it deletes entire rows which for this instance is ok due to large number of them
data_cleaned <- na.omit(strokeTable)

# This encodes columns as categorical variables to be used in the Machine Learning model. (hardcoded for now)
data_cleaned$gender <- as.factor(data_cleaned$gender)
data_cleaned$ever_married <- as.factor(data_cleaned$ever_married)
data_cleaned$work_type <- as.factor(data_cleaned$work_type)
data_cleaned$Residence_type <- as.factor(data_cleaned$Residence_type)
data_cleaned$smoking_status <- as.factor(data_cleaned$smoking_status)

##The next set uses caTools to split the dataset by 80%, the 80% being used in the training set and the reminading 20%
##- to be used in the testing sample, to test for accuracy. set.seed is used for reproducibility.
set.seed(42)
split <- sample.split(data_cleaned$stroke, SplitRatio = 0.8)
training_set <- subset(data_cleaned, split == TRUE)
testing_set <- subset(data_cleaned, split == FALSE)


##Converts a desired variable as a factor data type(stroke column)
training_set$stroke <- as.factor(training_set$stroke)

##Using the ML Random forest model(randomForest package) to create the prediction table.
set.seed(42)
ranf_model <- randomForest(stroke ~ ., strokeTable = training_set)

## Uses the predict function in R to make predictions on the testing_set and turn into a new variable to compare later.
rfor_prediction <- predict(ranf_model, newdata = testing_set)

##This prints the summary of the model.
print(ranf_model)





