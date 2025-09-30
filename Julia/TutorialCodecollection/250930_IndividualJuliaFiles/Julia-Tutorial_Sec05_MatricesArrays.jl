# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




# -------------------------------------------------------------------------------
# 5 MATRICES & ARRAYS
# -------------------------------------------------------------------------------


    # Like vectors, matrices allow us to store many elements (objects) in a single object.
    # Unlike vectors, matrices order these elements along two dimensions (rather than just one).
    # Arrays generalize matrices by storing elements along 3 or more dimensions.
    # Lots of the discussion about vectors applies analogously to matrices and arrays.

    # Let's install the new packages needed in this section:
    Pkg.add("SparseArrays")



# --- Creation ------------------------------------------------------------------


    # Create a 3 x 2 matrix:

    mA = [1 2; 3 4; 5 6] 


    # 3 x 2 matrix of zeros or ones or any other number:
    zeros(3,2)
    ones(3,2)
    repeat([2],3,2) # or:
    fill(2, 3,2)

    # Note that some are matrices of integers, some are matrices of floats.


    # 3x2 matrix of trues or falses:
    
    trues(3,2)
    falses(3,2)


    # 3x2 matrix of NaNs:
    NaN*ones(3,2) # or:
    repeat([NaN],3,2) # or: 
    fill(NaN, 3,2)


    # 3x2 matrix of strings:
    ["a" "b" "c"; "d" "e" "f"]
    repeat(["rum"],3,2)

    
    # Create matrix out of several vectors:

    va = [1,2,3]
    vb = [3,3,4]

    mA = [va vb]


    # Create matrix by repeating a single vector or a single matrix:

    va = [1,2,3]
    repeat(va,2,3) # or, more precisely:
    repeat(va,outer=(2,3))
    repeat(va,inner=(2,3))

    mA = [1 2; 3 4]
    repeat(mA,2,3) # or, more precisely:
    repeat(mA,outer=(2,3))
    repeat(mA,inner=(2,3))


    # We can also create/fill-in a matrix by comprehension (see section on for-loops):

    mA = [jj*exp(ii) for ii in 1:5, jj=1:3]

    mA = ones(5,2)
    [mA[ii,2] = exp(ii) for ii in 1:5]
    # (see also discussion of indexing below)


    # Diagonal matrix:
    
    vx = [1, 2, 3]
    using LinearAlgebra
    diagm(vx) 

    # 3x3 Identity matrix:
    Matrix(I,3,3)



    # Analogously as with vectors, matrices can have different types, 
    # inherited by the types of their elements.
    # We can have matrices of integers, floats, logicals, strings, complex and rational numbers, 
    # as well as matrices of functions, and all these types can be mixed in a single matrix,
    # turning the matrix into type "Any":
    mA = [3 true; "string" exp]
    # We can also have matrices of vectors or matrices of matrices.


    # 4x5 matrix of 3-element-vector of ones:
    mva = [ones(3) for ii=1:4, jj=1:5] 

    # 4x5 matrix of 3x2 matrices of ones:
    mma = [ones(3,2) for ii=1:4, jj=1:5] 

    # 4x5 matrix of empty float-vectors:
    mva = [Vector{Float64}(undef,1) for ii=1:4, jj=1:5] 

    # 4x5 matrix of empty float-matrices:
    mma = [Matrix{Float64}(undef,1,1) for ii=1:4, jj=1:5] 

    # To accommodate underlying vectors/matrices of other types,
    # instead of "Float64", type "Int" or "Complex{Float64}" or "Rational{Int64}" or "Bool" or "String".
    # To accommodate underlying vectors/matrices of mixed type, instead of "Float64", type "Any".


    
    # Sparse Matrices:

    # When working with large matrices with mostly zero elements,
    # your code will likely be more efficient if you declare the matrices as sparse:

    using SparseArrays
    mA = spzeros(20,20) 

    # In my experience, performing operations with sparse matrices is faster than
    # using knowledge on the structure of sparse matrices to break up operations into several chunks
    # (e.g. performing operations for each block of a block-diagonal matrix).



# --- Indexing, Basic Modifications & Element-Identification --------------------


    mA = [1 2; 3 4; 5 6] 


    # Dimensions of a matrix:

    size(mA)[1] # number of rows
    size(mA) # number of columns
    size(mA) # both


    # We can index (access elements of) matrices analogously as with vectors:

    mA[1,2] # element (1,2)
    mA[end,2] # last element in second column
    mA[1:2,2] # first two elements in second column
    mA[:,2] # entire second column
    mA[3,:] # entire third row

    
    # Again, we can use logical vectors for indexing, 
    # and we can apply the function "getindex":

    mA[[true,true,false],2]

    getindex(mA,2,1)



    # Using indexing, we can modify parts of a matrix, 
    # analogously as done for vectors:

    # e.g. to set element (1,2) of mA to 5, we type
    mA[1,2] = 5
    # to set elements (1,2) and (2,2) of mA to [2,3], we type
    mA[1:2,2] = [2,3]
    # to set both elements (1,2) and (2,2) of mA to 5, we type
    mA[1:2,2] .= 5
    # to multiple both elements (1,2) and (2,2) of mA by 3, we type
    mA[1:2,2] .*= 3



    # In principle, we can apply the commands "sort" and "filter" also to matrices.
    # However, they do not preserve the matrix-structure, but return a vector.

    # The findall function does preserve the matrix-structure;
    # it returns the 2-dimensional indices of elements that satisfy the stated condition:

    findall(x-> sqrt(x)>2,mA)


    # We can delete rows and columns of a matrix 
    # by indexing and saving the result to a (new) object
    # (instead of using "filter", which is the preferred way for vectors):

    includeTheseRows = [2,3]
    mB = mA[includeTheseRows,:]



# --- Algebraic and Logical Operations ------------------------------------------


    # All the comments above on performing elementary algebraic or logical operations on vectors
    # also apply for matrices;

    # we can add, subtract or multiply matrices 
    # using the same signs as used for operations with scalars: +, -, *;

    # we can multiply or divide matrices by scalars using the same signs: *, /;

    # to add/subract a scalar to/from a matrix, we must use element-wise addition/subtraction: .+, .-;
    
    # we can perform element-wise multiplication and division using .* and ./,
    # and we can take element-wise powers using .^;

    # we conduct element-wise comparisons using .==, .!==, .>, .>=, .<, .<=,
    # which can be negated and combined.


    # Of course, algebraic operations that mix matrices and vectors work analogously, e.g.:

    mA = [1 2; 3 4; 5 6]
    vb = [1, 2, 3]
    vc = [5, 6]

    vb' * mA - vc'


    # Transpose:
    mA'


    # Kronecker product:
    mB = [1 1; 0 0]
    kron(mA,mB) 


    # Rank:
    using LinearAlgebra
    rank(mA)


    # Operations for square matrices:
    using LinearAlgebra

    mA = [1 2 3; 4 1 6; 7 8 1]

    inv(mA) # inverse

    det(mA) # determinant

    tr(mA) # trace

    eigvals(mA) # eigenvalues
    eigvecs(mA) # eigenvectors (in each column)
    eigen(mA) # both


    # Solving systems of linear equations:

    mA = [1 2 3; 4 1 6; 7 8 1]
    vb = [1 2 2]'
    mA\vb # solution to A*x = b, i.e. gives A^(-1) b



# --- Functions Applied to Matrices ---------------------------------------------


    # Matrices to Vectors & Reverse:

    mA = [1 2 3; 4 1 6; 7 8 1]

    vec(mA) # vectorize by column

    # other direction: turn vector into matrix:
    vx = collect(1:12)
    reshape(vx,4,3) # 4x3 matrix



    # Many functions can be applied to matrix-arguments:

    maximum(mA) # largest element
    minimum(mA) # smallest element

    # function "replace"; e.g. replace NaN-elements in mA by zero:
    mA = [1 2; 3 NaN]
    replace!(mA, NaN => 0) # or:
    mA[isnan.(mA)] .= 0 


    diag(mA) # diagonal of matrix mA

    tril(mA) # lower triangular matrix
    triu(mA) # upper triangular matrix
    

    using Distributions
    cov(mA) # variance-covariance matrix of columns of mA
    cor(mA) # correlation matrix



    # We saw how a function with scalar-arguments 
    # can be applied to each element of a vector 
    # by appending the function with a dot.
    # Applying functions to each element of a matrix works analogously:

    mA = [1 2; 3 4]
    sqrt.(mA)

    # The functions "map", "reduce", "mapreduce" and "replace" also work analogously
    # (see section on vectors).

    

    # Many functions designed for vector-arguments 
    # can be applied to columns or rows of a matrix
    # simply by specifying the option "dims":

    sum(mA,dims=1) # sum across rows (first dimension) (for each column)
    sum(mA,dims=2) # sum across columns (second dimension) (for each row)
    
    # Similarly:
    cumsum(mA,dims=1)
    maximum(mA,dims=1)
    minimum(mA,dims=1)

    using Distributions
    mean(mA, dims=1) 
    var(mA,dims=1) 
    std(mA,dims=2) 


    # If this option is not available, functions for vector-arguments
    # can be applied to columns/rows of a matrix using "map": e.g.

    map(jj->sum(mA[:,jj]),1:size(mA)[2])



    # Recall the discussion on "passing by reference" 
    # (the differences between " a = b ", " a = copy(b) " and " a = deepcopy(b) ").
    # They apply not only to vectors (and vectors of vectors/matrices), 
    # but also matrices (and matrices of vectors/matrices).



# --- Arrays --------------------------------------------------------------------


    # Vectors store objects along one dimension.
    # Matrices store objects along two dimensions.
    # We can store objects along more than two dimensions with arrays.

    # Their creation is analogous to that of matrices: e.g.

    aD = zeros(3,2,4) # 3 x 2 x 4 array of zeros
    trues(3,2,4) # of trues
    repeat([2],3,2,4) # of twos; equivalently:
    fill(2, 3,2,4)
    repeat(["rum"],3,2,4) # of strings

    # We can also create an array by repeating vector or matrix,
    # we can create/fill-in an array by comprehension,
    # and we can create arrays of vectors/matrices/arrays.


    # Show dimension of array aD:
    size(aD)


    # Arrays are indexed analogously to matrices.

    # Also, functions are applied to arrays analogously as to matrices.
    # Though standard algebraic operations are defined only for
    # scalars, vectors and matrices,
    #  we can apply them to vectors and matrices indexed from arrays.






