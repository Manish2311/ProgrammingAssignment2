
# makeCacheMatrix is a function that returns a list of functions

# Its puspose is to store a martix and a cached value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

# initially nothing is cached so set cache equal to NULL

cache <- NULL

# store a matrix

setMatrix <- function(newValue) {
               
 x <<- newValue
                
# since the matrix is given a new value so flush the cache

			cache <<- NULL

}

# returns the stored matrix

getMatrix <- function() {

x

}

 # cache the given argument 

cacheInverse <- function(solve) {
                
cache <<- solve

}


# get the cached value


getInverse <- function() {
                
cache

        }

# return a list. Each name of element in the list is a function name


list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)

}



## The following function calculates the inverse of a "special" matrix created with makeCacheMatrix


cacheSolve <- function(y, ...) {
        

# get the cached value


inverse <- y$getInverse()


# if a cached value exists then return cache value 


if(!is.null(inverse)) {
                

message("getting cached data")
                

return(inverse)

}

# otherwise get the matrix, caclulate inverse of it and store its value in the cache

data <- y$getMatrix()
        
inverse <- solve(data)
        
y$cacheInverse(inverse)


# return the inverse value

inverse

}
