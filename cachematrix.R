## Function makeCacheMatrix takes a normal matrix and creates a special "matrix"
## object that can cache its inverse. The cacheSolve function can be applied to 
## the output of this function
makeCacheMatrix <- function(x = matrix()) {
  ## Return a list with the set and get methods for the matrix
  ## and its inverse.
  inv <- NULL # When the object is first created, its inverse is undefined
  set <- function(y) { 
    x <<- y 
    inv <<- NULL
  }
  get <- function() x 
  setinverse <- function(inverse) inv <<- inverse # Method to cache the inverse
  getinverse <- function() inv # Method to retrieve the cached inverse if any
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
  # First try to get a cached inverse using the getinverse() method
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  # If there's no cached value (i.e. inv == NULL), calculate it, then
  # cache it using the setinverse() method.
  data <- x$get()
  inv <- solve(data) # Here assume matrix x is always invertible.
  x$setinverse(inv) 
  inv
}


