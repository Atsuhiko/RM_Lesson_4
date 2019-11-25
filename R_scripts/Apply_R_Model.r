## load the trained model and apply it on the test data

rm_main = function(model, data)
{
 
   # apply the model and build a prediction
   result <- predict(model, data)

   # add the prediction to the example set
   data$prediction <- result
   
   # update the meta data
   metaData$data$prediction <<- list(type="polinominal", role="prediction")
   metaData$data$target$type <<- "polynominal"

   return(data)

}
