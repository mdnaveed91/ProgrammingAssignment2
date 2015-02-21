## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

## Write a short comment describing this function

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)    ## Return a matrix that is the inverse of 'x'
}
 matrix<-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}
test <- function(){
  
  t <- matrix(c(1,3,1,2),nrow=2)  # Creating a new matrix
  message("Input Matrix:"); print(t)
  
  message("Calling makeCacheMatrix")
  t2 <- makeCacheMatrix(t)        # Creating special matrix object
  #print(t2)
  
  message("Calling cacheSolve (1st time)")
  print(cacheSolve(t2))           # Generating inverse
  
  message("Calling cacheSolve (2nd time)")
  cacheSolve(t2)                  # Generating inverse (returned from cache)
  
}
