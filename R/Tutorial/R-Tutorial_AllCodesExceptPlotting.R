# R: Tutorial & Code-Collection
# (all codes in single .R-file)

# Marko Mlikota, https://markomlikota.github.io


# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# 1 INTRODUCTION
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# 2 BASICS & SCALARS
# ------------------------------------------------------------------------------

# Include these two commands at the beginning of your script. 
# The first deletes everything in the workspace/environment, 
# the second deletes everything in the console.

rm(list = ls()) # delete everything in workspace/environment
cat("\014")	# delete everything in console   

# To run a chunk of code, select it and press "cmd+enter" on a Mac 
# or click on the "Run" button on top of the script-window. 

# Comments are chunks of code (or text) that R ignores when running. 
# They start with a hashtag, as above. 
# To comment-out a chunk of code or text, on a Mac, select it and press "cmd+shift+c".

# To request help with a command, type the command with a question mark in front in the console. 
# For example, "?sqrt" shows the help page for the command "sqrt".


# --- Object Creation & Removal: Scalar Numbers (type "numeric") ---------------

# To create an object (a variable) called "a" that is equal to three, 
# use one of the following three commands:

a = 3
a <- 3 
assign("a",3)


# In the workspace window, you can see that a variable was created. 
# To display it in the console, type 

show(a) #or:
print(a)


# To delete it, type

rm(a) # rm stands for remove


# --- Basic Operations with (Numeric) Scalars ----------------------------------

# You can perform basic arithmetic operations with numbers as well as defined objects/variables:

3 + 8
7^2

a = 3
b = 8
a + b # displays the result in console
c = a + b # saves the result to a new variable, "c"


# Many standardly used functions are already implemented by default in R. For example:

sqrt(a) # square-root

log(a) # natural log (ln)
exp(a) # exponential


# trigonometric functions:
cos(a) 
sin(a)
tan(a)


ceiling(3.4) # returns 4, the smallest integer larger than 3.4
floor(3.4) # returns 3, the largest integer smaller than 3.4
b %% a #computes the modulus; remainder of b/a


# One can easily combine functions:

sqrt(ceiling(8.9))

log(exp(a))


# To round a number to a desired number of digits:

round(342.347,digits=2)


# --- Special Values for Scalars -----------------------------------------------

# A variable can also take on the value "Inf" or "-Inf" (positive or negative infinity). 
# Any further operation with this variable gives again "Inf" or "-Inf". 
# For example,

a = Inf

sqrt(a) # gives Inf

-Inf + 4 # gives -Inf


# A variable can also take on the value "NA" or "NaN" (not-a-number). 
# (This happens, for example, if one loads an excel file with an empty cell into R, 
# as the value in such a cell needs to be distinguished from, say, zero.) 
# Again, any operation with an NA returns NA:

a = NA

sqrt(a) # gives NA

NA + 4 # gives NA

# (The same results are obtained when a is "NaN" instead of "NA".)



# --- Object Types -------------------------------------------------------------

# Objects you create are stored by R as different "types". 
# Numbers like the ones created above are of type "double" and "numeric":

a = 3
b = 8

typeof(a) # tells you the type of variable/object "a"
is.double(a) # verifies whether a is of type double
is.numeric(a) # verifies whether a is a numeric


# The difference between a double and a numeric is typically irrelevant. 
# (You can think of "numeric" being a larger category that encompasses both "double" and "integer" objects.)

# to verify whether a is Inf or -Inf:
is.infinite(a) 
# to verify whether a is NA:
is.na(a) 
# to verify whether a is NaN:
is.nan(a)


# Throughout this tutorial, we'll discuss the types of different objects we create.
# It is important to be aware that there are different types that R uses to store objects 
# because sometimes a command only works for a specific type (or gives different results for different types), 
# in which case one needs to convert the object to the right type.


# --- Logicals -----------------------------------------------------------------

# A logical is an object-type that can take on the values "TRUE", "FALSE" or "NA". 
# It indicates whether some condition is true or false (or cannot even be evaluated).

# Logicals are (usually) created using logical operators:


isAlargerB = a > b
show(isAlargerB)


# Other logical operators: 

a < b
a >= b
a <= b
a == b # equal to
a != b # not equal to


# Comparisons with Inf and NA: 

a < Inf # comparisons with Inf work
a < NA # but comparisons with NA yield NA 


# Logicals can be used in standard computations, whereby "TRUE" indicates a 1 and "FALSE" indicates a 0:

TRUE + 3 # gives 4
TRUE == 1 # gives TRUE


# Nevertheless, the "double"-object 1 and the "logical"-object TRUE are not the same thing 
# because their type differs, i.e. R stores them differently:

a = TRUE
b = 1

typeof(a)
typeof(b)


# To check whether some object is a logical or a double, type:

isAlargerC <- 1

typeof(isAlargerB)
typeof(isAlargerC)

is.logical(isAlargerB)
is.logical(isAlargerC)

is.double(isAlargerC)


# To convert numbers of type double to logicals or vice versa:

as.logical(1) # convert number/double 1 into logical TRUE
as.double(TRUE) # opposite: convert logical TRUE into number/double 1
as.numeric(TRUE) # same


# Based on existing logicals (i.e. variables indicating whether a condition is true or false), 
# further logicals can be created that combine these underlying conditions using special operators. 
# For example:

isXtrue = TRUE
isYtrue = FALSE

# negation of a logical: turns TRUE into FALSE (and FALSE into TRUE)
isXnottrue = !isXtrue 

#gives true only if both are true:
areBothTrue = isXtrue & isYtrue 
# gives TRUE if only one of them is true and also if both are true:
isOneTrue = isXtrue | isYtrue 
# gives TRUE only if onle one of them is true (it gives FALSE if both are true)
isExactlyOneTrue = xor(isXtrue,isYtrue) 


# (Note that these commands work even if you defined isXtrue and isYtrue as the double-types 1 and 0, respectively. 
# Therefore, in this particular case, the object type is irrelevant.)

# Further below, we will discuss vectors of logicals 
# (i.e. vectors whose elements are logicals rather than numbers (of type double)). 

# Moreover, logicals will be important when we talk about indexing different objects 
# in which data is stored (a vector, matrix, array, list or dataframe). 


# --- Strings ------------------------------------------------------------------

# A string is an object that contains text. It is stored as type "character" in R. 

a = "banana"
typeof(a) # returns "character"
is.character(a)


# There are many commands that are specific to strings:

nchar(a) # number of characters in string

substr(a, 1, 3) # returns first three characters in string


# String Conversion:

as.character(3) # convert the number 3 to the string "3"

as.double("3") # opposite: convert the string "3" to the number (double) 3
as.numeric("3") # same

format(3,nsmall=2)# convert the number 3 to the string "3.00"


# The function "paste()" creates a string by combining a number (double) and a string, e.g.:

paste(1,"mouse",sep=".") #returns "1.mouse"
paste(1,"mouse") # if option "sep" is not specified, a space is put as separator


# String modification:

gsub("i", "X", "Mississippi") #replace i with X



# Strings allow for advanced printing commands, beyond "print()":

print(a)

print(paste(a, "ice cream"))

# prints the specified string, inserting the number at "%s":
sprintf("C(X) = [0,%s]",3.45) 

sprintf("%.0f", 1e8) # to avoid scientific notation

cat("hello\nworld\n") # prints the string, adding line-breaks at \n


# Further below, we will discuss vectors of strings 
# (i.e. vectors whose elements are strings rather than numbers (of type double) or logicals). 
# Moreover, strings will be important when we talk about indexing different objects in which data is stored 
# (a vector, matrix, array, list or dataframe). 
# They will also be important when we talk about representing dates.


# --- Packages -----------------------------------------------------------------

# R is an open-source language, which means that there are many developers 
# who write their own packages that define specific commands (functions) not included in R by default. 
# To highlight which commands belong to which packages, 
# we will load the packages only once these commands are needed. 
# However, in actual applications, it is best practice to have an initial section where you load all packages. 
# To load a package, it first needs to be installed. 
# You can install a package by using the "Packages" panel in bottom-right window, 
# or by typing e.g.

install.packages('ggplot2') # to install package "ggplot2"


# A package needs to be installed only once on a given computer 
# (though you may want to re-install packages when a new version is available). 
# In contrast, you have to load the package every time a script is ran anew. 
# To load the package, type


library(ggplot2) # to load package "ggplot2"




# ------------------------------------------------------------------------------
# 3 FUNCTIONS
# ------------------------------------------------------------------------------

# Up to now, we used functions that are pre-programmed in R or contained in a package we load. 
# The user can of course also define own functions. For example:

fMultiplyXY = function(x,y){
	x*y
}

fMultiplyXY(3,4)


# When a function uses many arguments, it can be hard to remember the argument order. 
# In that case, it is useful to specify the argument names when calling the function, 
# because then the order becomes irrelevant:

# Both give same result:
fMultiplyXY(x=3,y=4) 
fMultiplyXY(y=4,x=3) 


# One can also specify some arguments to be optional. For example:

# Here, the third argument ("z") is optional. By default, the function takes z=2.
fMultiplyXYZ = function(x, y, z=2) { 
	x * y * z
}

fMultiplyXYZ(2, 3) # uses z=2
fMultiplyXYZ(2, 3, 2) # also uses z=2
fMultiplyXYZ(2, 3, 4) # uses z=4


# ------------------------------------------------------------------------------
# 4 VECTORS
# ------------------------------------------------------------------------------

# Vectors allow us to store many scalar-elements in a single object. 
# Thereby, it is important that all scalars are of the same type (double, logical or string). 
# Later, we will discuss lists, which do not have this requirement.


# --- Creation -----------------------------------------------------------------

# There are many ways to create a vector in R:

vx = 1:3  # or:
vx = c(1,2,3) 

show(vx)


# By default, these commands create a vertical vector (3x1 in these examples).
# This is not apparent when displaying the vector, 
# but you realize it when performing matrix algebra (see below).

# To transpose the vector vx, type:

t(vx) 


# Note that this vector is of type "double" 
# (and not of type "logical" or "character" (i.e. string)):

# This vector with 
typeof(vx)
is.double(vx)

is.logical(vx)
is.character(vx)


# Nevertheless, it is also a vector (as opposed to a matrix), 
# and it is also of type "numeric" 
# (the difference between a double and a numeric is typically irrelevant):

is.vector(vx)
is.matrix(vx)

is.numeric(vx)


# We can analogously also create vectors of strings or logicals:

vy = c("a", "b") # vector of strings

vz = c(TRUE,FALSE) # vector of logicals

typeof(vy)
typeof(vz)


# both give true:
is.vector(vy)
is.vector(vz)

# both give false:
is.matrix(vy)
is.matrix(vz)

# both give false:
is.numeric(vy)
is.numeric(vz)


# to go back and forth between double and logicals, as before:

as.logical(c(1,0))
as.double(c(TRUE,FALSE))
as.numeric(c(TRUE,FALSE))


# to go back and forth between double and strings, as before:

as.character(c(1,3))
as.double(c("1","3"))
as.numeric(c("1","3"))



# Advanced ways to create vectors:


seq(-4, 4, by=.8) # a vector going from -4 to 4 in increments of 0.8

seq(-4, 4, length.out= 5) # a vector going from -4 to 4 with 5 elements


rep(1,5) # (5x1)-vector of ones
rep(TRUE,5) # (5x1)-vector with elements TRUE
rep("a",5) # (5x1)-vector with elements "a"

rep(vx, times=2) # create new vector by taking vector "vx" two times 
# (analogously for vectors of strings or logicals)

rep(vx, each=2) # create new vector by taking each element of "vx" two times 
# (analogously for vectors of strings or logicals)


rev(vx) # reverse order of elements in vx ("flip vx around")
# (analogously for vectors of strings or logicals)


vy = c(3,2,5,1)
c(vx,vy)# create new vector by stacking two vectors
# (analogously for vectors of strings or logicals)


# --- Basic Operations ---------------------------------------------------------


# We can perform standard algebraic operations using vectors:

vx = c(1,4,3)
vy = c(1,5,7)

vx + vy
vx - vy

vy / 3

vx * vy   # element-wise multiplication

vx %*% t(vy) # matrix multiplication


# Careful: these are not the same:

2*1:6
(2*1):6 


# We can also use vectors to conduct comparisons, yielding logicals:

# Element-wise comparison

vx >= 2 # compares each element in vx to 2, returns vector of logicals

vx >= vy # compares each element in vx to corresponding element in vy, returns vector of logicals


# Overall comparison of two vectors 
identical(vx,vy) # returns single logical


# Many of the functions we applied to scalars can also be applied to vectors.
# (This is not surprising once you realize that R treats a number like a 1x1-vector; type "is.vector(3)" to see.)
# When applied to a vector, these functions are applied to each element individually:

sqrt(vx) # compute square root of each element in vx
exp(vx)
log(vx)
cos(vx)


# There are many functions that make sense only for vectors (not numbers):

vx = c(1.2, 3.3, 4.2, 2.7, 5.0)
vy = c(3.4, 5.5, 3.2, 8.9, 0.8)

length(vx) #number of elements

min(vx) #minimum
max(vx) #maximum
range(vx) #(min, max)
sum(vx)  #sum of elements
prod(vx) #product of elements

mean(vx) 
median(vx)
sd(vx) # standard deviation
var(vx) # variance
cov(vx,vy) # covariance of two vectors
cor(vx,vy) # correlation of two vectors
#the following two require the package "timeDate":
library(timeDate)
kurtosis(vx)
skewness(vx)

#computing percentiles: (makes only sense for longer vectors, as it supposes that the entries are draws from some underlying continuous distribution)
quantile(vx)
quantile(vx,probs=0.95) #95th percentile
quantile(vx, seq(0, 1, 0.125)) 


# A vector can contain NA elements. 
# In this case, the above functions return NA. 
# However, one can tell the functions to ignore the NA-entries:

vx = c(1.2, NA, 4.2, 2.7, 5.0)

mean(vx) # returns NA
mean(vx,na.rm=TRUE) # returns mean of remaining elements, ignoring NA-entries


# CAUTION! 
# Some functions in R do not prevent you from performing operations with two vectors of different length, 
# but they recycle the shorter one so that the two match in length:

vx = c(1,3,4,2)
vy = c(1,3,5)


# These all give nonsensical output:

vx + vy
vx == vy

vx == c(1,2)


# However, some (smart) functions do throw an error when applied to vectors of different length, e.g.:
cor(vx,vy)


# --- Indexing -----------------------------------------------------------------

# We can access a subset of a vector. This is referred to as "indexing", 
# and there are different ways to do so.


vx = c(5,1,7)


# "Direct" indexing:

vx[2] # take second element

vx[-2] # take all but second element

vx[c(1, 3)] # take first and third element

vx[-c(1, 3)] # take all but first and third element


# Indexing using logicals:

vx[c(FALSE, TRUE, FALSE)] # take again second element (all but first and third element)

vx[vx >= 2] # take all elements larger or equal to 2


# Indexing using entry names (=strings):

names(vx) = c("a","b","c") # name vector entries

vx["b"] # take again second element (= element "b")

vx[c("a","c")] # take first and third element


# Using indexing, we can change specific entries of a vector, leaving the rest untouched:

vx[2] = 4 # change second element to 4

vx[c(2,3)] = c(3,9) # change second and third elements to 3 and 9, respectively
# i.e. change sub-vector containing second and third element to vector c(3,9)

vx = vx[-1] # delete first element



# --- Sorting & Ordering -------------------------------------------------------


vx = c(2, 1, 3, 2, 5)
vy = c(2, 3, 4, 1, 5)


sort(vx) # sorts in increasing order

sort(vx,decreasing=TRUE) #sorts in decreasing order


order(vx) # like sort(), but returns indices of sorted vector 

order(vx, decreasing=TRUE) 

# note: with strings, sort and order work alphabetically



# --- Element Identification ---------------------------------------------------


# Identify elements that match certain condition in a single vector:

which( vx == 2) # returns the indices of all entries equal to 2

max(which(vx == 2 )) # finds largest index (last element) that matches condition

which.max(vx) # returns index of maximum (largest entry)

which.min(vx) # returns index of minimum (smallest entry)


# Identify elements from one vector in another vector:

# Are elements from vy in vx? 
# returns vector of logicals of the length of vy
vy %in% vx 


# Finds location of elements from vy in vx: 
match(vy, vx) 
# (returns NA if an element does not exist in vx)



# --- Set Operations -----------------------------------------------------------


# We can also perform set operations with vectors, 
# as they denote essentially a set of elements (numbers, logicals or strings):


vz = c(2, 8, 4, 7, 5)

union(vx,vy)

intersect(vx,vy) # intersection of two sets (vectors)

Reduce(intersect, list(vx,vy,vz)) #intersection of three sets (vectors)

setdiff(vx,vy) # "vx complement vy"; all elements in vx that are not in vy
# here the order matters!



# --- Operations for/with String-Vectors ---------------------------------------



# String creation and modification:

# Previously, we introduced the function "paste()".
# It creates a string by combining a number (double) and a string, e.g.:
paste(1,"mouse",sep=".")
paste(1,"mouse")


# paste() also works on vectors, returning vector of strings:

paste(1:3,"mouse",sep=".") # returns "1.2.3"

paste(1:3,collapse=".") # returns "1.2.3"
paste(1:3,collapse="_") # returns "1_2_3"
paste(1:3,collapse="+") # returns "1+2+3"


# When we split strings, we obtain a vector of strings.
# e.g. split a string at points where "i" is located:
strsplit("Mississippi","i") 


# Identification of elements in strings:

vsCountries = c("Zimbabwe","Cameroon","Kenya","Rwanda","Djibouti")
# return logical-vector saying which string-entries contain "w":
grepl( "w" , vsCountries ) 
# this can be used for indexing:
vsCountries[ grepl( "w" , vsCountries ) ] 


# Working with dates:

library(lubridate)

sDate <- "2020-04-01"

year(sDate) # show year corresponding to the date in sDate
month(sDate) # show month
day(sDate) # show daay
ymd("2012-03-26") # show year, month and day


# Note that the date needs to be in format "YYYY-MM-DD".
# e.g. this gives error:
year("01-04-2020")

# To convert another format to this format, use
sNewDate <- as.Date("01.04.2020", "%d.%m.%Y") 
# or:
sNewDate <- as.Date("01-04-2020", format="%d-%m-%Y") 
# or:
sNewDate <- as.POSIXlt("01-04-2020", format="%d-%m-%Y")

year(sNewDate)


# Identify weeks from a vector of dates; 
# for each date in vDates, find the preceding Monday:
vDates = paste("2020-04-",10:30,sep="")
cut(as.Date(vDates),"week") 


# Get month-abbreviations from January to April:
month.abb[1:4] 


# Some more useful things for working with dates will be discussed later 
# when talking about time series methods and about plotting.









# ------------------------------------------------------------------------------
# 5 MATRICES & ARRAYS
# ------------------------------------------------------------------------------

# Like vectors, matrices store a collection of scalar-elements of the same type 
# (double, logicals or strings). 
# Unlike vectors, they do so along two (rather than one) dimension. 

# --- Creation -----------------------------------------------------------------

mA = matrix(NA,ncol=3,nrow=2) # matrix of NAs (to be filled-in)

#create a matrix by filling-in elements of a vector:
vx = c(4.3,5,6,3,4.5,9.2)
# by column:
mA <- matrix(vx,ncol=3,nrow=2) 
# by row:
mA <- matrix(vx,ncol=3,nrow=2,byrow=TRUE)


# As you can verify, mA is of type "double" (and "numeric") as opposed to "logical" or "character" (string):


typeof(mA)
is.double(mA)
is.numeric(mA)


# It is also a matrix rather than a vector:

is.matrix(mA)
is.vector(mA)



# We can use the following command to vectorize the matrix mA 
# (i.e. turn it into a vector by stacking its columns on top of each other) 
# or to ensure that a $n \times 1$ matrix is treated as a vector by R:


as.vector(mA)

mB <- matrix(1:4,ncol=3,nrow=4)
is.vector(mB)
mB_ <- as.vector(mB)
is.vector(mB_)

# Further ways to create a matrix:


diag(3) # 3x3 identity matrix

diag(c(3,2)) # 2x2 diagonal matrix with 3 and 2 on diagonal
# But: Note: when applied to an existing, symmetric matrix, diag() returns its diagonal:
mA = matrix(1:9,ncol=3,nrow=3)
diag(mA)


# Create a matrix by putting the same vector in each column:
vx = c(1,5,3,6)
mA = replicate(5, vx)


# Create a matrix as the Cartesian product of two vectors:
vx = seq(0, 0.1, 0.02)
vy = seq(0.1, 0.3, 0.1)
mB = expand.grid("column1" = vx, "column2" = vy)

# To display the matrix, you can use the commands "show" and "print", as before. 
# Also, in contrast to scalars and vectors, you can click on the matrix in the environment window, 
# which opens up a separate panel in the script-window to show you the matrix.


# We can, in principle also create a matrix of logicals or strings:

matrix(c(TRUE,FALSE,FALSE,FALSE,TRUE,FALSE),ncol=3,nrow=2)
matrix(c("a","b","c","d","e","f"),ncol=3,nrow=4)

replicate(3,c(TRUE,FALSE))
replicate(3,c("a","b"))

# This is rarely done in practice. 
# However, matrices of logicals or strings can arise when applying a function to a matrix (of numbers). 
# For example, matrices of logicals arise when comparing elements of a matrix to some number.



# --- Indexing -----------------------------------------------------------------


mA = matrix(1:9,ncol=3,nrow=3)

dim(mA) #display number of rows and columns of matrix mA
nrow(mA)
ncol(mA)

colnames(mA) = c("a","b","c") #label columns of matrix
rownames(mA) = c("r1","r2","r3")


# Again, three ways of indexing possible:

# 1. "Direct"

mA[1, 2] # access element (1,2)

mA[1,] # access first row, returns vector

mA[,1] # access first column, returns vector

mA[c(1, 2), c(1, 3)] # access specified rows and columns

# 2. Using logicals:

mA[c(TRUE,FALSE,FALSE),c(FALSE,TRUE,FALSE)]

mA[c(TRUE,FALSE,FALSE),]

# 3. Using row/column names:

mA["r1","b"]
mA["r1",] 

# And, with two dimensions available, we can mix these indexing approaches:

mA[1,"b"] 

mA[c(TRUE,FALSE,FALSE),"b"] 

# ...




# --- Basic Operations ---------------------------------------------------------


mA = matrix(c(1,3,8,8),ncol=2,nrow=2)
mB = matrix(c(1,2,7,1),ncol=2,nrow=2)


mA * mB   # element-wise multiplication

mA %*% mB # matrix multiplication

t(mA) # transpose

solve(mA) # inverse
solve(mA,tol = 1e-23) # if almost singular
# often, need to convert : as.numeric()


library(Matrix)

rankMatrix(mA) # compute rank

eigen(mA) # compute eigenvalues and eigenvectors;
eigen(mA)$values
eigen(mA)$vectors


# Many of the functions applied above to numbers and vectors can also be applied to matrices: e.g.

sqrt(mA) # compute square-root for each element of matrix

min(mA) # compute minimum out of all elements of matrix

mean(mA) # mean of all elements in matrix

mA >= 2 # element-wise comparison, returns matrix of logicals


# Some functions only make sense when their single input is a matrix (not a vector or a scalar):


cov(mA) # covariance between columns
cor(mA) # correlation between columns


# A particularly useful function for matrices is "apply". 
# It allows us e.g. to apply a function designed for a vector to each column 
# or row of a matrix separately:

mA = matrix(c(1,3,2,8),ncol=2,nrow=2)

#for each column (=2nd dimension) of mA, compute the mean of elements:
apply(mA, 2, mean) 
# (i.e. apply to object mA, on dimension 2 (i.e. by columns), the function "mean"

# One can also supply a self-written function to "apply":
fDemean = function(vx){
	vx - mean(vx)
}
apply(mA,2,fDemean)
# or, in short:
apply(mA, 2, function(vx){vx - mean(vx)})


# This is useful even for functions applied to each element of a matrix:
apply(mA,c(1,2),function(x){min(2,x)}) # since min(mA,x) doesn't give the hoped for result



# --- Arrays -------------------------------------------------------------------


# Arrays generalize matrices, as they store a collection of scalar-elements 
# of the same type (double, logicals or strings) along a general number of dimensions (more than 2).
# They are useful for efficiently storing data that differ along several dimensions 
# (e.g. countries, years, variables, ...) and accessing subsets of it.

# Create three-dimensional array of NAs:
aY = array(dim = c(2, 3, 2))

# Create three-dimensional array by using a vector to "fill it up":
aX = c(1:12)
dim(aX) = c(2, 3, 2)
print(aX)


# Indexing of arrays:

aX[1,3,2]
aX[,c(2:3),1]

aX[1,c(2:3),] # returns matrix (2 x 2)
aX[1,c(2:3),,drop=FALSE] # returns array (1 x 2 x 2)

# Can index similarly by using logical-vectors for each dimension, 
# or by using the names of the elements in the different dimensions:


# Name dimensions of array:

dimnames(aX)[[1]] = c("r1", "r2")
dimnames(aX)[[2]] = c("a", "b", "c")
dimnames(aX)[[3]] = c("A", "B")


# Functions that operate on scalars can be used on arrays as well:

# Functions:

sqrt(aX) # compute square-root of each element

# There are (to my knowledge) no built-in functions that require a single array as an argument.


# We can use the function "apply" to apply a function along different dimensions of an array:

# for each row and column, compute sum along third dimension:
apply(aX,c(1,2),sum) 

# for each row, compute minimum of resulting matrix:
apply(aX,1,min) 



# ------------------------------------------------------------------------------
# 6 CONDITIONALS & LOOPS
# ------------------------------------------------------------------------------


# A conditional is a piece of code that only gets evaluated if a certain condition is true:

a = 5

if (a < 2) {
	print("a is smaller than 2") 
}

if (a < 2) {
	print("a is smaller than 2") 
} else if (a > 2) {
	print("a is larger than 2") 
}


if (a == 2) {
	print("a equals 2") 
} else if (a == 3) {
	print("a does not equal 2 but 3")
} else {
	print("a neither equals 2 nor 3")
}


# A for loop is a chunk of code that gets executed many times, 
# each time for a different value of a so-called "index-variable", named "ii" in the following. 
# It is useful if you need to repeat a procedure for, say, different countries in your data sample.

a = 0
for (ii in 1:10){
	a = a + ii
}
print(a)


for (ii in c("a", "b")){
	print(ii)
}

# Note that 1:10 and " c("a","b") " are both vectors. 
# We can also use the othe ways to create vectors from above, e.g.:
for (ii in seq(-3,3,by=1.5)){
	print(ii)
}



# A while loop keeps executing a chunk of code only as long as some condition is true:

while(a < 130){
	a = a + 3
}
print(a)



# Useful commands for working with for- and while-loops are "next" and "break()". 
# The former tells R to stop executing the code for the current iteration and proceed to the next one, 
# while the latter tells R to stop the for- or while-loop altogether. 


a = 0
for (ii in 1:10){
	if( ii%%2 == 0){ 
		#if ii is even (modulus of ii/2 is null), go to next iteration (i.e. skip this one)
		next
	}
	a = a + ii
}
print(a)


while(a < 130){
	a = a + 3
	
	if(a == 88 | a == 89){
		break()
	}
	
}
print(a)


# ------------------------------------------------------------------------------
# 7 LISTS & DATAFRAMES
# ------------------------------------------------------------------------------


# ---  Lists -------------------------------------------------------------------


# A list is like a vector whose elements can be of different types. For example:

# Create list:
list(1,2,3,"a") 

# In contrast, this creates a vector of characters; 
# i.e. each number is converted to a character
c(1, 2, 3, "a")


lMyList = list(1, "a", c(1:3)) 

typeof(lMyList)
is.list(lMyList)


# Lists are useful for saving a collection of objects, like matrices or plots, into one object, 
# rather than creating many separate ones. 
# They are also useful for keeping the workspace tidy in longer codes. 
# Both of these things are discussed below under "Workspace Management".


# Indexing:

# Again, as before with vectors, there are three ways to index this list:

# "Directly"
lMyList[3] # take third element

# Using logicals:
lMyList[c(FALSE,FALSE,TRUE)]

# Using named elements:
names(lMyList) = c("first","second","third")  # name the elements in list

lMyList["third"]


names(lMyList) # return the names


# Modify list:

# change first element:
lMyList[1] = 2

# add (append) element to list:
append(lMyList,"7") 


# ---  Dataframes --------------------------------------------------------------


# Another important object in R is a dataframe. 
# Just like a list is akin to a vector that can contain elements of different types, 
# a dataframe is akin to a matrix that can contain columns of different types. 
# This makes dataframes suitable to store datasets:

dfA = data.frame(a = c(10,20,30), b = c("RA", "RB", "RC"))

print(dfA)


# note that dataframes are lists:
typeof(dfA) 

# but not every list is a data frame:
is.data.frame(dfA) 
is.data.frame(lMyList)



# Access column-/row-names:

colnames(dfA)
rownames(dfA) 


# Modify row names:

rownames(dfA) = c("first","second","third")


# How many rows & columns do we have?

dim(dfA)

nrow(dfA)
dim(dfA)[1] # same

ncol(dfA)
dim(dfA)[2] #same


# Indexing dataframes is akin to indexing matrices:

# access second column,
#i.e. column "b":

dfA[,2] 

dfA[,"b"] # same

dfA$b # same
# note, if column had a number as its name, would need to write e.g. dfA$`2023`;
# that's why it's a good idea to stick to strings as row and column names (use e.g. "y2023")

dfA[,c(FALSE,TRUE)] # same


# access element (3,2), 
# i.e. third element in column "b", 
# i.e. element in row "third" and column "b":

dfA[3,2]

dfA["third","b"] # same

dfA[3,"b"] # same

dfA$b[3] # same

dfA[3,c(FALSE,TRUE)] #same

dfA[c(FALSE,FALSE,TRUE),c(FALSE,TRUE)] # same

# (and many more possibilities!)


# Modification:

# Adding/deleting rows:

dfA[4,] = c(9,"RA") # add row
rownames(dfA)[nrow(dfA)] = "fourth" # name the newly added row

dfA = rbind(dfA,c(5,"RC")) # same; add another row


dfA = dfA[-5,] # delete row 5
dfA = dfA[-4,] # delete row 4


# Adding/deleting columns:

dfA[,"c"] = c(8,9,4) # add a column "c"

dfA$d = c(1,0,1) # add a column "d"

dfA = data.frame(dfA,e=c(3,3,4)) # add a column "e"

dfA   = cbind(dfA,c(3,3,4)) # add another column (yet unnamed) ...
colnames(dfA)[ncol(dfA)] = "f" # ... and name it "f"



# delete column "d" by keeping all others:
dfA[,c("a","b","c")] 
subset( dfA, select = c(a,b,c) ) # same
dfA[,colnames(dfA) %in% c("a","b","c")] # same

# delete column "d" explicitly:
subset( dfA, select = -c(d) ) 
dfA[,!colnames(dfA) %in% c("d")] 
#(note that writing " dfA[,-c("c","d")] " gives an error)


# To introduce further commands to deal with dataframes, 
# we load a dataset (dataframe) that is pre-stored in R. It contains various measures for 32 different cars.

# Load dataset:

data(mtcars)


# Describe data (i.e. each column/variable):

summary(mtcars) 

# alternative:
library(psych) 
describe(mtcars) 


# Store column-/row-names as vectors:

vsVariables = colnames(mtcars)
vsCars = rownames(mtcars) 


mean(mtcars$hp) # compute mean horse power

min(mtcars$hp) # compute minimum horse power


# How many cars have an hp higher than average?

# step 1: create vector of logicals, indicating for each car whether its hp is above average
# step 2: sum up its elements (number of ones/TRUEs)
vIsHPhigh = mtcars$hp > mean(mtcars$hp) 
sum( vIsHPhigh )

# alternative: create a sub-dataframe containing only the cars with above-average hp, and count its rows:
nrow( mtcars[ vIsHPhigh, ] )


# Find cars with hp above 190 and 5 gears:

mtcars[mtcars$hp > 190 & mtcars$gear == 5, ]
# if interested only in their number of cylinders and horse power:
mtcars[mtcars$hp > 190 & mtcars$gear == 5, c("cyl","hp")]


# Find cars with 4 or 6 cylinders and hp above 120:

vRightCyl = mtcars$cyl %in% c(4,6)
vRightHP = mtcars$hp > 120
mtcars[vRightCyl & vRightHP,]


# Find all Mercedes (their names start with "Merc"):

mtcars[ grepl( "Merc" , vsCars ) , ]


# Sort dataset first according to number of cylinders, then according to horsepower:

mtcars[order(mtcars$cyl,mtcars$hp),]


# Create dummies for each value of "cyl" and "gear", and add to dataframe:

library(fastDummies)
data = dummy_cols(mtcars,select_columns=c("cyl","gear"))


# Let's see how to merge different datasets, transform them into different formats 
# and apply a function to different observations at once (different units, years, etc.). 
# For this, consider the following example involving (made up) grades for famous basketball players:

dfExamMidterm2022 <- data.frame(familyName = c("Jokic", "Doncic", "Jovic", "Bogdanovic", "Bogdanovic"), 
				firstName= c("Nikola", "Luka", "Nikola", "Bogdan","Bojan"),
				year = rep(2022,5),
				grade1 = c(4.5, 3, 4.5, 6, 5))

dfExamFinal2022 <- data.frame(familyName = c("Jokic", "Doncic", "Jovic", "Bogdanovic", "Bogdanovic"), 
			      firstName= c("Nikola", "Luka", "Nikola", "Bogdan","Bojan"), 
			      year = rep(2022,5),
			      grade2 = c(5, 3.5, 5, 5.5, 4.5))

dfExamMidterm2023 <- data.frame(familyName = c("Jokic", "Doncic", "Jovic", "Bogdanovic"), 
				firstName= c("Nikola", "Luka", "Nikola", "Bogdan"), 
				year = rep(2023,4),
				grade1 = c(5.5, 4, 4, 4.5))


# Combine datasets:

# Could combine two datasets with the same observations (rows) but different variables (columns) by "cbind":
cbind(dfExamMidterm2022, grade2 = dfExamFinal2022$grade2)
# but these don't work if one of them has different observations (rows):
cbind(dfExamMidterm2022, grade2 = dfExamFinal2022$grade2, grade3 = dfExamMidterm2023$grade1)


# Can combine datasets also using the command "merge", which requires two datasets (not three):
dfExams2022 = merge(dfExamMidterm2022,dfExamFinal2022)

dfExamsAll = merge(dfExams2022,dfExamMidterm2023, all=TRUE) # all=TRUE ensures that we keep all rows (observations) 
# without this option, we would only keep observations that exist in both dataframes:
merge(dfExams2022,dfExamMidterm2023) # (in this case, there are no such observations)

dfExamsMidterms = merge(dfExamMidterm2022,dfExamMidterm2023, all=TRUE)


# Reshape dataset from/to long/short format:

library(reshape2) # contains commands melt and dcast

# dfExams2022 is in so-called "short format".

# put dfExams2022 into long format:
dfExams2022_long = melt(dfExams2022, id.vars=c("familyName", "firstName", "year"), measure.vars=c("grade1", "grade2")) 
# note that any variable not specified as id-variable or measure-variable gets dropped:
melt(dfExams2022, id.vars=c("familyName", "firstName"), measure.vars=c("grade1", "grade2")) 
# this can create trouble if the specified id-variables do not perfectly define an observation:
melt(dfExams2022, id.vars=c("familyName"), measure.vars=c("grade1", "grade2")) 


# put dfExams2022_long back into short format:
dfExams2022_short = dcast(dfExams2022_long, firstName + familyName + year ~ variable) 


# dfExamsMidterms is in "long format".

# put it into short format:
dfExamsMidterms_short = dcast(dfExamsMidterms, firstName + familyName ~ year)
# note that the name of the variable "grade1" got lost, but we typically know what variable we are looking at

# put it back into long format:
dfExamsMidterms_long = melt(dfExamsMidterms_short, id.vars=c("familyName", "firstName"), measure.vars=c("2022", "2023")) 
# compared to the original dfExamsMidterms, this dataframe has an entry for the player who didn't take the exam in 2023: Bojan Bogdanovic.
# it also has different column names, but we can supply the original ones again:
colnames(dfExamsMidterms_long)[3:4] = c("year","grade1")


# dfExamsAll is in "short format" regarding the grades, but in "long format" regarding the years.

# put it into short format with years across columns, for midterm grades:
dfExamsMidterms = dcast(dfExamsAll, firstName + familyName ~ year, value.var = "grade1")
# for final grades:
dfExamsFinals = dcast(dfExamsAll, firstName + familyName ~ year, value.var = "grade2")
# (can do that only using one variable at once)


# put it into long format with grade-types across rows:
dfExamsAll_long = melt(dfExamsAll, id.vars=c("familyName", "firstName", "year"), measure.vars=c("grade1", "grade2")) 

# put the resulting dataset into short format with years across columns:
dfExamsAll_v2 = dcast(dfExamsAll_long, firstName + familyName + variable ~ year)

# comparing dfExamsAll_v2 with dfExamsAll, we transformed a dataset with years across rows and grade-types across columns
# into one with years across columns and grade-types across rows


# Do something for given subset of observations:

dfExams2022_long

# for each "familyName" and "firstName" by rows, and for each value for "year" by columns, show mean of remaining variables:
# (i.e. show mean of grades in each year by player)
acast(dfExamsAll_long, familyName + firstName ~ year, mean)

# same, but this time ignore the NA entries when computing the mean:
# (i.e. for 2023, return the midterm grade, as the final grade is not available yet)
acast(dfExamsAll_long, familyName + firstName ~ year, function(x){mean(x,na.rm=TRUE)})

# compute number of observations per player and year:
acast(dfExamsAll_long, familyName + firstName ~ year, length)

# compute number of non-missings per player and year:
acast(dfExamsAll_long, familyName + firstName ~ year, function(x){sum(is.na(x)==FALSE)})



# Alternative:

library(doBy) 
#contains command "summaryBy", 
# which repeats a command for each entry of a variable (e.g. for each country, or each year, or both)

# do the same as above:
summaryBy(value ~ familyName + firstName + year, FUN=mean, data=dfExamsAll_long)
summaryBy(value ~ familyName + firstName + year, FUN=function(x){mean(x,na.rm=TRUE)}, data=dfExamsAll_long)

summaryBy(value ~ familyName + firstName + year, FUN=length, data=dfExamsAll_long)
summaryBy(value ~ familyName + firstName + year, FUN=function(x){sum(is.na(x)==FALSE)}, data=dfExamsAll_long)


# Deal with missing values:

# Find observations/rows with missings:

# vector of logicals indicating whether row is complete:
vIsObsComplete = complete.cases(dfExamsAll_v2)
# vector of logicals indicating whether row has missings:
vObsHasMissings = !vIsObsComplete


# Find rows which have missings in a particular column:
vObsHasMissings = is.na(dfExamsAll_v2$`2023`)
# (if your missing is coded as ".", write " dfExamsAll_v2$`2023` == "." ", or first re-code the missings to NA)


# remove rows/observations with missings:
dfExamsAll_v2[vIsObsComplete,]



# Find variables/columns with missings:

# vector of logicals indicating whether column has missings:
vColHasMissings = apply(dfExamsAll_v2, 2, function(x){any(is.na(x))})
# vector of logicals indicating whether column is complete:
vColIsComplete = !vColHasMissings

# remove variables with missings:
dfExamsAll_v2[,vColIsComplete]



# ------------------------------------------------------------------------------
# 8 PATH-/FOLDER-MANAGEMENT
# ------------------------------------------------------------------------------

# A path is the location on your computer (think of a folder) 
# which R uses to look for datasets you call and to store things you tell it to store. 
# Here's how we can define and change the path 
# (note that, in order to run this code, you need to insert paths that work for your own computer):


# Have a look at the folder (path) that R is currently in:

getwd() # "get working directory"


# Change the path: 

setwd("/Users/markomlikota/Documents/MySpecialFolder")

# If you regularly go between different paths/folders, it makes sense to define them first:
sMyPath = "/Users/markomlikota/Documents/MySpecialFolder" 
setwd(sMyPath)


# Change the path to a sub-folder inside "MySpecialFolder":

setwd( paste(sMyPath,"/MySubFolder",sep="") )

# again, it might make sense to store this path:
sMySubPath = paste(sMyPath,"/MySubFolder",sep="")
setwd(sMySubPath)



# Paths are computer-specific. 
# However, if you collaborate with others via Dropbox, 
# you can define the path relative to the Dropbox folder, 
# so that everyone can use the same path definition and hence run the same code:
setwd('~/Dropbox/OurSpecialFolder') 
# (This works provided that everyone has "OurSpecialFolder" in the same location inside their Dropbox.)



# We can also use R to create and delete folders in our path (i.e. on our computer):

# List all folders in the current path:
dir() 

# Create a folder "abc" in the current path:
dir.create("abc") 

# Verify whether folder "abc" exists in current path:
dir.exists("abc")

# Delete folder "abc" in current path: (need computer's permission for that)
unlink("abc")



# ------------------------------------------------------------------------------
# 9 STORING & LOADING DATA
# ------------------------------------------------------------------------------


# The following commands are useful for writing a dataframe to a file:

dfA = data.frame(a = c(10,20,30), b = c("RA", "RB", "RC"))
dfB = data.frame(a = c(10,20,30), b = c("RA", "RB", "RC"))


# Write .csv files:

write.table(dfA, "myfile.csv",sep=",") 

# to preserve special encoding (e.g. cyrillic characters), use this:
library(readr)
write_excel_csv(x = dfA, file = "myfile.csv", col_names = T)



# Write .xslx files:

library(openxlsx)
write.xlsx(dfA,"myfile.xlsx")

# write several sheets: (same package)

wb = createWorkbook("whatever") # need to open a named workbook; name is irrelevant here
addWorksheet(wb, "alpha")
addWorksheet(wb, "beta")

writeData(wb,sheet="alpha",dfA)
writeData(wb,sheet="beta",dfB)

saveWorkbook(wb, "myfile.xlsx", overwrite = TRUE)



# The following commands are useful for reading-in files (datasets) into R:


# Read in .csv file:

# simply:
dfData = read.table("myfile.csv",sep=",")
# with more options:
dfData = read.csv("myfile.csv", header = TRUE, sep = ",", quote = "\"", dec = ",", fill = TRUE, comment.char = "", skip = 1, nrows = 4) 


# Read in .xslx file:

library(readxl)
dfData = read_excel("myfile.xlsx", sheet = "alpha") 


# Read in .dta file:

library(haven)
myData = read_dta('myfile.dta') 
# (this command cannot be ran, as we don't have "myfile.dta" in our path)


# There are many packages to download data directly from some databases/websites.
# e.g. "quantmod" to download data from yahoo or FRED database, or "imfr" package for downloading data from IMF
# (more on them later)


# Download file from some url:
library(RCurl)
download.file("https://api.census.gov/data/1994/cps/basic/jan?tabulate=weight(PWCMPWGT)&col+PEEDUCA&row+PEMLR","./Data/1994jan",'libcurl')


# In my experience, due to type conversion issues, 
# it's much easier to work with csv files than with excel (xlsx) files in R. 
# So you might want to convert any xlsx files you need first manually into csv files. 
# (You can also do basic adjustments (like deleting unnecessary rows) manually in the xlsx/csv file, 
# though this is discouraged, as you would like others to be able to replicate 
# your whole data-manipulation process and therefore verify your work.)

# If you have to load an xlsx file and some of its columns are not recognized as a numeric by R (but as a factor), 
# this can be useful:

indx = sapply(dfData, is.factor)
dfData[indx] = lapply(dfData[indx], function(x) as.numeric(as.character(x)))

# You might also need to convert columns of type "character" to type "numeric":
dfData[,-1] = lapply(dfData[,-1], function(x) as.numeric(x)) 
# (here it's done for all but first column, say because it contains a list of countrynames, which are supposed to be strings)



# ------------------------------------------------------------------------------
# 10 RANDOM VARIABLES
# ------------------------------------------------------------------------------


# Statistical software like R can be used to draw random numbers from some specified distribution. 
# These numbers are not truly random, but appear indistinguishable from actual random numbers. 
# To make the analysis replicable, one must fix the so-called "seed", 
# which ensures that every time the code is run, the same quasi-random numbers are drawn.


# Fix seed:

set.seed(50) # choose some (any) number here



# PRE-DEFINED UNIVARIATE DISTRIBUTIONS 

# Uniform distribution:

runif(3) # generate 3 (independent) draws from U(0,1)
runif(3,0,1) #same
runif(3,-3,8) # generaate 3 (independent) draws from U(-3,8)

dunif(1.3,-3,8) # evaluate pdf of U(-3,8) at x=1.3
punif(1.3,-3,8) # evaluate cdf of U(-3,8) at x=1.3
qunif(0.2,-3,8) # compute 20th percentile (point corresponding to cdf of 0.2)

# see ?runif for documentation for all these commands pertaining to Uniform disttribution

# note that these functions can also be applied to vectors


# Normal distribution:

rnorm(3) # generate 3 (independent) draws from standard Normal
rnorm(3,2,1) # generate 3 (independent) draws from Normal with mean 2 and standard deviation 1

dnorm(1.3,2,1) # return pdf at x=1.3
pnorm(1.3,2,1) # return cdf at x=1.3
qnorm(0.2,2,1) # compute 20th percentile

# hence, to get critical values for two-sided 95% level test:
qnorm(0.025) # 2.5th percentile of N(0,1)
qnorm(0.975) # 97.5th percentile of N(0,1)

# see ?rnorm for documentation for all these commands pertaining to Normal disttribution


# t-distribution:

rt(3, 32) # 3 draws, df=32

# dt, pt, qt exist too; see ?rt


# Chi-squared:

dchisq(3,9) # 3 draws, df=9

# dchisq, pchisq, qchisq exist too; see ?rchisq


# Inverse Gamma:

library(invgamma)
rinvgamma(3,10,2) # 5 draws from IG with shape 10 and rate 2
# can also specify shape and scale; see
?rinvgamma

# dinvgamma, pinvgamma, qinvgamma exist too; see ?rinvgamma



# PRE-DEFINED MULTIVARIATE DISTRIBUTIONS 


# Multivariate Normal:

library(mvtnorm) 
vMeans = c(0,2)
mVariance = matrix(data=c(0.4,0.2,0.2,0.9),nrow=2,ncol=2)
rmvnorm(3,vMeans,mVariance) # 3 draws from multivariate Normal with specified mean and variance

# dmvnorm exists too; see ?rmvnorm



# Inverse Wishart:

library(MCMCpack)
nu = 5
mS = matrix(data=c(0.4,0.2,0.2,0.9),nrow=2,ncol=2)
riwish(v = nu, S =  mS) #single draw

# diwish exists too; see ?riwish



# MULTINOMIAL DISTRIBUTION (MANUALLY DEFINED UNIVARIATE DISTRIBUTION)


# Define a discrete distribution with the following possible realizations (outcomes):
vOutcomes = c(3.4,5.3,3.2)

# Sample 3 times from these elements/outcomes (with replacement):
sample(vOutcomes, 3, replace = TRUE)
# by default, R assumes that all elements have equal probabilities

# alternatively supply vector of probabilities:
vProbabilities = c(0.2,0.2,0.6)
sample(vOutcomes, 3, replace = TRUE, prob= vProbabilities) 



# Fit Kernel-density-estimate on vector "vOutcomes":

density(vOutcomes) # assuming equal probabilities
density(vOutcomes,weights=vProbabilities) # supplying vector of probabilities



# ------------------------------------------------------------------------------
# 11 ECONOMETRICS
# ------------------------------------------------------------------------------


# ---  Linear Regressions ------------------------------------------------------



# Load data for examples:
data(mtcars) 


# Run a linear regression:

# Regress hp on intercept, mpg and gear:
lm(hp ~ mpg + gear, data= mtcars) 

# Alternatively, we can simply use three vectors (not columns in a dataframe):
lm(mtcars$hp ~ mtcars$mpg + mtcars$gear) 

# Doing it manually is also easy (and one can be sure what the code is doing):
mX = mtcars[,c("mpg","gear")]
mX = as.matrix( cbind( rep(1,nrow(mX)), mX ) )
mY = mtcars$hp
vBetaHat = solve(t(mX) %*% mX) %*% ( t(mX) %*% mY)
print(vBetaHat)


# Drop intercept:
lm(hp ~ -1 + mpg + gear, data= mtcars) 

# Include dummy for 8 cylinders:
lm(hp ~  mpg + gear + cyl=="8", data= mtcars) 

# Include dummy for each value of cylinders:
lm(hp ~  mpg + gear + factor(cyl), data= mtcars)

# Add mpg-squared:
lm(hp ~  mpg + I(mpg^2) + gear, data= mtcars)

# add dummy for wt larger than mean:
lm(hp ~ -1 + mpg + gear + (wt>mean(wt)), data= mtcars) 

#add as covariates all polynomials of "mpg" and "gear" up to order 2:
library(stats)
lm(hp ~ poly(as.matrix(mtcars[,c("mpg","gear")]), degree = 2, raw = TRUE),data=mtcars) 


# Analyze the output of a linear regression:

# Re-run first regression from above, but store to object:
reg = lm(hp ~ -1 + mpg + gear, data= mtcars) 

# Extract vector of residuals:
reg$residuals 
# Extract vector of estimated coefficients:
reg$coefficients 
# Extract vector of fitted values:
reg$fitted.values 


# Get all sorts of summary stats:
summary(reg) 
# Store this object:
mySumReg = summary(reg) 
# This allows you to extract even many more statistics.

# Extract R-squared:
mySumReg$r.squared
# Extract Adjusted R-Squared:
mySumReg$adj.r.squared
# Extract matrix with estimated coefficients, SEs, t-vals and p-vals in columns:
mySumReg$coefficients 


# By default, the "lm()" command assumes homoskedasticity. 
# The following commands can be used to adjust standard errors in case of heteroskedasticity:

library(sandwich)

# Compute adjusted variance-covariance matrix of coefficients:
mVarHskRob = vcovHC(reg, type = "HC")
# Get robust SEs of individual coefficients by taking square root of diagonal:
sqrt(diag( vcovHC(reg, type = "HC") )) 
# Note: type = "HC0" has no DF correction whil type = "HC1" has the DF correction. 
# Both are valid asymptotically, but a DF correction is preferable in small samples.

# Print results with robust SEs:
library(lmtest) 
coeftest(reg, vcov. = mVarHskRob) 
# alterantively:
summary(reg, vcov = function(x) vcovHC(x, type="HC"))


# Information criteria:

# Compute Bayesian information criterion:
BIC(reg) 

# Compute Schwartz information criterion (manually):
MSE = mean(reg$residuals^2)
K = length(reg$coefficients) # K = # of regressors
N = length(reg$residuals) # N = # of obs
SIC = (K/N)*log(N)+log(MSE) 


# The t-statistic for a t-test with the null hypothesis indicating a zero value 
# for the parameter is conducted by default.
# Computing (manually) the t-statistic for testing whether a single coefficient 
# equals some other value is trivial once the estimated parameter value and its SE are computed.

# We can also run other tests manually (e.g. F-test, Wald-test, etc.).
# For the F-test, we can also use the following package:
	
# Test whether mpg and gear are jointly insignificant in our baseline regression,
# using adjusted standard errors:
library(car)
linearHypothesis(reg,test="F", c("mpg=0","gear=0"), vcov. = vcovHC(reg, type = "HC"))


# Manual alternative:
# 1. run restricted regression, store R^2 (R2r)
# 2. run unrestricted regression, store R^2 (R2u), number of regressors (k+1), number of restrictions (q),
# and compute:
Fstat = ( (R2u - R2r)/q ) / ( (1 - R2u)/(n - k - 1) )


# Apparently, this package can also be used to run Wald-tests;
?linearHypothesis


# While there are packages for many more econometrics-related computations in R, 
# I strongly advocate for using these standard commands only to run preliminary regressions 
# as part of your initial data analysis, but not for the final output in a paper or otherwise important document. 
# If the output is really important, you should take your time to code the estimates, 
# compute the standard errors, conduct hypothesis tests, etc., yourself. 
# Only then you know exactly how your results have been obtained and what the assumptions behind them are.


# Running regressions in a loop:

# The first argument of "lm" is of the form " Y ~ x1 + x2 ... + xK " and is called a formula. 
# Sometimes we want to specify this formula in a loop, in which case generating it from a string can be useful.
# The following code will regress hp on three different dummies for the number of cylinders, one at a time:

# Create dummies for each value of "cyl" and add to dataframe:
library(fastDummies)
mtcars = dummy_cols(mtcars,select_columns=c("cyl"))

# Regress hp on the number of cylinders (without intercept),
# (i.e. this computes mean horse power by different numbers of cylinders)
for (hh in c(4,6,8)){
	reg = lm(formula( paste("hp ~ -1 + cyl_",hh,sep="") ),data=mtcars)
	print(reg)
}

# Note: we can store all these regressions into a single list!
# See also section on "Workspace Management"


# ---  Other Cross-Sectional Methods -------------------------------------------


# Probit Model:

# Regress dummy on having hp above average on mpg and gear:
reg = glm((hp>mean(mtcars$hp)) ~ mpg + gear, family = binomial(link="probit"), data = mtcars) 
summary(reg)


# IV Regression:

# Run an IV regression with 
# mpg being endogenous regressor
# gear being exogenous regressor
# and cyl and disp being IVs:

library(ivreg)
ivreg(hp ~ mpg + gear  | gear + cyl + disp, data=mtcars) 
# i.e. hp is dependent variable, 
# after "~" come all regressors (endogenous and exogenous), 
# and then after "|" come the exogenous regressors and IVs



# Least-Absolute Deviations (LAD) regression:

library(quantreg)
lad_two = rq(hp ~ mpg + gear, data=mtcars) 
summary(lad_two)



# ---  Panel-Data Methods ------------------------------------------------------


# Load data for examples:
library(AER) 
data(Fatalities)


# Preliminary Things

# Declare dataframe "Fatalities" as panel data:
library(plm)
pdata = pdata.frame(Fatalities, index = c("state", "year"), drop.index = F, row.names = T) 

# Compute ratio of number of fatal accidents to population:
pdata[,"fatalToPop"] = pdata$fatal / pdata$pop 



# Run Regressions
# regress fatal accidents per capita 
# on income, drinking age and latter's interaction with percentage of young drivers:

# Pooled OLS:
plm(fatalToPop ~ income + drinkage + drinkage*youngdrivers, data=pdata, model="pooling")
# Random Effects:
plm(fatalToPop ~ income + drinkage + drinkage*youngdrivers, data=pdata, model="random")
# Fixed Effects - Within:
plm(fatalToPop ~ income + drinkage + drinkage*youngdrivers, data=pdata, model="within", index=c("state","year")) 
# Fixed Effects - First-Difference:
plm(fatalToPop ~ income + drinkage + drinkage*youngdrivers, data=pdata, model="fd", index=c("state","year")) 

# Compute clusterd standard errors for FE-W regression:
regFEW = plm(fatalToPop ~ income + drinkage + drinkage*youngdrivers, data=pdata, model="within", index=c("state","year")) 

vcovHC(regFEW, cluster = "group", type = "sss")
# Note: there are many ways to cluster your standard errors... 
# That's why it's best if you code this yourself.

# Print output with adjusted SEs:
coeftest(regFEW, vcovHC(regFEW, cluster = "group", type = "sss")) 

# Conduct F-test for income, drinkage and drinkage*youngdrivers being jointly insignificant:
linearHypothesis(regFEW,test="F", c("income=0","drinkage=0","drinkage:youngdrivers=0"), vcov. = vcovHC(regFEW, cluster = "group",type="sss"))

# Joint significance test on the individual (not time) fixed effects of a panel regression
regPOLS = plm(fatalToPop ~ income + drinkage + drinkage*youngdrivers, data=pdata, model="pooling")
pFtest(regFEW,regPOLS)



# The following functions are useful when doing PD F.E. regressions manually:

#compute FDs of a variable for each unit:
library(doBy)
fFDColumnByUnit = function(mX,indUnit,indCol){
	mHelp = summaryBy(list(c(colnames(mX)[indCol]), c(colnames(mX)[indUnit])) , FUN=function(x){x[-1]-x[-length(x)]}, data=mX )
	as.vector(t(as.matrix(mHelp[,-1])))
}
# compute time-demeaned values of a variable for each unit:
fDemeanColumnByUnit = function(mX,indUnit,indCol){
	mHelp = summaryBy(list(c(colnames(mX)[indCol]), c(colnames(mX)[indUnit])) , FUN=function(x){x-mean(x)}, data=mX )
	as.vector(t(as.matrix(mHelp[,-1])))
}

# Apply:
# compute FDs of fourth column (the unit (here: state) is specified in first column):
fFDColumnByUnit(pdata,1,4) 
# compute time-demeaned fourth column:
fDemeanColumnByUnit(pdata,1,4) 


# ---  Time-Series Methods -----------------------------------------------------


# Load data for examples:
data("USAccDeaths")
data("UKDriverDeaths")

# The above discussion on linear regressions also applies for time series data.
# However, there are benefits of declaring your time series data as an "xts" object, 
# as this facilitates certain manipulations.


# Create "xts" object:

library(xts)


# First put both time series from matrix to vector format:
vUKdeaths = as.vector(t(UKDriverDeaths))
vUSdeaths = as.vector(t(USAccDeaths))

# Now create xts objects from these numeric vectors:
# first create vector of dates:
vDatesUK = seq(as.Date("1969-01-01"), length=length(vUKdeaths), by="months")
# then create xts-vector of your TS:
vUKdeaths = xts(x=vUKdeaths, order.by=vDatesUK)

# Same for USdeaths:
vDatesUS = seq(as.Date("1973-01-01"), length=length(vUSdeaths), by="months")
vUSdeaths = xts(x=vUSdeaths, order.by=vDatesUS)

# Combine the two datasets by dates:
merge(vUSdeaths,vUKdeaths, all=TRUE)


# Here's how to create an xts-matrix, with multiple variables at once:
library(carData)
data(Hartnagel)
vDates = seq(as.Date("1931-01-01"), length=nrow(Hartnagel), by="years")
mTheft = xts(x=Hartnagel[,c("mtheft","ftheft")], order.by=vDates)


# Let's combine the two monthly time series above, by date:
mDeaths = merge(vUSdeaths,vUKdeaths,all=TRUE)
colnames(mDeaths) = c("US","UK")
mDeaths = mDeaths[is.na(mDeaths$US)==FALSE,] # trim to non-missing dates

# note that this stays an xts object


# Easy manipulations with "xts" objects:

# Turn monthly into quartlery series by keeping only beginning-of-quarter months:
vUKdeathsQ = apply.quarterly(vUKdeaths, last)
# similarly for taking averages

# Compute differences:
diff(vUKdeaths,1) # first differences
diff(vUKdeaths,4) # fourth differences (y_t - y_{t-4})


# Compute lags & leads:
lag(vUKdeaths,1) # first lag
lag(vUKdeaths,2) # second lag

# Use lags in regression: 
# fit AR(2) model on inflation:
reg = lm(vUKdeaths ~ lag(vUKdeaths,1) + lag(vUKdeaths,2)) 

# Note: lag() works only for xts objects! for ts objects it doesn't, but you get no error message!!!

# compute percentage growth (log differences):
vUSdeathsGrowth = diff(log(mDeaths$US))[-1] 
vUKdeathsGrowth = diff(log(mDeaths$UK))[-1]
# (we drop first observations as it is equal to NA; can only start growth rates from second entry)


# Compute ACF and PACF:
acf(vUKdeaths[-1]) 
pacf(vUKdeaths[-1])


# Compute cross-correlations of two series (here up to 3 leads and lags):
ccf(as.numeric(vUSdeathsGrowth),as.numeric(vUKdeathsGrowth),3,plot=FALSE) 



# Working with dates in xts objects:

library(lubridate)

# access vector of dates corresponding to xts-object "vUSdeathsGrowth":
index(vUSdeathsGrowth) 
# see the month for each date:
month(index(vUSdeathsGrowth)) 


# Note:: plot of xts object is different than simply plotting a vector:
plot(vUSdeathsGrowth)
plot(as.numeric(vUSdeathsGrowth))
# (R recognizes by default that the x-axis are dates, that we want a line, etc.)
# But more on plotting in the separate section.


# With the package "quantmod", we can download time series data directly from 
# the FRED Database (and other sources, e.g. Yahoo Finance). 
# It comes in "xts" format:

library(quantmod)

# download monthly US CPI data:
getSymbols("CPIAUCSL", src = "FRED", auto.assign = FALSE) 
# by default, it is stored by creating an xts object of the same name, CPIAUCSL

# download monthly US CPI data and store it as object "cpi":
cpi = getSymbols("CPIAUCSL", src = "FRED", auto.assign = FALSE) 


# download quarterly GDP deflator:
getSymbols('GDPDEF',src='FRED')

# adjust the dates:
GDPDEF = GDPDEF["1960-01-01/2025-01-01"]
# if several series have to be trimmed to same dates,
# it makes sense to define this as a function:
sStartDate = "1960-01-01"
sEndDate = "2025-01-01"
fMyTimeRange = function(x){ x[paste(sStartDate,sEndDate,sep="/")] }

# Compute annualized inflation:
vInfl = 100 * 4 * diff(log(GDPDEF))[-1]


# compute GDP growth for same dates:
getSymbols('GDP',src='FRED')
GDP = fMyTimeRange(GDP)
vGDPg = 100 * 4 * diff(log(GDP))[-1]


# For some things, like fitting ARMA models and forecasting with them, 
# it's easier to work with "ts"-objects rather than "xts"-objects:

# Create ts-object:
vUSdeathsGrowthTS = ts(vUSdeathsGrowth,start = c(19373,2), frequency = 12) 


# ARIMA estimation:

# Estimate AR(1) process
model = arima(vUSdeathsGrowthTS, order = c(1,0,0)) 
# Estimate ARMA(2,1) process
model = arima(vUSdeathsGrowthTS, order = c(2,0,1)) 
# the middle argument stands for integration order (ARIMA process)
summary(model)


# Forecasting:

library(forecast)
# Forecast up to 10 periods ahead and compute two-sided 90% and 95% CIs:
mForecasts = forecast(model,h = 10, level = c(90,95)) 
# Plot these forecasts with fanchart:
plot(mForecasts,PI = TRUE,showgap = FALSE,shaded = TRUE)


# Work with reduced-form VARs:

library(vars)
mData = data.frame(US=vUSdeathsGrowth, UK=vUKdeathsGrowth)

# Estimate a VAR(p):
modelVAR = VAR(mData, p=2) # add type="trend" to allow for trend
summary(modelVAR)

vResids = residuals(modelVAR) 
sumModelVAR = summary(modelVAR)
mSigma = sumModelVAR$covres # variance-covariance matrix of errors
coef(modelVAR) # coefficients (Phi's)

# Forecast with VAR(p):
predict(modelVAR,n.ahead = 5, level = c(90,95))
# Could plot forecasts with below command, but it's better idea to create nice plots yourself!
#fanchart( predict(modelVAR,n.ahead = 5, level = c(90,95)) )


# Simulate ARIMA models:

arima.sim(list("ar"=c(0.7,0.2)), n = 50*4, rand.gen = rnorm) 
# can also supply innovations manually; see ? arima.sim
# but could also code whole ARIMA simulation manually...



# ------------------------------------------------------------------------------
# 12 PLOTTING
# ------------------------------------------------------------------------------

# see separate .R-file


# ------------------------------------------------------------------------------
# 13 WORKSPACE MANAGEMENT
# ------------------------------------------------------------------------------


# If you have a big project, it makes sense to break up your code into several R-scripts. 
# From one script, you can call another using the following command:

source("mySeparateScript.R") # load/run external script


# You can also store all objects (the whole current workspace) to an .RData-file, 
# which you can load in other scripts:


# Save all objects from the current workspace to an ".RData"-file:
save.image(file="myWorkspace.RData") 

# Load the workspace from the file:
load("myWorkspace.RData") 


# To keep the workspace tidy/lean even in a longer code, 
# one can use lists to store a collection of objects in a single object; a list. 
# If in each iteration of a loop a plot is created, we can save all these plots 
# into one list using the following commands:

lMyPlots = list() # create empty list before loop

for (ii in 1:10){
	
	# create plot for iteration ii, something like this comes out:
	# (as a matter of fact, typically, a plot is saved as a list (containing its attributes); see below)
	plotHere = list(1,"a","b")
	
	# save plot to "lMyPlots":
	lMyPlots = append(lMyPlots,list(plotHere))
	
	# and assign a name to this plot:
	nameForThisPlot = paste("plot",ii,sep="_")
	
	if (ii==1){ # at the first iteration, lMyPlots is empty, so use this:
		names(lMyPlots) = c(names(lMyPlots), nameForThisPlot )
	}else{ # later on, we can just use this:
		names(lMyPlots)[ii] = nameForThisPlot
	}
	
}

# The same code can be used to store different regressions into a single list. 
# See the section "Econometrics/Linear Regressions" for how to run regressions in a loop.


# Saving a collection of different objects into a single list 
# also enables us to delete a bunch of objects at once.
# This way, at the end of some longer section of code in our script,
# we can delete all objects that aren't necessary for subsequent computations:

a <- 4
b <- 3

# remove all objects but these two:
rm(list= ls()[!(ls() %in% c('lMyList','lMyPlots'))]) 


# If you want to iteratively (e.g. after each section of your code) delete a bunch of objects, use this code:

a <- 4
b <- 3

# Define a vector containing the names of the objects you want to keep:
vToKeep = c('vToKeep','lMyList','a') 
# Delete all objects but these:
rm(list= ls()[!(ls() %in% vToKeep)]) 

# At a later point, once you created some new objects ...:
b <- 3
c <- 5
# ... add the newly created objects that you want to keep to vToKeep ...:
vToKeep = c(vToKeep,'b')
# ... and delete all the rest:
rm(list= ls()[!(ls() %in% vToKeep)]) 

# (note that vToKeep contains the name of "vToKeep" itself, otherwise this vector would be deleted too)




# ------------------------------------------------------------------------------
# 14 FURTHER
# ------------------------------------------------------------------------------

# ---  Error Handling ----------------------------------------------------------


# Sometimes, it is inevitable that some code returns an error under some conditions, 
# but we still want the code to continue running, i.e. we attempt at doing one thing, 
# but if it doesn't work, we try another thing. 
# For such code-chunks,we can use "tryCatch":

# Try evaluating "fLL()" (log-likelihood of some model) at vTheta, and return -99 if it doesn't work:
tryCatch( fLL(vTheta) , error = function(e){ -99 } ) 


# Try computing log-determinant of mA, and return NA if it doesn't work:
tryCatch( log(det(mA)) , error = function(e){ NA } ) 


# ---  Timing ----------------------------------------------------------

# Sometimes, we want to record the time that R needs to execute a certain chunk of code:

# Record the time at a given point: 
# (typically before the code starts that you want to time)
timeStart = Sys.time()

# ... do operations ...

# Compute the time elapsed since " timeStart" :
timeTotal = Sys.time() - timeStart 


# To record the time needed to execute a single command/function:
# (here we record the time needed to draw 100 times from N(0,1))
system.time( rnorm(100) )


# Let R "sleep" for 4 seconds, i.e. do nothing:
Sys.sleep(4) 


# ---  Linear Interpolation ----------------------------------------------------


# We can use linear interpolation to impute missing values (NAs) in a vector:

library(zoo)

vx = c(2, NA, 3, 2, 5)

na.approx(vx) # imputes NA values in vx by linear interpolation


# We can also use linear interpolation to evaluate a function at some intermediate value for its argument:

vx = c(1,2,3)
vy = c(1,4,9)

# We can interpret this as a function y=f(x), for which we have "observations" (1,1), (2,4), (3,9),
# and find f(2.5) by linear interpolation:
approx(vx, vy, xout=2.5) 



# ---  Optimization ------------------------------------------------------------

# For optimization of a function w.r.t. a scalar argument, it is easiest to use "optimize":

fFunToOpt = function(v){ (v-3)^2 }
myOptimRes = optimize(fFunToOpt,interval=c(-5,5))
myOptimRes$minimum # minimizer ("argmin")
myOptimRes$objective # function value at minimum ("min")


# For optimization of a (scalar-valued) function w.r.t. a vector-valued argument, can use "optim":

fFunToOpt = function(v){ 
	(v[1]-3)^2 + v[2]^3
}

vTheta0 = c(0,0) # initial value
myOptimRes = optim(vTheta0, fFunToOpt, method = "BFGS") 
myOptimRes$par # minimizer ("argmin")
myOptimRes$value # function value at minimum ("min")

# function can support several different methods, see ?optim


# ---  Complex Numbers ---------------------------------------------------------

# Define a complex number:
b = 3 + 2i 

Mod(b) #modulus of b
Re(b) #real part of b

# As you can see, "i" is already defined by default in R.
# That's why it's a good idea to avoid creating a variable "i" yourself, 
# as it would overwrite the variable "i" that exists in R by default. 
# Same for "pi".

# ---  Further Useful Packages -------------------------------------------------

# In the course of this tutorial, we encountered many useful packages. Here are some more.

# Package "imfr": download data directly from IMF databases:

library(imfr) 

# see all datasets:
imf_ids(TRUE)

# Have a look at database "IFS":
a = imf_codelist(database_id='IFS')
# See what indicators are available in it:
a1 = imf_codes(codelist='CL_INDICATOR_IFS')

# Download specified indicators from this database 
# for specified countries, a specified year range, at specified frequency:
m_RGDP_Q_raw = imf_data(database_id='IFS',
			indicator=c('NGDP_R_SA_XDC','ENDA_XDC_USD_RATE'),
			country=c("AT","AU"),
			start='2021',end='2022',freq='Q',print_url=TRUE)


# Package "countrycode": translate between different official countrycodes:

library(countrycode)

vsC_cc2 = c("AT","AU")

# from iso2 to iso3:
countrycode(vsC_cc2,"iso2c","iso3c") 

# from iso2 to country names (in different languages):
countrycode(vsC_cc2,"iso2c","country.name") 
countrycode(vsC_cc2,"iso2c","country.name.de") 
countrycode(vsC_cc2,"iso2c","country.name.fr") 


# ------------------------------------------------------------------------------
# 15 GENERAL CODING ADVICE
# ------------------------------------------------------------------------------
