## makeCacheMatrix returns a matrix that is a list with the defined abilities.

## cacheSolve returns the inverse of a matrix by providing a cached value or
## solving.

## Sets the inverse to null. Sets x. Makes get x funtion. Sets x's inverse.
## Makes get x's inverse function.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Returns the inverse of matrix x. If it has already been solved it returns
## the cached value.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("Getting cached data.")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
