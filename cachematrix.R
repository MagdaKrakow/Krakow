## Matrix inversion is usually a costly computation and there may be some benefits to
## caching the inverse of a matrix rather than compute it repeatedly.
## There are a pair of functions that cashe the inverse of a matrix

## CacheMatrix - this function creates a special "matrix" object that can cache its
## inverse.

makeCacheMatrix <- function(x = matrix()) {
 inv<-NULL
 set<-function(y) {
 	inv<<-y
 	inv<<-NULL
 }
 get<-function()x
 setinverse<-function(inverse) inv<<-inverse
 getinverse<-funtion()inv
 list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## cacheSolve - this function computes the inverse of the special "matrix" returned by\
## makeCacheMatrix above. If the inverse has already been calculated (and the matrix has\
## not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getinverse()
        if(!is.null(inv)){message("Plese wait - in progress")
        	return(inv)}
}
data<-x$get()
inv<-solve(data)
x$setinverse(inv)
inv
}

test<-function(mat)
temp<-makeCacheMatrix(mat)
start.time<-Sys.time()
cacheSolve(temp)
dur<-Sys.time()-start.time
print(dur)

start.time<-Sys.time()
cacheSolve(temp)
dur<-Sys.time()-start.time
print(dur)
}
