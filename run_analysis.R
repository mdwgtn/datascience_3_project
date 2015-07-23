library(stringr)
library(plyr)
library(dplyr)
library(reshape2)

#setwd("/Users/michaeldavidson/Documents/Coursera/DataScience/3/assignment/UCI HAR Dataset")


# factorsNumeric turns all the factor-valued columns named in its list argument 
#  into numeric columns.
# See http://stackoverflow.com/questions/8596466/r-change-all-columns-of-type-factor-to-numeric
asNumeric <- function(x) as.numeric(as.character(x))
factorsNumeric <- function(d) modifyList(d, lapply(d[, sapply(d, is.factor)], asNumeric))

# Get the activity name map
activity_labels <- read.csv2("activity_labels.txt",sep=" ",header=FALSE)
colnames(activity_labels) <- c("id","activity")

# Get the feature name map
features <- read.csv2("features.txt",sep=" ", header=FALSE)
colnames(features) <- c("id","feature")

# Identify features we care about: these have "[M|m]ean" or "[S|s]td" in their names.
myFeatures <- features[features$id %in% grep("-mean\\(|-std\\(",features$feature),]

# Read in the values from the "test" subdirectory...
xtest <- read.csv2("test/X_test.txt",header=FALSE,strip.white=TRUE,sep="")
# ...keep only columns we care about
xtest <- xtest[,features$id %in% grep("-mean\\(|-std\\(",features$feature)]
# ...set the remaining columns' names using the feature map 
colnames(xtest) <- myFeatures$feature
# ...reinterpret all scientific notation as numerics
xtest <- factorsNumeric(xtest)
# Now read in the file that gives the subject related to each row in xtest
subject_test <- read.csv2("test/subject_test.txt",header=FALSE)
# ... Add the subjects as a column
xtest <- cbind(xtest,subject=subject_test$V1)
# Now read in the file the gives the activity related to each row in xtest
ytest <- read.csv2("test/y_test.txt",header=FALSE)
# ... Add the activity numbers as a column
xtest <- cbind(xtest,act=ytest$V1)
# ... Add the corresponding name of each activity as a column
xtest <- merge(xtest, activity_labels, by.x="act",by.y="id")

# The next block does exactly the same steps, but for the "train" subdirectory.
xtrain <- read.csv2("train/X_train.txt",header=FALSE,strip.white=TRUE,sep="")
xtrain <- xtrain[,features$id %in% grep("-mean\\(|-std\\(",features$feature)]
colnames(xtrain) <- myFeatures$feature
xtrain <- factorsNumeric(xtrain)
subject_train <- read.csv2("train/subject_train.txt",header=FALSE)
xtrain <- cbind(xtrain,subject=subject_train$V1)
ytrain <- read.csv2("train/y_train.txt",header=FALSE)
xtrain <- cbind(xtrain,act=ytrain$V1)
xtrain <- merge(xtrain, activity_labels, by.x="act",by.y="id")

# Concatenate the two data sets
xall <- rbind(xtest,xtrain)
# Get rid of the superfluous "act" column that contains activity numbers
xall$act <- NULL
# Turn subject into a factor
xall <- mutate (xall, subject = as.factor(xall$subject))
# Get a long format, bring the many measurement column names in as values on a single column
xallmelt <- melt(xall,id=c("subject","activity"),measure.vars=myFeatures$feature)
# Put some nicer names on the column headers
colnames(xallmelt) <- c("subject", "activity", "measurement", "mean_value")
# Get the mean value of mean_value per(subject-activity-measurement) triple
result <- aggregate(mean_value ~ subject + activity + measurement, data=xallmelt, mean)
# Dump to file in requested format
write.table(result,"result.txt",row.name=FALSE)