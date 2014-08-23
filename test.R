A<-makeCacheMatrix();b<-makeCacheMatrix()
A$set(matrix(c(3,2,-1,2,-2,0.5,-1,4,-1),3,3))
b$set(matrix(c(1,-2,0,-1,-2.5,2,0.5,-3,-0.5),3,3))

A$get();b$get()

## test caching features
cacheSolve(A)
cacheSolve(A)

cacheSolve(b)
cacheSolve(b)

