## Really trivial test that the functions in cachematrix.R work.
rm(list = ls())
source("cachematrix.R")
A = matrix(c(0,1,2,1,0,3,4,-3,8), nrow=3, ncol=3,byrow=TRUE)
makeCacheMatrix(A)
fatmat <- makeCacheMatrix(A)
fatmat$get()
fatmat$getinverse()
cacheSolve(fatmat)
