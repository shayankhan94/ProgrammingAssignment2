## Put comments here that give an overall description of what your
## functions do

## Simply put, following is a pair of functions that cache the inverse of a matrix.


## Write a short comment describing this function

## What this makeCacheMatrix function does is simple, it just simply <<- operator which can be used
## to assign a value to an object in an environment that is different from the current environment.


makeCacheMatrix <- function(x = matrix()) 
{
    matrix1 <- NULL
    set <- function(y)
    {
        x <<- y
        matrix1 <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) matrix1 <<-inverse
    getInverse <- function() matrix1
    list(set = set, get = get,
    setInverse = setInverse,
    getInverse = getInverse)
}


## Write a short comment describing this function

## The following function calculates the inverse of the matrix created with the above function.
## However, it first checks to see if the inverse has already been calculated. If so, it gets the
## inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the 
## matrix and sets the value of the inverse in the cache via the set function.

cacheSolve <- function(x, ...) 
{
    ## Return a matrix that is the inverse of 'x'
    matrix1 <- x$getInverse()
    if ( ! is.null(matrix1)) 
    {
        print("just getting the cached data, please wait")
        return(matrix1)
    }
    matrix1 <- solve(x$get())
    x$setInverse(matrix1)
    matrix1
}
