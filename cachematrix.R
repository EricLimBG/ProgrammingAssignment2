## Start of cachematrix.R ##
## -------------------------------------------------------
## Matrix inversion is usually a costly computation and 
## there may be some benefit to caching the inverse of 
## a matrix rather than computing it repeatedly.This R 
## script contains a pair of functions that can be used 
## to implement such caching.
##
## For example, if cacheSolve has been called before on 
## a special matrix X (created using makeCacheMatrix), 
## then subsequent calls will return its cached value.
##
## It is to be noted that the solve function in R is used 
## in here specifically for inversion purpose, and not for 
## its other functionalities. It is also assumed that the 
## matrix supplied is always invertible.


## The below function creates a special "matrix" object 
## that caches its inverse for subsequent retrieval
## using the cacheSolve function below.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
      setsolve = setsolve,
      getsolve = getsolve)
}


## The below function computes the inverse of the special
## "matrix" returned by makeCacheMatrix above. If the 
## inverse has already been calculated (and the matrix 
## has not changed), then cacheSolve would retrieve the 
## inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("-- Returning Cached Data --")
  }
  else {
    m <- solve(x$get(), ...)
    x$setsolve(m)
  }
  return(m)
}


##
## Created By   : Eric Lim B G
## Created Date : 23-Aug-2014
## -------------------------------------------------------
## End of cachematrix.R ##
