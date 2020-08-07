library(data.table)
library(dplyr)
library(dtplyr)
setwd("C:/Users/larcos/Personales/Personal/Coursera/Proyectos/G&C_Data/UCI HAR Dataset/")

training <- fread("./train/X_train.txt")
test <- fread("./test/X_test.txt")
features <- fread('features.txt')

titulos <- unlist(features[,2])
names(training) <- titulos
names(test) <- titulos

#training$source <- "training"
label_training <- fread('./train/y_train.txt')
training$label <- label_training
training_subject <- fread("./train/subject_train.txt")
training$subject <- training_subject

#test$source <- "test"
label_test <- fread('./test/y_test.txt')
test$label <- label_test
test_subject <- fread('./test/subject_test.txt')
test$subject <- test_subject

### 1. Merges the training and the test sets to create one data set.
join <- rbind(training,test)

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
columnas1 <- names(join)[c(grep("mean()",titulos),grep("std()",titulos))]
columnas2 <- c("subject","label",columnas1)

join_medidas <- subset(join, select = columnas)

### 3. Uses descriptive activity names to name the activities in the data set
labels <- read.table('activity_labels.txt')
names(labels) <- c("label", "activity")

### 4. Appropriately labels the data set with descriptive variable names.
join_medidas_activivity <- subset(merge(join_medidas, labels, by="label"), select = -label)

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

pr0 <- as_tibble(join_medidas_activivity) %>% group_by(subject,activity)

nva <- pr0 %>% summarise(mean( .data[[columnas1[1]]] ),mean( .data[[columnas1[2]]] ),mean( .data[[columnas1[3]]] ),mean( .data[[columnas1[4]]] ),mean( .data[[columnas1[5]]] ),mean( .data[[columnas1[6]]] ),mean( .data[[columnas1[7]]] ),mean( .data[[columnas1[8]]] ),mean( .data[[columnas1[9]]] ),mean( .data[[columnas1[10]]] ),mean( .data[[columnas1[11]]] ),mean( .data[[columnas1[12]]] ),mean( .data[[columnas1[13]]] ),mean( .data[[columnas1[14]]] ),mean( .data[[columnas1[15]]] ),mean( .data[[columnas1[16]]] ),mean( .data[[columnas1[17]]] ),mean( .data[[columnas1[18]]] ),mean( .data[[columnas1[19]]] ),mean( .data[[columnas1[20]]] ),mean( .data[[columnas1[21]]] ),mean( .data[[columnas1[22]]] ),mean( .data[[columnas1[23]]] ),mean( .data[[columnas1[24]]] ),mean( .data[[columnas1[25]]] ),mean( .data[[columnas1[26]]] ),mean( .data[[columnas1[27]]] ),mean( .data[[columnas1[28]]] ),mean( .data[[columnas1[29]]] ),mean( .data[[columnas1[30]]] ),mean( .data[[columnas1[31]]] ),mean( .data[[columnas1[32]]] ),mean( .data[[columnas1[33]]] ),mean( .data[[columnas1[34]]] ),mean( .data[[columnas1[35]]] ),mean( .data[[columnas1[36]]] ),mean( .data[[columnas1[37]]] ),mean( .data[[columnas1[38]]] ),mean( .data[[columnas1[39]]] ),mean( .data[[columnas1[40]]] ),mean( .data[[columnas1[41]]] ),mean( .data[[columnas1[42]]] ),mean( .data[[columnas1[43]]] ),mean( .data[[columnas1[44]]] ),mean( .data[[columnas1[45]]] ),mean( .data[[columnas1[46]]] ),mean( .data[[columnas1[47]]] ),mean( .data[[columnas1[48]]] ),mean( .data[[columnas1[49]]] ),mean( .data[[columnas1[50]]] ),mean( .data[[columnas1[51]]] ),mean( .data[[columnas1[52]]] ),mean( .data[[columnas1[53]]] ),mean( .data[[columnas1[54]]] ),mean( .data[[columnas1[55]]] ),mean( .data[[columnas1[56]]] ),mean( .data[[columnas1[57]]] ),mean( .data[[columnas1[58]]] ),mean( .data[[columnas1[59]]] ),mean( .data[[columnas1[60]]] ),mean( .data[[columnas1[61]]] ),mean( .data[[columnas1[62]]] ),mean( .data[[columnas1[63]]] ),mean( .data[[columnas1[64]]] ),mean( .data[[columnas1[65]]] ),mean( .data[[columnas1[66]]] ),mean( .data[[columnas1[67]]] ),mean( .data[[columnas1[68]]] ),mean( .data[[columnas1[69]]] ),mean( .data[[columnas1[70]]] ),mean( .data[[columnas1[71]]] ),mean( .data[[columnas1[72]]] ),mean( .data[[columnas1[73]]] ),mean( .data[[columnas1[74]]] ),mean( .data[[columnas1[75]]] ),mean( .data[[columnas1[76]]] ),mean( .data[[columnas1[77]]] ),mean( .data[[columnas1[78]]] ),mean( .data[[columnas1[79]]] ))

#write.table(nva,"TablaFinal.txt", row.name=FALSE)
