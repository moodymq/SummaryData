include(plyr)

su_data <- function(inputMatrix, funcs, envir = parent.frame()){
  inputMatrix <- data.matrix(inputMatrix)
  outputData <- matrix(nrow = 0, ncol = length(funcs))
  for(i in 1:dim(inputMatrix)[2]){
    outputData <- rbind(outputData, Map(function(nm) do.call(nm, list(inputMatrix[,i]), envir = envir), setNames(funcs, funcs)))
  }
  rownames(outputData) <- colnames(inputMatrix)
  return(outputData)
}

sum_by_group <- function(inputs, funcs, groups, envir = parent.frame()){
  outputData <- matrix(nrow = dim(inputs)[2] - 1, ncol = 0)
  for(i in 1:nlevels(inputs[,which(names(inputs) == as.name(groups))])){
    sub_data <- subset(inputs, inputs[,which(names(inputs) == groups)] == levels(inputs[,which(names(inputs) == groups)])[i])
    sub_data <- su_data(sub_data[,-which(names(sub_data) == as.name(groups))], funcs, envir)
    colnames(sub_data) <- paste(colnames(sub_data), ", ", groups, " = ", as.character(levels(inputs[,which(names(inputs) == groups)])[i]), sep = "")
    outputData <- cbind(outputData, sub_data)
  }
  return(outputData)
}