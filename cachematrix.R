## function to save the cache of inverse of the incoming matrix
##  
makeCacheMatrix <- function (matrix) {
  m <- NULL
  
  set <- function(newM) {
    matrix <<- newM
    m <<- NULL
  }
  
  get <- function() {
    matrix
  }
  
  setInverse <- function(inv) {
    m <<- inv
  }
  
  getInverse <- function() {
    m;
  }
  
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}

## check whethter there is cached inverse object, if not create one; 
## otherwise return the cached object
cacheSolve <- function (x, ...) {
  m <- x$getInverse()
  
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  m <- solve(x$get())
  
  x$setInverse(m);

  m
}
