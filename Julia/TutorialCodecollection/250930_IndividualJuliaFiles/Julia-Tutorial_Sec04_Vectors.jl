# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




# -------------------------------------------------------------------------------
# 4 VECTORS
# -------------------------------------------------------------------------------


    # Vectors allow us to store many elements (objects) in a single object.  
    # We will first discuss vectors that take scalars as elements,
    # i.e. numbers (mostly Floats, but also integers, complex and rational numbers),
    # or logicals or strings.

    # A cool thing about Julia is that vectors can take on elements of any type.
    # Hence, we can have vectors of functions, vectors of vectors, etc.
    # We can also combine elements of different type into a single vector.
    # These cases will be discussed at the bottom of this section and in later sections.

    # Let's install the package "Distributions", which -- along with "LinearAlgebra" -- is needed in this section:
    Pkg.add("Distributions")



# --- Creation ------------------------------------------------------------------


    # Create a vector:
    va = [1, 2, 3] 
    # or:
    va = [1; 2; 3]

    # Vector of zeros or ones or any other number:
    n=4
    zeros(n)
    ones(n)
    repeat([2],n) # or:
    fill(2,n)

    # Note that some are vectors of integers, some are vectors of floats.


    # Vector of NaNs:
    NaN*ones(n) # or:
    repeat([NaN],n) #or:
    fill(NaN,n)


    # Vector of trues or falses:
    trues(n)
    falses(n)


    # Vector of strings:

    vs = ["a","b","c"]
    # or:
    collect('a':'e')
    # from existing string:
    repeat(["rum"],3)
    


    # Vectors containing sequences:

    # A sequence can be specified with colons or by the function "range":
    1:0.5:4 # or, equivalently:
    range(1,4,step=0.5)
    # specify length rather than step of sequence:
    range(1,5, length=20)

    # Note that these sequences do not (yet) constitute vectors.
    # To turn them into actual vectors:
    collect(1:0.5:4)
    collect(range(1,5,length=20))

    # Can also have decreasing sequences, of course:
    collect(100:-10:50)
    collect(range(100,20,length=3))



    # We can also create a vector by comprehension (see section on for-loops):

    va = [exp(ii) for ii in 1:5]



    # Basic characterization of vector:

    va = [1, 2, 3] 
    length(va) # number of elements

    # Note that a vector is a one-dimensional object:
    ndims(va)
    size(va) # size of va along each dimension
    # (This contrasts with matrices, which we will discuss later.)


    # Nevertheless, all of the vectors above do have an orientation; they are column vectors.
    # To transpose them into row vectors:
    va' 
    # Note that this turns the 1-dimensional object (3-element-vector) va 
    # into a two-dimensional object (an 1x3 vector/matrix).

    # To transpose matrix of strings:
    permutedims(vs) 



# --- Algebraic and Logical Operations ------------------------------------------


    # We can add, subract or multiply vectors
    # using the same signs as used for operations with scalars: +, -, *:

    va = [1, 2, 4] 
    vb = [2, 3, 3]

    va + vb
    va - vb
    va' * vb 

    # We can also multiply or divide a vector by a scalar using the same signs: *, /:

    va * 2
    va / 2

    # To add/subract a scalar to/from a vector, 
    # we must use the signs for element-wise addition/subtraction: .+, ._:

    va .+ 2
    va .- 2

    # Similarly, we can perform element-wise multiplication and division using .* and ./:

    va .* vb
    va ./ vb

    # or take element-wise powers using .^:

    va .^ 2


    # There are also element-wise logical operators:

    va = [1,2,7,4]

    va .== 4
    va .!==4
    va .> 4
    va .>= 4
    va .< 4
    va .<= 4


    # These can again be negated or combined:

    .!(va .< 4)

    (va .< 4) .&& (va .> 1) 
    (va .< 4) .|| (va .== 7)



# --- Functions Applied to Vectors ----------------------------------------------


    # Many functions are defined for vectors, i.e. a collection of scalars:

    va = [1, 2, 4] 
    vb = [2, 3, 3]

    sum(va)
    cumsum(va)

    maximum(va) 
    minimum(va)

    reverse(va) # reverses the order of elements in va
    replace(va,2 => 3) # vector va with 2 replaced by 3

    # Return unique elements in vx:
    vx = [4.02, 4.00, 5.80, 4.00, 6.15]
    unique(vx)


    using LinearAlgebra
    norm(va) # Euclidean norm of vector va
    norm(va-vb) # Euclidean norm of distance between va and vb

    using Distributions
    mean(va)
    var(va)
    std(va)
    median(va)
    cor(va,vb)



    # We encountered many functions with scalar-arguments.
    # To apply them to each element of a vector, append them with a dot:

    sqrt.(va)
    log.(va)
    floor.([3.4, 4.8, 5.3])

    # This also works for own functions:
    f1(x) = 2 * x
    f1.(va)

    # Analogously, one can apply functions that take on several scalar-arguments
    # to several vectors:
    lcm.(va,vb)


    # Using "map" is another way to apply a function to each element of a vector:
    map(log,va)

    # With "reduce", we can sum up elements of a vector:
    reduce(+,va) 

    # "mapreduce" combines both functions:
    mapreduce(log,+,va)

    # For more involved functions, these are much faster than typing
    # sum(va), log.(va) or sum(log.(va)).
    # Also, they can be parallelized easily (see separate section below).

    # Another advantage about map is that one can apply functions 
    # without defining them as separate objects:
    map(x-> x^2 + 3, va)
    # This also works with functions with multiple scalar-arguments:
    map((x,y)-> x^2 + y, va, vb)



    # Using "replace" offers a third way to apply a function to elements of a vector.
    va = [1.0, 3.0, 5.0] 
    log.(va)
    map(log,va)
    replace(x -> log(x), va)

    # In contrast to the first two options, using replace requires va to be 
    # a vector of floats rather than a vector of integers, 
    # since the result of log() is a float.
    # However, replace also offers an advantage to the other two methods:
    # We can save the modifications easily to the existing object, va,
    # by appending an exclamation mark to replace:
    va = [1.0, 3.0, 5.0] 
    replace(x -> log(x), va)
    println("va = ",va) # vector va is unchanged
    replace!(x -> log(x), va)
    println("va = ",va) # vector va is changed

    # Such syntax looks neater and can be faster than writing manually
    # e.g. va = replace(x -> log(x), va) in this case.

    # ("map" can also modify its argument, though an advanced syntax is needed, 
    # not just the exclamation mark.)

    # This option to add an exclamation mark to modify the argument
    # also exists for other functions, e.g. "reverse" or "unique" (see above) 
    # or "sort" or "filter" (see below).



    # For functions that take on several arguments,
    # we can supply all arguments as a vector rather than individually 
    # by appending the vector with 3 dots:

    fMyFun(x,y,z) = (2 * x - y)^z
    vArguments = [3,2,3]
    fMyFun(vArguments...)



# --- Indexing & Basic Modifications --------------------------------------------


    # Indexing means accessing certain elements of an object.
    # We can index a vector using square brackets:

    va = collect(range(-5,50,length=100)) 

    va[1] # first element
    va[2] # second element
    va[end] # last element
    va[end-1] # second-last element

    va[1:5] # first 5 elements 
    va[end-4:end] # last 5 elements

    va[1:2:length(va)]; # every second element, starting from first


    # The same can be done using the command "getindex":
    getindex(va,2)
    getindex(va,1:5)


    # We can also index a vector using a vector of logicals
    # rather than a vector of integers:
    vb      = [4,5,2,0]
    vInd    = [true,true,false,true]
    vb[vInd]



    # Using indexing, we can modify parts of a vector.

    # e.g. to set the first element of vb to 5, we type
    vb[1] = 5
    # to set the first two elements of vb to [2,3], we type
    vb[1:2] = [2,3]
    # to set both of the first two elements of vb to 5, we type
    vb[1:2] .= 5
    # to multiple both of the first two elements of vb by 3, we type
    vb[1:2] .*= 3


    # The function "insert" is also useful to modify a vector:

    insert!(vb,2,33)

    # This is neater and more efficient than typing
    vb = [vb[1],33,vb[2:end]...]




# --- Sorting, Filtering & Element-Identification -------------------------------


    # Sorting: 

    va = [4,5,-2,0]

    sort(va) # by default: in ascending order; from smallest to largest

    sortperm(va) # gives indices of sorted vector

    sort(va,rev=true) # sorts in descending order

    sort(va,by=abs) # sort by absolute values


    # Adding an exclamation mark saves the sorting to va: 
    println("va = ",va)
    sort!(va)
    println("va = ",va)



    # Filtering (identify elements that satisfy certain criterion):

    va = [4,5,-2,0]
    vs = ["CHE","AUT","AUS"]

    filter(iseven,va) 
    filter(startswith("A"),vs) # note that first argument is function returning logical 
    # can also supply own function: 
    filter(x-> x>0,va)

    # This is neater and tends to be faster than typing e.g. 
    # va[iseven.(va)].

    # Again, we can save the filtering to va by adding an exclamation mark:
    println("va = ",va)
    filter!(iseven,va)
    println("va = ",va)

    # Filtering is particularly useful for getting rid of NaNs,
    # e.g. when computing the mean:
    va = [3,5,10,NaN]
    mean(va)
    mean(filter(!isnan, va)) 



    # Identify indices of elements that satisfy certain criterion:

    va = [4,5,-2,0]

    findall(iseven,va)
    findfirst(iseven,va)
    findlast(iseven,va)

    # This is neater and tends to be faster than typing e.g. 
    # collect(1:length(va))[iseven.(va)]



# --- Vectors as Sets -----------------------------------------------------------


    va = [4,5,2,0]
    vb = [3,8,0,5]

    # is 2 in va? 
    2 in va  
    # or:
    2 ∈ va


    # Set operations:

    union(va,vb) # A∪B
    intersect(va,vb) # A∩B
    setdiff(va,vb) # "a complement b"



# --- Revisiting (Scalar-)Strings a.k.a. Vectors of Characters ------------------


    # A string is treated by Julia like a vector of characters.
    # Thus, much of the syntax and many of the commands for vectors also apply to strings.

    myString1 = "hello"
    myString2 = "everyone"

    length(myString1) 
    reverse(myString1)
    unique(myString1)
    replace(myString1,"o"=>"ooo")

    repeat("rum",3) # create new string by repeating "rum" three times


    # Indexing: 

    myString2[1]
    myString2[end]
    myString2[1:5] 



# --- Empty Vectors -------------------------------------------------------------


    # We can also define empty vectors:

    vva = Vector{Float64}(undef,1) # empty vector with float-elements
    println("vva = ", vva) # for now, it has one element

    # To then assign a value to the first element, type
    vva[1] = 3 
    println("vva = ", vva)

    # To assign a value to each subsequent element, type
    push!(vva,4) 
    println("vva = ", vva)

    # To add several elements at a time, type
    push!(vva,[5,6]...) 
    println("vva = ", vva)



# --- Vector-Types --------------------------------------------------------------


    # Just like scalars have different types 
    # (integers, floats, complex, rational, logical, string),
    # vectors can have different types, too.
    # They inherit their type from their elements.
    # Up to now, we encountered vectors of integers, floats, logicals and strings:

    va = [1, 2, 3] 
    vb = [1.2, 2, 3] 
    vc = [true, true, false]
    vd = ["CHE", "AUT", "AUS"]

    # Vector of complex numbers:
    ve = [3 + 2im, 4 - 1im]

    # Vector of rationals:
    ve = [3//4, 5//3]



    # We can also arbitrarily mix these types:
    va = ["economics", 2, 3.2, true]
    
    # To accommodate such mixing in an empty vector, 
    # need to declare it as type "Any":

    vva = Vector{Any}(undef,1) # empty vector with elements of any type 



    # We can also have vectors of functions:

    vf = [exp, abs]
    vf[1](3) # apply first function in vf to 3



    # Particularly useful is the creation of vectors of vectors or vectors of matrices:
    # (the syntax will be clear when we discuss for-loops)

    # 5-element-vector of 3-element-vector of ones:
    vva = [ones(3) for ii=1:5] 

    # 5-element-vector of 3x2 matrices:
    vma = [ones(3,2) for ii=1:5] 

    # 5-element-vector of empty float-vectors:
    vva = [Vector{Float64}(undef,1) for ii=1:5] 

    # 5-element-vector of empty float-matrices:
    vma = [Matrix{Float64}(undef,1,1) for ii=1:5] 

    # To accommodate underlying vectors/matrices of other types,
    # instead of "Float64", type "Int" or "Complex{Float64}" or "Rational{Int64}" or "Bool" or "String".
    # To accommodate underlying vectors/matrices of mixed type, instead of "Float64", type "Any".



# --- "Passing by Reference" & Copying ------------------------------------------


    # In Julia, special care is required when copying an object.
    # Most economists, coming from Matlab, R, etc., 
    # would be tempted to define a variable based on an existing one.



    # Scalar case:

    a = 5
    b = a 
    println("a = ",a,", b = ",b) 
    # Changing a does not change b:
    a = 10
    println("a = ",a,", b = ",b) 
    


    # Vector case:

    va = [5,5]
    vb = va
    println("a = ",va,", b = ",vb)
    # Changing va does change vb:
    va[2] = 10
    println("a = ",va,", b = ",vb)
    # This is called "Passing by reference".
    # vb is not defined to take the same value as va at the moment of definition.
    # Instead, vb is defined to be the same as va, and changing va changes vb.
    

    # To avoid this behavior, use "copy":
    va = [5,5]
    vc = copy(va) 
    println("a = ",va,", c = ",vc)
    # This copies va in its current state.
    # Changing elements of va will not change vc:
    va[2] = 10
    println("a = ",va,", c = ",vc)


    # Note that this doesn't apply to functions of va:
    # (no need to use "copy")
    va = [5,5]
    vb = log.(va)
    println("a = ",va,", b = ",vb)
    # Changing va does not change vb:
    va[2] = 10
    println("a = ",va,", b = ",vb)


    # However, if va is composed of other vectors, matrices, or similar (not of scalars),
    # then changing these objects in va will still change vc.
    # To avoid this behavior, "deepcopy" must be used:
    va = [[5,5],[6,6]]
    vc = copy(va) 
    vd = deepcopy(va)
    println("a = ",va,", c = ",vc,", d =",vd)
    # Changing the elements of a does not neither c nor d:
    va[2] = [7,7]
    println("a = ",va,", c = ",vc,", d =",vd)

    va = [[5,5],[6,6]]
    vc = copy(va) 
    vd = deepcopy(va)
    println("a = ",va,", c = ",vc,", d =",vd)
    # Changing the elements of elements of a changes c but not d:
    va[2][2] = 8
    println("a = ",va,", c = ",vc,", d =",vd)


    # In sum:
    # When working with vectors (or matrices) with scalar elements,
    # copy() prevents changes of elements in the original object to transmit to the derived object.

    # When working with vectors (or matrices) with vectors (or matrices) as elements,
    # copy() prevents changes of elements in the original object to transmit to derived object,
    # and deepcopy() prevents even changes to elements of elements in the original object to transmit to derived object.    



