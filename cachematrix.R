
# An overview of the two functions 

  # The inversion of matrices is a computationally intensive process. It maybe
  # prudent to calculate it once and store it in a cache. Whenever it is needed,
  # it is quicker to retrieve it from the cache than compute it again.
  # These two functions demonstrate this process.


# makeCacheMatrix

  # creates a matrix object which is used to store its inverse
  # computed by the cachesolve function.
  # This function: 
  # initialises the objects x and inv
  # defines the getters and setters for objects of type makeCacheMatrix()
  # assigns the methods as elements within a list

makeCacheMatrix <- function(x = matrix()) { # initialises x
    inv <- NULL # initialised for later use
    
  ## methods
    
    set <- function(y){
      x <<- y                   # assigns input argument to x object in the 
                                # parent environment
    inv <<- NULL                # clears any existing value of inv cached through
                                # a previous execution of cacheSolve
    }
    
    
    get <- function(){
      x                         # retrieves x vector from parent environment
    }
    
    
    setinverse <- function(inverse){
      inv <<- inverse           # assigns input argument to value of inv in 
                                # parent environment
    }
    
    getinverse <- function(){
      inv                       # retrieves inv from parent environment
    }
    
    list(set = set,
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve

  # checks if makeCacheMatrix has the inverse in storage
  # if it has this is used rather than compute a new one
  # This is used as long there is no new input values
  # If there is new input, cache is nulled and cacheSolve calculates
  # an updated, correct one

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
    inv <- x$getinverse()              # attempts to retrieve inverse
    
    if(!is.null(inv)){                 # checks whether result is null or not
      message("Getting cached data")   # if not null and no new values have been input
                                       # stored inverse is retrieved
      return(inv) 
    }
    
    aVector <- x$get()                 # if null cacheSolve calls get() to retrieve x
       inv <- solve(aVector,...)       # and new inverse is computed and stored in inv
       x$setinverse(inv)               # sets the new inverse
      inv                              # updated inverse
}
