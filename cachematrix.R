## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  ##produce an random even numbered integer for creating a square matrix
  
  N=2*sample(1:10,1,FALSE,prob = NULL)
  
  
  
  ##create a matrix by taking the value of N and squaring it to produce
  ##a square matrix with correct number of values for the matrix
  
  Y <- matrix(rnorm((N)^2), nrow=N,ncol=N)
  
  ##solve matrix x to cache the inverse
  matrix2 <<- solve(Y)
  x <<- Y
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  ## test to see if matrix x exists and that it has more than 0 rows
  if (exists("x") == TRUE && nrow(x) > 0 )
  {    
    ## test to see if cached inverse matrix of x called matrix2 exists  
    if (exists("matrix2") == TRUE && nrow(matrix2) > 0) {
      
      ## test to see if matrix x has changed by comparing solve of the
      ## passed in variable matrix x to cached matrix2, if they match then return matrix2
      ## if they don't solve(x)
      if (identical(solve(x),matrix2) == TRUE) {return(matrix2)} 
      else{
        matrix2 <<- solve(x)
        return(solve(x))}
      
    }
    
    else{
      
      ##if matrix x and cached Matrix 2 do not exist, then create a matrix and solve it by calling makeCacheMatrix
      ##and then returning the cached matrix2
      
      
      makeCacheMatrix()
      return(matrix2)     
    }
  }  
  
}
