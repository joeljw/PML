# Practical Machine Learning - Predicting Fuel Band Activity

library(caret)
library(kernlab)

source("pml_write_files.R")
setwd("~/Documents/Online Classes/Coursera/Practical Machine Learning/")

training = read.csv("pml-training.csv")
testing = read.csv("pml-testing.csv")

clean_train = training[, colSums(is.na(training)) ==0]
clean_test = testing[, colSums(is.na(testing)) == 0]
M = abs(cor(clean_train[,8:59]))
diag(M) = 0
modelfit = train(clean_train$classe ~ ., method='knn', preProcess='pca',data=clean_train)
predClasse = predict(modelfit,clean_test)

pml_write_files(predClasse)
