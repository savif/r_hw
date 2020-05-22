## Put comments here that give an overall description of what your
## functions do
## Purpose of these functions is to avoid repeated computation of matrix inversion (or other costly computations). 
## The cached calculated matrix inversion could be retrieved when needed accelerating the 
## program run

## Write a short comment describing this function
## Creats a "matrix" object, m, where the calculated matrix inverse
##is cached
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x<<-y
                m<<-NULL
        }
        get <- function()x
        set_inverse <- function(inverse) m <<-inverse
        get_inverse <- function()m
        list(set = set, get = get,
             set_inverse = set_inverse,
             get_inverse = get_inverse)
}


## Write a short comment describing this function

##retrieves the cached matrix inverse
##computes the inverse of matrix, m, if not yet solved
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m<- x$get_inverse()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m<- solve(mat, ...)
        x$set_inverse(m)
        m
}

