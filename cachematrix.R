## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        # x: output of makeCacheMatrix()
        # return : inverse of the original matrix input to makeCacheMatrix()
        inv <- x$getinv()
        # if the inverse has already been calculated
        if(!is.null(inv)) {
                #get it from the cache and skip the computation
                message("getting cached data")
                return(inv)
        }
        # otherwise, calculates the inverse
        data <- x$get()
        inv <- solve(data, ...)
        #sets the value of the inverse in the cache via the setinv
        x$setinv(inv)
        return(inv)
}

