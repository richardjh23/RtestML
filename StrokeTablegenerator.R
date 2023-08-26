set.seed(42)
id <- 1:100
gender <- sample(c("male", "female"), 100, replace = TRUE)
age <- sample(18:80, 100, replace = TRUE)
hypertension <- sample(0:1, 100, replace = TRUE)
ever_married <- sample(c("Yes", "No"), 100, replace = TRUE)
work_type <- sample(c("Private", "Self_employed", "Govt_job"), 100, replace = TRUE)
Residence_type <- sample(c("Urban", "Rural"), 100, replace = TRUE)
avg_glucose_level <- sprintf("%.2f", runif(100, 70, 240)) # Formatted to two decimal places without trailing zeros
BMI <- runif(100, 18, 40)
smoking_status <- sample(c("smokes", "Unknown", "formerly_smoked", "never_smoked"), 100, replace = TRUE)
stroke <- sample(0:1, 100, replace = TRUE)

data <- data.frame(id, gender, age, hypertension, ever_married, work_type, Residence_type, avg_glucose_level, BMI, smoking_status, stroke)

write.csv(data, "StrokeTableTest.csv", row.names = FALSE)


