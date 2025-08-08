
# 1 - Create the folders we need

dir.create("raw_data", showWarnings = FALSE)
dir.create("clean_data", showWarnings = FALSE)
dir.create("scripts", showWarnings = FALSE)
dir.create("results", showWarnings = FALSE)
dir.create("plots", showWarnings = FALSE)


# 2 - Load the dataset

patient_data <- read.csv("C:/users/Samas/Downloads/patient_info.csv", stringsAsFactors = FALSE)
head(patient_data)
str(patient_data)
summary(patient_data)


#3 - Cleaning the data

# Converting IDs and text columns that are categories into factors
patient_data$patient_id <- as.factor(patient_data$patient_id)
patient_data$gender <- as.factor(patient_data$gender)
patient_data$diagnosis <- as.factor(patient_data$diagnosis)
patient_data$smoker <- as.factor(patient_data$smoker)

# Making sure numbers are stored as numeric
patient_data$age <- as.numeric(patient_data$age)
patient_data$bmi <- as.numeric(patient_data$bmi)

# Adding a binary smoking status column (Yes = 1, No = 0)
patient_data$smoking_status_bin <- ifelse(patient_data$smoker == "Yes", 1, 0)
patient_data$smoking_status_bin <- as.factor(patient_data$smoking_status_bin)

# Check the structure after cleaning
str(patient_data)


# 4 - Save the cleaned data
write.csv(patient_data, "clean_data/patient_info_clean.csv", row.names = FALSE)
