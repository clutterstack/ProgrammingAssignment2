## Function makeCacheMatrix creates a special "matrix" object 
## that can cache its inverse. The cacheSolve function below can be
## run on the output of this function 
makeCacheMatrix <- function(x = matrix()) {
  ## Return a list with the set and get methods for the matrix
  ## passed to it and for its inverse.
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get, 
       setinverse = setinverse,
       getinverse = getinverse)
}


## Function cacheSolve computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then cacheSolve will retrieve the inverse from the
## cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  ## Here assuming matrix x is always invertible.
  inv <- solve(data)
  x$setinverse(inv)
  inv
}


