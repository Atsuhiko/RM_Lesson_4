# rm_main is a mandatory function, 
# the number of arguments has to be the number of input ports (can be none)
rm_main = function(data)
{

options(repos="https://cran.ism.ac.jp/") #install.packages()�̃_�E�����[�h��w��
install.packages("caret")
install.packages("ranger")
install.packages("e1071")
install.packages("dplyr")
install.packages("doParallel")
library(caret)
library(ranger)
library(e1071)
library(dplyr)

# ���񉻉��Z���s��
# https://logics-of-blue.com/r%E3%81%AB%E3%82%88%E3%82%8B%E6%A9%9F%E6%A2%B0%E5%AD%A6%E7%BF%92%EF%BC%9Acaret%E3%83%91%E3%83%83%E3%82%B1%E3%83%BC%E3%82%B8%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9/
library(doParallel)
cl <- makePSOCKcluster(4)
registerDoParallel(cl)

# ��������10�� 
fitControl <- trainControl(method = "repeatedcv",
                           number = 10,
                           repeats = 10,
                           selectionFunction = "best") # repeated ten times

# fit a random forest model (using ranger/��������10�񂵂čœK��)
rf_fit <- train(as.factor(target_class) ~ ., #�֐�as.factor( )���g�����Ƃɂ���āC���q�^�ɕϊ�
                data = data, 
                method = "ranger",
                trControl = fitControl)

return(rf_fit)
}