## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## This function creates a "matrix" object that can cache its inverse
}
makeCacheMatrix <- function(x = matrix()) { ## define the argument with default mode of "matrix"
  inver <- NULL                             ## initialize inver as NULL and it will hold value of matrix inverse 
   set <- function(y) {                    ## define the set function to assign new 
        x <<- y                             ## it's value of matrix in parent environment
        inver <<- NULL                        ## if there is a new matrix, reset inver value to NULL
    }
    get <- function() x                     ## define the get function which returns value of the matrix argument
    
    setinverse <- function(inverse) inver <<- inverse  ## assigns value of inver in parent environment
    getinverse <- function() inver                     ## gets the value of inver to where it is called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## to refer to the functions with the $ operator
 }

## Write a short comment describing this function
##cacheSolve will retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inver <- x$getinverse()
    if(!is.null(inver)) {
        message("getting cached data")
        return(inver)
    }
    data <- x$get()
    inver <- solve(data, ...)
    x$setinverse(inver)
    inver
}

