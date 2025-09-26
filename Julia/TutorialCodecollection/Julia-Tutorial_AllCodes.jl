# Julia: Tutorial & Code-Collection
# (all codes from the tutorial)

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io


# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------



# -------------------------------------------------------------------------------
# 1 INTRODUCTION
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# 2 BASICS & SCALARS
# -------------------------------------------------------------------------------


    # To start Julia on VS Code, you need to run some Julia-code.

    # To run a chunk of code, select it and press 'shift+enter' on a Mac or 
    # click on the 'Play' button on the top-right of the script-window.

    # To close Julia, execute the command "exit()".


    # To highlight a whole line, click 'cmd+l'.

    # Comments are chunks of code (or text) that are ignored when running.
    # They start with a hashtag, as here.  
    # To comment-out a line of code, on a Mac, select it and press 'cmd+/' (i.e. cmd+shift+7).

    # To request help with a command, type the command with a question mark in
    # front in the REPL.  
    # For example, '?sqrt' shows the help page for the command 'sqrt'.

    # If you indent a section of code, you can hide it by clicking on the last non-indented line.
    # To automatically hide all such sections, press 'cmd+k+0'.

    # You can see further keybindings for VS Code under https://www.julia-vscode.org/docs/stable/userguide/keybindings/

    # If you already ran some commands in the REPL, you can use the up-arrow to go back to these commands. 



# --- Object Creation & Removal: Scalar Numbers ---------------------------------


    a = 5 
    # creates an object named 'a', which is a scalar and takes the value 5
    # output is shown in REPL

    b = 6; # use semi-colon to surpress output


    # Can use unicode characters to name objects. 
    # e.g. to create an object named 'α', type '\alpha' and press 'tab':

    α = 4.5

    # can also type '\:hamburger:' + 'tab':
    🍔 = 3.5



    # To show the current value of the object 'a', type on of the following:
    show(a)
    display(a)
    print(a)

    # to set the REPL-cursor to the next line for the next print, type:
    println(a)
    # notice the difference between simultaneously executing... 
    print(a)
    print(b)
    # ... and 
    println(a)
    println(b)



# --- Algebraic Operations with Scalar Numbers ----------------------------------


    # You can perform basic arithmetic operations with numbers and defined objects/variables:

    3+8
    3-8
    3*8
    3/8

    7^2


    a = 3
    b = 8

    a+b
    a-b
    a*b
    a/b

    # sidenote: can skip multiplication sign when multiplying number and object (in this order):
    7α



    # All these operations display the result in the console.
    # We can also save the result in a (new) object: e.g.

    c = a + b



    # Efficient updating of existing variables:

    a = 3

    a += 1 # is more efficient than
    a = a + 1 

    # similarly: -=, *=, /=, ^= 



    # Sidenote: 
    # Instead of writing out a longer sum, can write:
    +(a,b,α)
    # similarly:
    *(a,b,α)



# --- Pre-Defined Functions for Scalar Numbers ----------------------------------


    # Many standardly used functions are already implemented by default in Julia. 
    # For example:

    sqrt(a)  # square-root
    log(a)
    exp(a)
    factorial(4)


    sin(a) #sine of a in radians
    cos(a)
    tan(a)

    sin(a) #sine of a in radians
    sind(a) #sine of a in degrees

    deg2rad(60) #degrees to radians
    rad2deg(pi) #radians to degrees


    binomial(6,2) # # of ways of choosing 2 out of 6 items

    sign(a) #returns 1 for positive, -1 for negative


    a = 9.453
    round(a) # rounds to closest natural number
    round(a, digits=2) # rounds to two digits
    ceil(a) # rounds up to closest natural number
    floor(a) # rounds down to closest natural number



    # One can easily combine functions:

    sqrt(ceil(8.9))

    log(exp(a))
        


    # Functions that take two or more scalar arguments:

    rem(9,4) # remainder/modulus of 9/4
    gcd(3,8) # greatest common denominator of 3 and 8; (grösster gemeinsamer Nenner in German)
    lcm(3,86) # least common multiple of 3 and 8; (kleinstes gemeinsames Vielfaches in German)

    max(19,22,3) # get maximum of all arguments
    min(19,22,3) # get minimum of all arguments
    # (both can have as many arguments as desired)

    

# --- Special Values for Scalar Numbers -----------------------------------------


    # A variable can take on the value 'Inf' or '-Inf' (positive or negative
    # infinity).  
    # Any further operation with this variable gives again 'Inf' or '-Inf'.  
    # For example,

    a = Inf
    sqrt(a)
    a + 5
    -a


    # A variable can also take on the value 'NaN' (not-a-number).  
    # (This happens, for example, if one loads an excel file with an empty cell,
    # as the value in such a cell needs to be distinguished from, say, zero.)
    # Again, any operation with an NaN returns NaN:

    a = NaN
    sqrt(a)
    a + 5


    # To verify whether an object is Inf/-Inf or finite or NaN:

    isinf(a)
    isfinite(a)

    isnan(a)



# --- Object Types --------------------------------------------------------------


    # Objects you create are stored by Julia as different 'types'.  
    # Scalar numbers come as several different types.
    # Most common are integers and floats:

    a = 4
    b = 4.0
    c = 4.5

    typeof(a)
    typeof(b)
    typeof(c)

    # Beware the difference between 4 and 4.0. 
    # Sometimes, a command/function requires the scalar to be of a specific type.
    # To convert between integers and floats:
    Int(4.0)
    Float64(4)



    # A scalar in Julia can also be of type "Rational":

    a = 3//4
    typeof(a)

    numerator(a) # access numerator
    denominator(a) # access denominator

    float(a) # convert Rational to Float
    rationalize(0.75) # convert Float to Rational

    # can perform operations with two rationals, and result will be rational:

    a*4

    b = 3//7
    a + b



    # A scalar in Julia can also be of type "Complex":

    a = 4 + 3im # or:
    a = complex(4,3)

    real(a) # access real part
    imag(a) # access imaginary part

    conj(a) # complex conjugate of a
    angle(a) # angle of a in radians



# --- Booleans/Logicals ---------------------------------------------------------


    # A more peculiar type for a scalar is 'Boolean' (or logical).
    # A Boolean/logical can take on the values 'true', 'false' or 'NaN'.
    # It indicates whether some condition is true or false (or cannot even be evaluated).

    a = true 
    typeof(a)


    # Logicals are (usually) created using logical operators:
    # == (equal to), !== (not equal to), >, >=, <, <=

    a = 3
    b = 8

    a == b
    a !== b
    a > b
    a >= b
    a < b
    a <= b


    # Based on a logical, we can create another logical as its negation:

    c = (a<b)

    !(a < b)
    !c


    # Based on two logicals, we can create another logical by combining the two:

    d = (a==b)

    (a < b) && (a == b) # and (gives true if both are true)
    c && d 

    (a < b) || (a == b) # or (gives true if at least one is true)
    c || d


    # Logicals are also created with so-called 'ascertain' functions, 
    # some of which we saw above:

    isinf(a)
    isfinite(a)

    isnan(a)

    iseven(a)
    isodd(a)

    # They can be negated, e.g.
    !isnan(a)


    # Comparing two scalars at a certain tolerance level:
    isapprox(2,2.05; atol=0.1) 
    isapprox(2,2.05; atol=0.01) 



    # Note that we can perform arithmetic operations with logicals.
    # Thereby, true is treated like 1, false like 0:

    c*2

    d + 5


    # convert 'true' (logical) to 1.0 (Float) or 1 (Integer):

    Float64(true) 
    Int(true) 



# --- Strings -------------------------------------------------------------------


    # Another, peculiar type for a scalar is 'string'.

    s = "Hello" 
    typeof(s)


    # Lots of commands apply to strings, not to other scalar objects:

    uppercase(s)
    lowercase(s)

    s2 = "plotIRF12.png"

    contains(s2,"IRF")
    startswith(s2,"plot")
    endswith(s2,".jpg")

    split(s,"ll") # creates a 2x1 vector with characters before/after "ll"
    split("mississippi","i") # creates a 5x1 vector

    split("I like economics") # by default, splits at whitespace

    strip(" I like economics ") # gets rid of whitespace at start & end
    lstrip(" I like economics ") # only start
    rstrip(" I like economics ") # only end



    # Just like we can print integers/floats/rationals/complex nubmers/logicals, 
    # we can also print strings:

    print(s)
    println(s)

    # However, strings allow for more advanced printing:

    println("a = ",a) #or:
    println("a = $a")

    println(" ... a = ",a," ... ")

    # "\n" gives a linebreak:
    println("First line bla bla \n and second line bla bla")



    # Convert strings to integers/floats/...:

    parse(Int,"3") 
    parse(Float64,"3") 
    parse(Rational{Int64},"3//8")
    parse(Complex{Float64},"3+4im")
    parse(Bool,"1")


    # Convert integers/floats/... to strings:

    string(3)
    string(3.0)
    string(3//8)
    string(3+4im) 
    string(true)


    # Same command is used to combine strings or strings and integers/floats/...:

    string("a"," and b!")

    string("a",a)

    #this is useful for creating folder-/filenames out of objects:
    string("results_a",a,"_b",b,".csv")

    # Strings can be combined even more easily by multiplying them:
    "a" * " and b!" # is equivalent to the above
    string("a"," and b!")



# --- Packages ------------------------------------------------------------------


    # Julia is an open-source language. 
    # This means that there are many developers who write their own packages 
    # that define specific commands (functions) not included in Julia by default.  
    # To highlight which commands belong to which packages, 
    # we will load the packages only once these commands are needed.
    # However, in actual applications, it is best practice to have an initial
    # section where you load all packages.  


    # To install a package, 
    # open first the package-manager mode in REPL by typing "]".
    # Then, write e.g. " add LinearAlgebra ".
    # A package needs to be installed only once on a given computer.

    # To use an installed package,
    # type e.g. " using LinearAlgebra ".
    # (This is best done in the script itself, as the package must be loaded
    # every time the script is ran.)


    # Perhaps an easier way to install packages is via the package "Pkg".
    # Add this package in the way described above. 
    # Then, load it:
    using Pkg
    # Then, can add packages in the script, by typing e.g.
    Pkg.add("LinearAlgebra")
    # In contrast to the method above, this way one can type all package-installations
    # as well as -loadings in the script itself. 
    # This is advantageous when running scripts on servers.


    # To check the status of a package (e.g. the version you installed), 
    # open package-manager mode and type e.g. " st LinearAlgebra "
    # To update a package,
    # open package-manager mode and type e.g. " up LinearAlgebra "


    # Let's install and load the package "Printf":
    Pkg.add("Printf")
    using Printf
    # It's useful to avoid scientific notation, 
    # and print a number with specified number of digits:
    @printf "%.10f" 1e-8
    @printf "%.6f" 3.04

    @printf " I print             %.6f \n" 3.249905453
    @printf " and compare it with %.6f \n" 3.357488493



# -------------------------------------------------------------------------------
# 3 FUNCTIONS
# -------------------------------------------------------------------------------


    # Above, we used functions that are pre-programmed in Julia
    # or contained in a package we load. 
    # We can of course also define our own functions:

    f1(x) = 2 * x
    # or, in long form:
    function f2(x)
        return 2 * x
    end

    println("f1(3) = ",f1(3),", f2(3) = ",f2(3))


    # Can also define function without arguments:

    fMyFun() = 5

    fMyFun()


    # Multiple arguments:

    function fMyFun(x,y,z=3)
        # z has default value 3
        helper = 2*(x+5)
        return helper - y + z
    end

    fMyFun(6,4,2)
    fMyFun(6,4,3)
    fMyFun(6,4)


    # One can specify the type of argument that a function takes.
    fMyFun(x::Int) = 4*x
    fMyFun(3) # works
    fMyFun(3.0) # gives error

    # This way, one can also let a function do different things depending on the type of input:
    # (though this can also be done using a conditional; see below)

    fMyFun(x::Int) = 4*x
    fMyFun(x::Float64) = 2*x

    fMyFun(3)
    fMyFun(3.0)



    # Of course, just like it can take on multiple arguments,
    # a function can return multiple outputs:

    function fABC(x)
        output1 = x*2
        output2 = x*5
        return output1, output2
    end

    fABC(5)

    # Extract both outputs:
    o1, o2 = fABC(5)

    # Extracting only the needed outputs can have efficiency gains.

    # To extract just the first output:
    a1, _ = fABC(5)

    # To extract just the second output:
    _, a2 = fABC(5)



    # A function can map all sorts of objects into all sorts of objects.
    # e.g. it can take on a function as an argument:

    function fUseFunction(fOriginalFun,x)
        return fOriginalFun(5)*x
    end
    fOriginalFun(x) = x/3
    fUseFunction(fOriginalFun,9)

    # A function can also return a function:

    function fGetFun(x)
        function fMyInsideFunction(y)
            return x*y
        end
        return fMyInsideFunction
    end

    fMyInsideFunction = fGetFun(5)

    fMyInsideFunction(3)

    # Later, we'll discuss functions that use vectors or matrices as inputs and/or outputs.


    
    # We can create a new function by combining several other functions: 

    f1(x) = x^2
    f2(x) = x^3

    f(x) = f1(x) + f2(x)
    f(4)

    # Of course, changing f1 or f2 will also change f, then:
    f1(x) = 1.5 * x^2
    f(4)



    # It is good practice to have a granular code, 
    # where larger tasks are divided into many smaller tasks,
    # each of which is performed by a function.

    # When calling functions inside functions, 
    # keep in mind variable scopes (see below).



    # A note on redefining functions in Julia.
    # You might get unexpected errors when redefining functions.

    # The above two functions are so-caled "anonymous" functions.
    # They can easily be modified:
    println("f1(3) = ",f1(3),", f2(3) = ",f2(3))
    #
    f1(x) = 5 * x
    function f2(x)
        return 5 * x
    end
    #
    println("f1(3) = ",f1(3),", f2(3) = ",f2(3))

    # There are two ways to define "non-anonymous" functions in Julia:
    f3 = x -> 2 * x
    f4 = function(x)
        return 2 * x
    end
    # These can only be modified by re-defining them as again
    # "non-anonymous" functions:
    #
    println("f3(3) = ",f3(3),", f4(3) = ",f4(3))
    #
    f3 = x-> 5 * x
    f4 = function(x)
        return 5 * x
    end
    #
    println("f3(3) = ",f3(3),", f4(3) = ",f4(3))
    # 
    # but not as anonymous functions:
    f3(x) = 7 * x
    function f4(x)
        return 7 * x
    end



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



# -------------------------------------------------------------------------------
# 6 CONDITIONALS & LOOPS
# -------------------------------------------------------------------------------

    # Conditionals let a code do different things depending on the input it receives.

    # Loops let us execute a chunk of code repeatedly, possibly with slight modifications.
    # Changes to the code are then made much more easily than when the code is manually
    # written out several times (with slight modifications).


# --- Conditional ---------------------------------------------------------------


    # A conditional executes a certain script only if the stated condition is true:

    a = 1

    if a < 2
        b = 1
    else
        b = 3
    end

    if a < 2
        b = 1
    elseif a == 2
        b = 2
    else
        b = 3
    end

    # For such short scripts, these can be written more compactly as

    a < 2 ? b = 1 : b = 2  # if-else
    a < 2 ? b = 1 : (a == 2 ? b = 2 : b = 3) # if-elseif-else

    # If in one case nothing is done,
    # we do not write anything in the longer version of the conditional,
    # and we write "nothing" in the compact version:

    if a < 2
        b = 1
    else
    end

    a < 2 ? b = 1 : nothing


    # In fact, if in one case nothing is done,
    # then an even more efficient conditional is available:
    # the so-called "short-circuit evaluation":
    (a < 2) && (b = 1)

    # This works since " statement1 && statement2 " 
    # evaluates statement2 only if statement1 is true.

    # Analogously, we could write
    (a < 2) || (b = 2)
    # which sets b=2 if the condition is false,
    # but we could also write
    !(a < 2) && (b = 2)
    # or
    (a >= 2) && (b = 2)



    # The compact conditional is useful for compactly defining functions
    # that apply a conditional:

    f1(x) = isodd(x) ? 2x : x
    println("f1(2) = ", f1(2), " f1(3) = ", f1(3))

    # This is particularly advantageous when passing a non-anonymous function
    # fo a command like "map" or "replace":
    vb = [2,3]
    map(x -> isodd(x) ? 2x : x, vb) 



# --- For-Loop ------------------------------------------------------------------


    # A for-loop executes a script for each value of a so-called indexing variable,
    # denoted in the following by "ii":

    for ii = 1:3
        b = ii^2
        println("b = ", b)
    end

    # This is called an iteration; we iterate over ii going from 1 to 3;
    # we iteratively execute a script for ii = 1:3.


    # We can use "break" to stop the iterations once some condition is satisfied:

    for ii = 1:3
        b = ii^2
        b > 5 ? break : nothing
        println("b = ", b)
    end

    # We can use "continue" to skip (the rest of) an iteration if some condition is satisfied:
    for ii = 1:3
        b = ii^2
        b == 4 ? continue : nothing
        println("b = ", b)
    end



    # We can have nested for-loops:

    for ii = 1:3
        for jj = 1:2
            b = ii^2
            c = jj^2
            println("b = ", b, ", c = ", c)
        end
    end

    # More compactly:

    for ii = 1:3, jj = 1:2
        b = ii^2
        c = jj^2
        println("b = ", b, ", c = ", c)
    end



    # A compact for-loop (a so-called comprehension)
    # is useful for assigning values to vectors/matrices:

    va = [exp(ii) for ii in 1:5]

    ma = [jj*exp(ii) for ii in 1:5, jj=1:3]

    ma = ones(5,2)
    [ma[ii,2] = exp(ii) for ii in 1:5]


    # Also useful:

    collect(ii for ii in 1:10)

    collect(ii for ii in 1:10 if isodd(ii))



    # Just like we looped above over vectors of integers,
    # we can also loop over vectors of floats, complex and rational numbers.
    # We can also loop over vectors of strings:

    for ss = ["CHE","AUT","AUS"]

        println("country = ",ss)

    end
    
    # We can also loop over vectors:

    for options = [[1,34],[0,56]]

        option1, option2 = options

        println(" NEW ITERATION ")
        println(" option1 in this iteration = ", option1)
        println(" option2 in this iteration = ", option2)
        println(" ")

    end

    # This contrasts with a nested for loop where 
    # option1 takes on values 1 and 0 and option2 takes on values 34 and 56, 
    # since not all 4 combinations of these values may be needed.

    

# --- While-Loop ----------------------------------------------------------------


    # A while-loop executed some script while a condition is true:

    ii = 1

    while ii < 5
        println(" ii = ", ii)
        ii += 1
    end

    # In this particular case, the same output can be achieved with a combination of
    # a for-loop and the command "break" ...

    for ii = 1:10
        ii < 5 ? nothing : break
        println(" ii = ", ii)
        ii += 1
    end

    # ... but with more complex code we don't know ex-ante how long the condition will be true.



# -------------------------------------------------------------------------------
# 7 OBJECT-SCOPES
# -------------------------------------------------------------------------------


    # To make sure the following section fulfils its purpose,
    # exit and re-start Julia before going over this section
    # (in order to delete all objects created so far).


    # A for-loop introduces a local scope.
    # This means that object definitions that occur inside the for-loop
    # are visible only inside the for-loop, not in the global scope.
    # Consider the following example:

    for ii = 1:2
        q1a = ii
        println("q1a = ", q1a)
    end
    println("q1a = ", q1a)


    # To create an object in the for-loop and save it for the global scope, declare it as global:

    for ii = 1:2
        global q1b = ii
        println("q1b = ", q1b)
    end
    println("q1b = ", q1b)


    # In contrast, 
    # when the object that is changed inside the for-loop
    # is already defined before the for-loop, 
    # the changes are visible in the global scope:

    q1c = 5
    for ii = 1:2
        q1c = ii
        println("q1c = ", q1c)
    end
    println("q1c = ", q1c)




    # The same holds true for while-loops:

    ii = 1
    while ii < 3
        q2a = ii
        println("q2a = ", q2a)
        ii += 1
    end
    println("q2a = ", q2a)


    ii = 1
    while ii < 3
        global q2b = ii
        println("q2b = ", q2b)
        ii += 1
    end
    println("q2b = ", q2b)


    ii = 1
    q2c = 5
    while ii < 3
        q2c = ii
        println("q2c = ", q2c)
        ii += 1
    end
    println("q2c = ", q2c)



    # The same holds true for evaluated functions ...:

    function fMyFun(x)
        q3a = 2 * x
        return x^2
    end
    fMyFun(4)
    println("q3a = ", q3a)


    function fMyFun(x)
        global q3b = 2 * x
        return x^2
    end
    fMyFun(4)
    println("q3b = ", q3b)


    # ... though, in contrast to for- and while-loops,
    # non-global (re-)definitions inside the function are never visible in the outer scope,
    # not even if the object was defined beforehand:
    q3c = 5
    function fMyFun(x)
        q3c = 2 * x
        return x^2
    end
    fMyFun(4)
    println("q3c = ", q3c)



    # Conditionals do not introduce a local scope.



    # Local scopes imply that objects created only in specific iterations 
    # are not visible to other iterations: e.g.

    for ii = 1:3
        ii == 1 ? q1d = 5 : nothing
        println("Iteration ", ii, ": q1d = ",q1d)
    end

    # To make them visible, declare object as global.



    # Local scopes also imply that objects created in an "inner local scope"
    # are not visible to the "outer local scope":

    for ii = 1:2
        for jj = 1:2
            q1e = jj
        end
        println("q1e = ",q1e)
    end

    # In contrast, objects created in the "outer local scope" 
    # are visible to the "inner local scope":

    for ii = 1:2
        q1g = ii
        for jj = 1:2
            println("q1g = ",q1g)
        end
    end

    # Due to local scopes, 
    # nested for-loops do not always give the same as "compact" for-loops: 
    # e.g.

    for ii = 1:2
        for jj = 3:4
            println((ii,jj))
            ii = 0
        end
    end

    for ii = 1:2, jj = 3:4
        println((ii,jj))
        ii = 0
    end



    # For functions, it's slightly different;
    # like for for- and while-loops,
    # objects created in an "inner local scope" are not visible to the "outer local scope" ...:

    function fMyInnerFun1(x)
        z = 5
        return x^2
    end

    function fMyOuterFun1(w)

        result = fMyInnerFun1(w/3)

        return z * result

    end

    fMyOuterFun1(6)

    # ... but, in contrast to for- and while-loops,
    # objects created in an "outer local scope" are not visible to the "inner local scope":

    function fMyInnerFun2(x)
        return y * x^2
    end

    function fMyOuterFun2(w)

        y = 5

        result = fMyInnerFun2(w/3)

        return result

    end

    fMyOuterFun2(6)

    y = 10
    fMyOuterFun2(6) 
    # will always use the globally assigned value to y; 
    # the definition of y inside fMyOuterFun2 doesn't do anything!


    # This has important implications for "parameters" that appear in functions.
    # When defining functions, one has to take a stand whether to include such parameters
    # explicitly as arguments of the function or let the function use them implicitly.
    # If the parameters are used explicitly, every time such functions are evaluated,
    # they will use the supplied values for these parameters.
    # If the parameters are used implicitly, every time such functions are evaluated, 
    # they will use the globally assigned values for these parameters.
    # Therefore, implicitly used objects are o.k. as long as they are only changed in the global scope.
    # If in doubt, specify parameters as explicit arguments.



# -------------------------------------------------------------------------------
# 8 FURTHER OBJECT-TYPES
# -------------------------------------------------------------------------------


    # Knowing the object-types we discussed so far suffices for most (standard) tasks.
    # However, there are a few more object-types in Julia worth knowing about.

    # Let's install the new packages needed in this section:
    Pkg.add("DataFrames")



# --- Expressions & Symbols -----------------------------------------------------


    # Julia has object types "Symbol" and "Expr" (expression),
    # whereby symbols are essentially building blocks of expressions.
    # They allow us to use strings to execute commands and, more generally,
    # to define and call objects.



    # Construction and evaluation of expressions:


    # Simple construction of expressions:
    exA = :((4+5)/2)
    # or:
    exA = Meta.parse("(4+5)/2")

    # Construction of longer expressions:
    exB = quote
        x = 4
        y = 5
        (x+y)/2
    end

    # It is of type "Expr":
    typeof(exA)

    # Evaluate expression:
    eval(exA)


    # We can let our expressions depend on objects we create.
    # This can be done in two ways.
    # When we write the object name with a dollar sign in front,
    # we include the current value of that object in our expression.
    # When we write the object name without a dollar sign in front,
    # we link our expression to them so that the object's value 
    # at the time of execution matters.

    a = 3
    b = 8 
    exA = :($a + b)  # or:
    exA = Meta.parse("$a + b")

    println("The expression 'exA' reads: ", exA)
    # (value of b doesn't matter; b doesn't even need to exist when defining exA)

    a = 2
    b = 7
    eval(exA)


    # Using expressions, we can define objects:

    exA = Meta.parse("x_4 = 3.74")
    eval(exA)

    # Sidenote: to define strings, need to use triple quotation marks
    exB = Meta.parse(""" s_4 = "3.74" """)
    eval(exB)

    # This is useful if e.g. we create many variables x_1, x_2, x_3, ... in a loop;
    # we would type something like
    ii = 4 # this is the iterator in the loop
    value = 3.74
    Meta.parse(string("x_",ii," = ",value))



    # A symbol allows us to call objects using strings:

    sym1 = Symbol("x","_",4)

    typeof(sym1)

    eval(sym1)

    # This is useful if we call many variables x_1, x_2, ... in a loop;
    # we'd type something like
    eval(Symbol("x","_",ii))


    # Such "dynamic" object-creation and -calling is referred to as "metaprogramming".



# --- Tuples --------------------------------------------------------------------


    # A tuple (like a vector) is an ordered collection of elements (of any type)
    # that (unlike a vector) cannot be changed once they are defined.
    # Using tuples rather than vectors for immutable collections of elements
    # tends to lead to more efficient code.
    
    ta = ("hello", 2025, true, 2, 5//8)

    # We can turn a vector into a tuple:
    vx = ["hello",2025]
    tuple(vx...)

    # A tuple is indexed just like a vector:
    ta[2]
    ta[end]
    ta[2:4]

    # We cannot change its elements ...:
    ta[2] = 2024

    # ... but we can overwrite the object:
    ta = (2,3,4)

    # We can apply functions to a tuple:
    sqrt.(ta) 

    # We can also create a vector of tuples:
    vt = Vector{Tuple}(undef,1)
    vt[1] = ("hello", 2025)
    push!(vt,("hi", 2024))



# --- Dataframes ----------------------------------------------------------------


    # Dataframes are essentially like matrices with named columns/rows.
    # There are many pre-defined commands to manipulate them (see package documentation).
    # I find them useful for reading from and writing to csv or excel files 
    # as well as for printing information as nice tables in the REPL.
    # (By habit, I stick to dataframes in R for raw data manipulation.)

    using DataFrames

    # Create an empty data frame:
    dfData1 = DataFrame(Stat = String[], b_ = Float64[], k_ = Float64[])

    # Add a row at the end:
    push!(dfData1, ("Mean",0.67,1.34)) 

    # Add (squeeze in) a row at position 1:
    insert!(dfData1, 1, ("Median",0.65,1.33))

    # Add a column called "Periods":
    dfData1[!, "Periods"] = ["period1","period1"]


    # To access elements, index dataframe just like a matrix: e.g.
    dfData1[1,2:3]

    # Access column names:
    names(dfData1)

    # Rename columns:
    rename!(dfData1, names(dfData1) .=> Symbol.(["stats","b_", "k_","t"])) 


    # Convert dataframe to matrix:

    Matrix{Float64}(dfData1[:,2:3])


    # Convert matrix to dataframe:

    mData = [2.0 3 4; 3 4 5]

    dfData = DataFrame(mData, :auto)
    # with labelled columns:
    vLabels = ["a","b","c"]
    dfData = DataFrame(mData, Symbol.(vLabels))



# --- Custom Types (Structures) -------------------------------------------------


    # We can also define own object-types, so-called "structures" or "structs".
    # For example:

    struct mystruct3
        year::Int
        quarter::Int
        region::String
        consumption::Float64
        gdp::Float64
    end

    # Just like when defining functions, typing "::" and the type is not necessary;
    # the struct will default to type "Any". 
    
    # By default, a struct is immutable. 
    # To define a mutable struct, type "mutable struct mystruct3".


    # Create an object of this type:
    strCountry1 = mystruct3(2025, 4, "Europe", 0.74, 0.89)

    # Access the field "gdp" of this object:
    strCountry1.gdp

    # Remind yourself which fields are available:
    fieldnames(mystruct3)


    # Create a 10x1 vector with elements of type "mystruct3":
    vStrCountries = Vector{mystruct3}(undef,10) 

    # Fill in first element:
    vStrCountries[1] = mystruct3(2025, 4, "Europe", 0.74, 0.89)



# -------------------------------------------------------------------------------
# 9 PATH-, FOLDER- & WORKSPACE-MANAGEMENT
# -------------------------------------------------------------------------------


    # Look up present working directory:

    pwd()


    # Set up working directory:

    cd("/files/Julia/") # (insert your own path here)

    # It is a good idea to store the paths you frequently use:

    sPathMain            = "/files/Julia/TutorialCodecollection/" # (insert your own path here)
    sPathFunctions       = sPathMain * "Functions/"
    sPathOutput          = sPathMain * "/Output/"
    
    cd(sPathMain)
    
    # It's best practice to let all your paths end with a backslash, 
    # so that you can reference individual files or folders in them by just adding 
    # the corresponding filename.


    # List all folders/files in pwd:

    readdir()

    # Create new folder in present working directory:

    mkdir("mynewfolder")

    # Note: this returns error if folder already exists.
    # Hence, best wrap folder-creation in try-catch-environment:
    try
        mkdir("mynewfolder")
    catch
    end

    # Remove folder/file in present working directory:
    rm("mynewfolder")


    # It is a good idea to divide project into several files.
    # An external julia-file can then be called from the present script by typing e.g.

    include(sPathFunctions * "fMyAmazingFunction.jl") # this gives error, since no such file exists



# -------------------------------------------------------------------------------
# 10 STORING & LOADING DATA
# -------------------------------------------------------------------------------


    # Now we'll write and read some .csv-, .xlsx- and .txt-files.
    # We'll do this in the path "sPathOutput", which we create for this purpose:

    sPathMain            = "/files/Julia/TutorialCodecollection/" # (insert your own path here)
    sPathOutput          = sPathMain * "/Output/"
    
    try
        mkdir(sPathOutput)
    catch
    end


    # Our mock data:

    mData       = [3.4 4.4; 3.0 0.8]
    vsColNames  = ["colA","colB"]

    vData       = [3.4, 3.0, 2.7, 3.1]


    # Let's install the new packages needed in this section:
    vPkgs = ["CSV",
    "DelimitedFiles",
    "XLSX"]
    Pkg.add.(vPkgs)



# --- .csv-Files ----------------------------------------------------------------


    # Write matrix (via dataframes) to .csv-file:

    using CSV
    using DataFrames


    # Without colum names:

    sFilename = "myamazingfile.csv"

    CSV.write(sPathOutput * sFilename,  DataFrame(mData,:auto), header=false)

    # Note that we transform the matrix to a dataframe, which we then write to the .csv-file.


    # With colum names, option A:

    sFilename = "myamazingfile2a.csv"

    CSV.write(sPathOutput * sFilename,  DataFrame(permutedims(vsColNames),:auto), header=false)
    CSV.write(sPathOutput * sFilename,  DataFrame(mData,:auto), append=true)

    # i.e. we first write the transposed string-vector containing the column names,
    # and we then append that csv file with the actual data


     # With colum name, option B:

    sFilename   = "myamazingfile2b.csv"

    dfData      = DataFrame(mData,:auto)
    rename!(dfData, names(dfData) .=> Symbol.(vec(vsColNames)))
    CSV.write(sPathOutput * sFilename, dfData)

    # i.e. we create a data frame with named columns, which we then write to the .csv-file,
    # without writing "header=false" (the option reverts to "true").



    # Read-in .csv-file as matrix (via dataframe):

    sFilename       = "myamazingfile.csv"
    dfLoadedData    = CSV.read(sPathOutput * sFilename, DataFrame; header=0)
    mLoadedData     = Matrix{Float64}(dfLoadedData)


    sFilename        = "myamazingfile2a.csv"
    dfLoadedData     = CSV.read(sPathOutput * sFilename, DataFrame; header=1)
    vsLoadedColNames = names(dfLoadedData)
    mLoadedData      = Matrix{Float64}(dfLoadedData)


    # Alternative: read-in .csv-file directly as matrix:

    using DelimitedFiles

    # Without column names:

    sFilename   = "myamazingfile.csv"
    mLoadedData = readdlm(sPathOutput * sFilename,',', skipstart=0)
    # to specify it should be of type Float64:
    mLoadedData = readdlm(sPathOutput * sFilename,',', Float64, skipstart=0)

    # With column names:

    sFilename           = "myamazingfile2a.csv"
    mLoadedData         = readdlm(sPathOutput * sFilename,',', skipstart=1)
    vsLoadedColNames    = string.(readdlm(sPathOutput * sFilename,',', skipstart=0)[1,:])



# --- .txt-Files ----------------------------------------------------------------


    using DelimitedFiles

    sFilename = "myamazingfile.txt"


    # Write matrix to .txt-file:

    writedlm(sPathOutput * sFilename, mData)
    # includes space as delimiter; to change to tab:
    writedlm(sPathOutput * sFilename, mData,'\t')
    # to change to comma:
    writedlm(sPathOutput * sFilename, mData,',')
    

    # Read .txt-file to matrix:

    mLoadedData = readdlm(sPathOutput * sFilename, ',', Float64, '\n')

    
        
# --- .xlsx-Files ---------------------------------------------------------------


    using XLSX
        
    sFilename = "myamazingfile.xlsx"


    # Write data to .xslx-file:

    XLSX.openxlsx(sPathOutput * sFilename, mode="w") do xf

        sheet               = xf[1]

        XLSX.rename!(sheet, "first")

        sheet["A1"]         = permutedims(vsColNames) # col names

        sheet["A2"]         = mData # data


        XLSX.addsheet!(xf, "second")
        sheet = xf[2]

        sheet["A1",dim=1]   = vData 
        # need to add option "dim=1" to add vector as column vector (top down)
        # rather than row vector (left to right)

    end

    
    # Read data from .xslx-file:

    mLoadedData     = XLSX.readdata(sPathOutput * sFilename, "first", "A2:B3")

    dfLoadedData    = DataFrame(XLSX.readdata(sPathOutput * sFilename, "first", "A2:B3"),Symbol.(vsColNames))

    XLSX.readdata(sPathOutput * sFilename, "second", "A1:A4")

    
    # An advantage of using xlsx-files is that several sheets can be added/loaded.
    # A disadvantage is that we have to know sheet range where data is located,
    # and the type of data (e.g. Float64) is not automatically recognized, 
    # but data is loaded as type "Any".



# -------------------------------------------------------------------------------
# 11 RANDOM VARIABLES
# -------------------------------------------------------------------------------


    # Let's install the new packages needed in this section:
    vPkgs = ["StatsBase",
    "StatisticalRethinking",
    "Random"]
    Pkg.add.(vPkgs)


    # The package "Distributions" yields a function for each distribution.
    # e.g. Uniform(3,9) defines a uniform distribution between 3 and 9,
    # Normal(1,2) defines a Normal distribution with mean 1 and variance 2,
    # Exponential(3) defines an Exponential distribution with scale parameter 3,
    # MvNormal(vμ,mΣ) defines a multivariate Normal distribution with mean vμ and variance mΣ,
    # etc.
    # See https://juliastats.org/Distributions.jl/stable/
    # for the distributions supported and the parameters by which they are identified.

    using Distributions

    
    # To draw a random value from one of these distributions: e.g.
    rand(Normal(1,2))
    # for several (5) draws at once:
    rand(Normal(1,2),5)
    # for a matrix (5x3) of draws:
    rand(Normal(1,2),5,3)

    # To find out mean, variance, skewness, kurtosis:
    mean(Normal(1,2))
    var(Normal(1,2))
    skewness(Normal(1,2))
    kurtosis(Normal(1,2))
    
    # To find out quantiles, e.g. the 30th percentile:
    quantile(Normal(1,2), 0.3)
    # the 5th and 95th percentile at once:
    quantile(Normal(1,2), [0.05, 0.95])
    

    # To evaluate the pdf of such a distribution at a certain point: e.g.
    pdf(Normal(1,2), 0.5)
    # at several points at once:
    pdf(Normal(1,2), [0.5,0.8])

    # To evaluate the cdf:
    cdf(Normal(1,2), 0.5)

    # Logpdf and logcdf:
    logpdf(Normal(1,2), 0.5)
    logcdf(Normal(1,2), 0.5)

    # Evaluating directly the log-pdf/-cdf is preferred to 
    # first evaluating the pdf/cdf and then taking logs,
    # since pdf-values close to zero will result in the log being -Inf
    # due to numerical rounding issues:
    log(pdf(Normal(1,2), -400))
    logpdf(Normal(1,2), -400)


    # The syntax is analogous for multivariate distributions,
    # whereby they need to be evaluated at a vector: e.g.

    vμ = [1,3]
    mΣ = [3.4 0.8; 0.8 1.2]

    pdf(MvNormal(vμ,mΣ), [0.8,-0.1])
    

    # To draw from a Uniform distribution, can just type

    rand()
    # that's equivalent to 
    rand(Uniform(0,1))


    # Can also add a truncation to distributions: e.g.

    truncated(Normal(1,2), -2,4)
    rand(truncated(Normal(1,2), -2,4))
    logpdf(truncated(Normal(1,2), -2,4),0.5)


    # The "categorical" distribution (also referred to as "multinomial")
    # is a discrete, univariate distribution with values ranging 
    # from 1 to N and manual probabilities for each value.

    vProbs = [0.1, 0.05, 0.3, 0.2, 0.1, 0.25]

    Categorical(vProbs)

    rand(Categorical(vProbs)) 

    # Of course, any other N values can be supported
    # by regarding the value of Categorical(vProbs) as the index
    # of the vector of desired values: e.g.
    vValues = collect(range(3,step=3,length=6))
    vValues[rand(Categorical(vProbs))]



    # Compute quantiles of a list (vector) of values (an empirical distribution):

    vValues = rand(100)

    quantile(vValues,0.05)



    # Using the package "StatsBase", we can compute quantiles of
    # a weighted list of values:

    using StatsBase

    vWeights = rand((0.8,1.2),100)
    vWeights ./= sum(vWeights)

    StatsBase.quantile(vValues,ProbabilityWeights(vWeights),0.05)
    # (can also ignore weights:)
    StatsBase.quantile(vValues,0.05) 

    # Can also compute weighted mean and variance:

    StatsBase.mean(vValues,ProbabilityWeights(vWeights))
    StatsBase.var(vValues,ProbabilityWeights(vWeights))
    


    # Compute bounds of Bayesian HPD set:

    using StatisticalRethinking

    hpdi(vValues)


    
    # To set the seed:

    using Random

    Random.seed!(232)


    # This sets the seed globally,
    # which can have unintended consequences.
    # To set the seed locally, use MersenneTwister():

    a = MersenneTwister(1234)

    rand(a)

    # Consider the following example:

    function fRandA()
        a = MersenneTwister(123);
        return rand(a)
    end

    function fRandB()
        return rand()
    end

    function fRandBoth()
        return fRandA() + fRandB()
    end

    # Of course, every time it is called, 
    # fRandA() gives the same random number,
    # while fRandB() gives different random numbers,.

    # As expected, then, fRandBoth() gives different random numbers
    # every time it is called:

    println(fRandBoth())
    println(fRandBoth())
    println(fRandBoth())

    # Suppose we re-define fRandA() to set the seed
    # using Random.seed!().

    function fRandA()
        Random.seed!(123)
        return rand()
    end

    # This doesn't change the behavior of fRandA() nor fRandB()
    # considered in isolation.
    # However, it changes the behavior of fRandBoth():
    # fRandA() sets the seed globally, i.e. also for subsequent 
    # calls of fRandB().
    # Hence, fRandBoth() always gives the same random value:

    fRandBoth()

    # If we changed the order of fRandA() and fRandB() in fRandBoth(),
    # the latter would give the same random value only from its second call onwards:

    function fRandBoth()
        return fRandB() + fRandA()
    end

    println(fRandBoth())
    println(fRandBoth())
    println(fRandBoth())



# -------------------------------------------------------------------------------
# 12 PARALLELIZATION
# -------------------------------------------------------------------------------


    # Let's install the new packages needed in this section:
    vPkgs = ["Distributed",
    "SharedArrays",
    "ParallelDataTransfer"]
    Pkg.add.(vPkgs)


    # In Julia, it is very easy to run code in parallel 
    # and thereby achieve (potentially huge) efficiency gains.
    # In the following, I will focus on distributed (multi-core-) processing 
    # with little communication across cores,
    # which I find very relevant for work in economics/econometrics.
    # Keep in mind that, besides the ones discussed here,
    # there are many more functions and approaches to implement parallel computations in Julia,
    # including a whole separate environment that uses tasks & channels.


    using Distributed

    # Number of cores ("processes") currently in use:
    nprocs()
    # List their IDs:
    procs()

    # See how many cores you have available:
    Sys.cpu_info()

    # Addd more workers:
    nProcs = 4
    addprocs(nProcs-nprocs())

    # Now, we have 4 processes:
    nprocs()
    procs()
    # three of which (all but main process)
    # are called "workers" by Julia:
    nworkers()
    workers()


    
    # To implement the multi-core-for-loop, we need to make sure that:
    # (1) all workers know the involved packages, functions and objects used as inputs to the functions.
    # (2) the object to which the workers jointly write is a "SharedArray".


    # For example:
    # (1)

    @everywhere using Distributions

    @everywhere function fDrawChiSquared(μ,k)
        return sum(rand(Normal(μ,1),k).^2)
    end

    @everywhere μ = 2
    @everywhere k = 5

    # (2)

    @everywhere using SharedArrays

    M = 1000

    vOutput = SharedArray{Float64}(M)


    # (3) Run multi-core-for-loop and use result:

    @distributed for ii = 1:M

        vOutput[ii] = fDrawChiSquared(μ,k)

    end

    theoryMean = k + k*μ^2

    println(" Simulated mean   = ", mean(vOutput))
    println(" Theoretical mean = ", theoryMean)

    # Note that M doesn't need to be known by workers. 



    # Compare runtime relative to single-core-for-loop:

    M = 1000000

    @time begin
        vOutput = SharedArray{Float64}(M)
        @distributed for ii = 1:M
            vOutput[ii] = fDrawChiSquared(μ,k)
        end
    end

    @time begin
        vOutput2 = zeros(M)
        for ii = 1:M
            vOutput2[ii] = fDrawChiSquared(μ,k)
        end
    end

    # Note that parallelization does involve some overhead costs,
    # so that, in this example, it pays off only for M large.
    # To see that, compare the runtimes of the two loops above
    # for M = 100 vs for M = 1000000



    # Some comments:

    # (2)

    # to create a n1 x n2 matrix, type SharedArray{Float64}(n1,n2)
    # to create a n1 x n2 x n3 array, type SharedArray{Float64}(n1,n2,n3)

    # Note that a SharedArray is automatically defined on all workers.
    # No @everyhwere is needed in front of its definition.

    # Watch out that you don't change the type of a SharedArray;
    # e.g. if vL is an (Nx1)-SharedArray, 
    # writing vL = objABC will change its type to a normal array,
    # while vL[:,1] = objABC will not.

    # If you get the error message
    # "cannot convert an object of type RemoteCall Exception to ...", 
    # then it is likely because you are trying 
    # to apply a function designed for arrays to a SharedArray. 
    # To remedy the issue, 
    # just take a slice of the SharedArray (which is a "normal" array) as the input to the function.
    # e.g. if the mA is a (n x 1)-SharedArray, take A[:,1].


    # (1)

    # When defining many objects, use so-called compound expression:

    @everywhere begin
        μ   = 2
        k   = 5
    end
    
    # To load external functions on all workers,
    # type "@everywhere include("somefunction.jl")".


    # To let workers know about already created objects (except functions),
    # can use package "ParallelDataTransfer":

    @everywhere function fDrawChiSquared_diffmeans(vμ)
        return sum(rand.(Normal.(vμ,1)).^2)
    end

    @everywhere using ParallelDataTransfer

    vμ = [3, 4, 5, 6, 7, 9]

    @everywhere @eval vμ = $vμ
    # I prefer this to the alternative,
    @passobj 1 workers() vμ
    # or
    passobj(1, workers(), :vμ)
    # since the latter sometimes doesn't work in loops,
    # for reasons I don't understand.
    # Other alternative:
    sendto(workers(), vμ = vμ)

    # Verify whether e.g. worker 3 knows vμ:
    @fetchfrom 3 vμ
    

    # Carry out multi-core-for-loop:

    M       = 1000
    vOutput = SharedArray{Float64}(M)

    @distributed for ii = 1:M

        vOutput[ii] = fDrawChiSquared_diffmeans(vμ)

    end

    theoryMean = k + mapreduce(x->x^2,+,vμ)

    println(" Simulated mean   = ", mean(vOutput))
    println(" Theoretical mean = ", theoryMean)


    # MOST IMPORTANTLY:
    # Before you run a code that contains multi-core-for-loops, 
    # verify whether all objects are defined on all workers
    # using e.g.
    println(@fetchfrom 2 vμ) 
    # (If all workers were created simultaneously and objects were always passed on to all workers,
    # then verifying whether e.g. worker 2 knows all objects is enough; no need to verify for all workers.)
    # If you have complex code and an object is not known on all workers,
    # it happens that the code is stuck,
    # and you need to quit and restart VS Code or even your computer!



    # The function "map" we discussed above
    # can be parallelized simply by typing "pmap" instead of "map".
    @everywhere using LinearAlgebra
    @everywhere fMyFun(x) = maximum(abs.(eigvals(x)))
    vM = [rand(1000,1000) for ii=1:5] 
    pmap(fMyFun,vM)

    # If we have a few time-consuming operations (as here),
    # rather than many cheap operations (as above),
    # this parallelization approach is supposedly faster 
    # than the multi-core-for-loop above.
    # However, I struggled to find an example where this holds,
    # and I preferred to use the multi-core-for-loop in all my coding.

    @time pmap(fMyFun,vM)

    @time begin
        @everywhere @eval vM = $vM
        vOutput = SharedArray{Float64}(5)
        @distributed for ii = 1:5
            vOutput[ii] = fMyFun(vM[ii])
        end
    end



# -------------------------------------------------------------------------------
# 13 PLOTTING
# -------------------------------------------------------------------------------


    # Let's install the new packages needed in this section:
    vPkgs = ["Plots",
    "StatsPlots",
    "Measures"]
    Pkg.add.(vPkgs)


    sPathMain            = "/files/Julia/TutorialCodecollection/" # (insert your own path here)
    sPathOutput          = sPathMain * "/Output/"

    using Plots



# --- Single Vector (Line-Plot) & Basics ----------------------------------------


    vx              = collect(1:5:100)
    
    fMySquare(x)    = x^2
    vy              = fMySquare.(vx)

    using Distributions
    myDist          = Normal(25,8)
    vz              = pdf.(myDist,vx)



    # The very basics:

    # Plot single vector:
    plot(vy) # x-axis defaults to 1:1:length(vy)

    # Plot one vector against another:
    plot(vx, vy)

    # Can also plot directly function against x-axis: 
    plot(fMySquare, vx)

    # Can also plot a distribution against x-axis:
    using StatsPlots
    plot(myDist, vx)

    

    # Labels:

    # Edit line-label:
    plot(vx, vy, label="single label looks ugly")
    plot(vx, vy, label="")

    # Add title and axis-labels:
    plot(vx, vy, label="", title="An amazing plot", xlabel="xxx", ylabel="yyy")

    # Change their font size:
    myFS = 12
    plot(vx, vy, label="", title="An amazing plot", xlabel="xxx", ylabel="yyy", titlefont=font(myFS), xtickfont=font(myFS), ytickfont=font(myFS))

    # Can add latex-labels: e.g.:
    plot(vx, vy, label="", title="Plot of  \$ \\alpha(x) \$")
    # declare equation-start and -end by "\$", and use double-backslash instead of single backlash in front of latex-definitions
    

    # Appearance of line:

    plot(vx, vy, label="", line = (:black, 1, 2, :solid))
    
    # First number gives transparency, second gives thickness:
    plot(vx, vy, label="", line = (:black, 0.5, 2, :solid))
    plot(vx, vy, label="", line = (:black, 1, 5, :solid))

    # Linetype:
    plot(vx, vy, label="", line = (:black, 1, 2, :dash))
    plot(vx, vy, label="", line = (:black, 1, 2, :dot))
    plot(vx, vy, label="", line = (:black, 1, 2, :dashdot))
    plot(vx, vy, label="", line = (:black, 1, 2, :dashdotdot))
    # (Sidenote: can also type ":line" instead of ":solid".)

    # Color:
    plot(vx, vy, label="", line = (:blue, 1, 2, :solid))
    plot(vx, vy, label="", line = (:red, 1, 2, :solid))

    # Get nicer colors by using "colorschemes":
    cgrad(:blues) # color-palette as gradient; indexable by x ∈ [0.0, 1.0]
    palette(:Blues_9) # color-palette as vector; indexable x = 1, 2, ... (here: 9 elements) 
    # see https://docs.juliaplots.org/latest/generated/colorschemes/ for schemes available
    # Can also define own gradient/vector of colors: e.g. 
    myBlue  = cgrad(:blues)[1.0]
    myRed   = cgrad(:reds)[1.0]
    cgrad([myRed,myBlue]) # gradient
    vColors = range(start=myRed, stop=myBlue, length=10) # vector
    
    myBlue = cgrad(:blues)[1.0] # very nice blue
    plot(vx, vy, label="", line = (myBlue, 1, 2, :solid))


    # Appearance of axes:

    # Edit limits:
    plot(vx, vy, label="", xlims=(-20,150), ylims=(0,5000))
    # To just edit lower limit of e.g. x-axis: (analogously for upper limit and for y-axis)
    plot(vx, vy, label="", xlims=(-20,Inf))

    # Edit ticks: (e.g. x-ticks; analogously for y-ticks)
    myTicks         = [0,25,50,100,150]
    myTickLabs      = string.(myTicks)
    plot(vx, vy, label="", xlims=(-20,150), xticks=(myTicks,myTickLabs))
    # e.g. have tick-labels in multiples of 100:
    myTickLabs      = string.(myTicks./100)
    plot(vx, vy, label="", xlims=(-20,150), xticks=(myTicks,myTickLabs), xlabel="xxx [in 100s]")
    # Remove tick-label at 25, but leave tick-mark:
    myTickLabs[2] = ""
    plot(vx, vy, label="", xlims=(-20,150), xticks=(myTicks,myTickLabs))
    # Faster, but less flexible way to have tick-labels in multiples of 100:
    plot(vx, vy, label="", xlims=(-20,150), xformatter = x -> string(x/100), xlabel="xxx [in 100s]")

    # Change font size of ticks:
    plot(vx, vy, label="", title="An amazing plot", xlabel="xxx", ylabel="yyy", xguidefontsize=myFS, yguidefontsize=myFS)

    # Note: to plot dates, best convert to continuous number.
    # e.g. for quarterly data, use 1970.00, 1970.25, etc.


    # Ex-post changes of title, axis-labels, and axis-appearance

    # We can change everything that pertains to the plot as a whole
    # (and not just the single line we plotted) using plot!(...):
    plot(vx, vy, label="")
    # e.g. title and axis-labels:
    plot!(title="An amazing plot", xlabel="xxx", ylabel="yyy")
    # e.g. axis-limits:
    plot!(xlims=(-20,150), ylims=(0,5000))
    # e.g. axis-ticks:
    plot!(xticks=(myTicks,myTickLabs))

    # Sidenote: some of these can also be changed directly using e.g.
    # xlabel!("xxx") or ylims!((0,5000)),
    # but I find it easier to remember the approach above;
    # write plot!(...) and add the options you want 
    # in the same way as you would when you first create a plot.



    # Further options:

    plot(vx, vy, label="", grid=false) # remove grid in background

    vline!([0], label="") # add vertical line at x=0
    hline!([100], label="") # add horizontal line at y=100

    # Add text to plot:
    annotate!(5, 1000, text("note that curve goes below 100", :blue, :left, 10)) 

    xflip!(true) # flip x-axis
    
    # Edit margins:
    using Measures
    # e.g.:
    plot(vx, vy, label="", title="An amazing plot", topmargin=5mm) 

    # Add shaded area around line:
    # 1. same distance for all x: 
    plot(vx, vy, ribbon=(200,500), fillalpha=0.2, fillcolor=:blue)
    # 2. distinct distance across x, but same for top and bottom: ("symmetric bounds")
    vDist           = rand(Uniform(200,500),length(vy))
    plot(vx, vy, ribbon=vDist, fillalpha=0.2 , fillcolor=:blue)
    # 3. distinct distance across x and between top and bottom: ("asymmetric bounds")
    vDistBottom     = rand(Uniform(200,300),length(vy))
    vDistTop        = rand(Uniform(200,800),length(vy))
    plot(vx, vy, ribbon=(vDistBottom,vDistTop), fillalpha=0.2 , fillcolor=:blue)



    # Save the plot as file:

    plot(vx, vy, label="")
    savefig(sPathOutput * "plot1.png") 
    # "savefig" saves currently displayed plot (the one just created in line above)

    # Note that we can create the plot as an object...:
    plot1 = plot(vx, vy, label="")
    # ... and display it even after its creation:
    display(plot1)

    # This allows us to save it after it's been created:
    savefig(plot1, sPathOutput * "plot1.png") 



# --- Multiple Vectors (Line-Plot) ----------------------------------------------

    
    vx  = collect(-2:0.1:2)
    vy1 = vx.^2
    vy2 = vx.^3
    vy3 = vx.^4


    # To plot multiple lines, 
    # type plot() for first line, followed by plot!() for each subsequent one:
    plot(vx, vy1, label="line 1")
    plot!(vx, vy2, label="line 2")
    plot!(vx, vy3, label="line 3")

    # Again, we can save this plot as an object:
    myplot2 = plot(vx, vy1, label="line 1")
    plot!(vx, vy2, label="line 2")
    plot!(vx, vy3, label="line 3")



    # Edit legend:

    # Position:
    plot(vx, vy1, label="line 1", legend = :bottom)
    plot!(vx, vy2, label="line 2")
    plot!(vx, vy3, label="line 3")
    # The option "legend" specifies the position of the legend.
    # Can use :bottom, :top, :left, :right as well as :topright, :bottomleft, etc.,
    # and can also add "outer" in front (e.g. :outertopright) to put legend outside of plot area.

    # To remove the legend, add "legend = false".

    # To set color of legend frame to transparent:
    plot(vx, vy1, label="line 1", legend = :bottom, foreground_color_legend = nothing)
    # To set color of legend background to transparent:
    plot(vx, vy1, label="line 1", legend = :bottom, background_color_legend = nothing)

    # For the legend, even more so than for other options,
    # it is useful to adjust the plot ex-post, e.g.:
    plot(vx, vy1, label="line 1")
    plot!(vx, vy2, label="line 2")
    plot!(vx, vy3, label="line 3")
    plot!(legend = :bottom, foreground_color_legend = nothing, background_color_legend = nothing)



    # Of course, all options discussed above (labels, axis-appearance, ...)
    # are applicable no matter how many lines we plot.

    # Thereby, we can adjust the appearance of each line separately; e.g.
    plot(vx, vy1, label="line 1", line = (:blue, 1, 2, :solid))
    plot!(vx, vy2, label="line 2", line = (:blue, 1, 2, :dash))
    plot!(vx, vy3, label="line 3", line = (:blue, 1, 2, :dashdot))

    # It's useful to create linetypes and/or colors ex-ante
    # (to more easily adjust them later):
    vMyColors       = [cgrad(:blues)[xx/3] for xx in 1:3]
    plot(vx, vy1, label="line 1", line = (vMyColors[1], 1, 2, :solid))
    plot!(vx, vy2, label="line 2", line = (vMyColors[2], 1, 2, :solid))
    plot!(vx, vy3, label="line 3", line = (vMyColors[3], 1, 2, :solid))


    # Along these lines, we can also create a multiple-line-plot in a loop:

    # First, create all necessary ingredients:
    mY              = [vy1 vy2 vy3]
    vMyLineTypes    = [:solid, :solid, :solid]
    vMyColors       = [cgrad(:blues)[xx/3] for xx in 1:3]
    vsMyLineLabs    = string.("line ",1:3)

    # Then, create empty plot:
    plot2 = plot([0,0],[NaN,NaN],label="", grid=false,
                            titlefont=font(myFS), xtickfont=font(myFS), ytickfont=font(myFS), 
                            xguidefontsize=myFS, yguidefontsize=myFS,
                            legend = :bottom, 
                            background_color_legend = nothing, 
                            foreground_color_legend = nothing,
                            legendfontsize=myFS)

    # Thend, add line-by-line to this empty plot in for-loop:
    for ii = 1:3
        plot!(vx, mY[:,ii], label=vsMyLineLabs[ii], line = (vMyColors[ii], 1, 2, vMyLineTypes[ii]))                           
    end

    # Finally, show resulting plot:
    display(plot2)



    # The empty plot also provides a way 
    # to save options that we want to apply to several plots 
    # without having to type them for every plot anew:

    # Create function that returns the empty plot with specified options:
    fMyEmptyPlot() = plot([0,0],[NaN,NaN],label="", grid=false,
                            titlefont=font(myFS), xtickfont=font(myFS), ytickfont=font(myFS), 
                            xguidefontsize=myFS, yguidefontsize=myFS)

    # Create two plots that both use these options:
    plotA = fMyEmptyPlot()
    plot!(vx,vy1, label="", line=(:black,1,2,:solid))    

    plotB = fMyEmptyPlot()
    plot!(vx,vy2, label="", line=(:black,1,2,:solid))   



# --- Multiple Vectors (Scatter-Plot) -------------------------------------------

    
    # Above, we plotted one or several vectors (vy, vz, vy1, ...) against another vector (vx).
    # Using the command plot() (or plot!()), we obtained a line-plot, 
    # i.e. a plot where the values of each plotted vector are connected by a line.
    # To obtain a scatter plot, we just use the command scatter() instead of plot().

    # For example:

    scatter(vx, vy1, label="set of values 1")
    scatter!(vx, vy2, label="set of values 2")
    scatter!(vx, vy3, label="set of values 3")

    # Note that can mix scatter (points) and lines:

    scatter(vx, vy1, label="set of values")
    plot!(vx, vy2, label="line")


    # More sensible scatter-plot-example:

    vx = [2, 3, 6, 7, 9, 14]
    vy = [9, 8, 8, 4, -2, 1]
    scatter(vx, vy, label="")



    # All of the options discussed above are applicable (labels, axis-appearance, legend, ...),
    # except of course the ones regarding line-appearance.
    # e.g.
    scatter(vx, vy, label="", ylims=(-3,10),xlims=(0,15))
    scatter(vx, vy, label="", title="my amazing scatter-plot", xlabel="one set of values", ylabel="another set of values")


    # Instead of adjusting the appearance of lines, 
    # we can adjust the appearance of markers: e.g.
    scatter(vx, vy, label="", marker=(:circ, :red), markersize=5, markerstrokewidth=4)
    # To see list of supported marker-types:
    Plots.supported_markers()


    # Label points:

    vsPointLabs = ["CHE", "AUT", "AUS", "SRB", "HRV", "BRA"]
    scatter(vx, vy, label="", series_annotations = text.(vsPointLabs, :left, :bottom))

    # For non-overlapping scatter-labels, 
    # see post by user "cbsteh" on stackoverflow:
    # https://stackoverflow.com/questions/74355327/how-to-add-text-labels-to-a-scatterplot

    

# --- Histogram -----------------------------------------------------------------


    vData       = rand(Normal(0,1),1000)
    vData2      = rand(Normal(2,2),1000)

    vDataVals3  = [2, 3, 7]
    vWeights    = [0.3, 0.6, 0.1]


    # Histogram with absolute frequency on y-axis:
    histogram(vData)
    
    # Histogram with relative frequency on y-axis:
    histogram(vData, normalize=:pdf)

    # Histogram for set of values with respective relative frequency (weights):
    histogram(vDataVals3, weights=vWeights)


    # Specify bin-borders: (for n bins, need n+1 values!)
    histogram(vDataVals3, weights=vWeights, bins=collect(1:1:8)) 
    # Typically need to edit ticks and tick-labels as well, then:
    minBinVal   = -4
    maxBinVal   = 4
    binWidth    = 0.25
    tickStep    = 2
    histogram(vData, bins=collect((minBinVal-binWidth):binWidth:(maxBinVal+binWidth)), 
                        xlims=((minBinVal-binWidth),(maxBinVal+binWidth)), 
                        xticks=collect(minBinVal:tickStep:maxBinVal)) 


    # Edit bin appearance:
    myBlue      = cgrad(:blues)[1.0]
    myLightBlue = cgrad(:blues)[0.5]
    histogram(vData, linecolor=myBlue, fillcolor=myLightBlue, fillalpha=0.8)


    # Drop label:
    histogram(vData, label="") # or:
    histogram(vData, legend=:none)


    # Can also plot several histograms in single plot:
    myBlue     = cgrad(:blues)[1.0]
    myRed      = cgrad(:reds)[1.0]
    histogram(vData, linecolor=myBlue, fillcolor=myBlue, fillalpha=0.5)
    histogram!(vData2, linecolor=myRed, fillcolor=myRed, fillalpha=0.5)
    # Note that need to have both sets of bins quite transparent,
    # otherwise latter histogram will completely cover parts of former.



# --- Other Plot Types ----------------------------------------------------------


    # Kernel-density plot:

    using StatsBase

    vData       = rand(Normal(0,1),1000)

    density(vData) 
    density(vData, bandwidth = 0.1) # under-smoothing
    density(vData, bandwidth = 10)  # over-smoothing

    # Combine histogram, Kernel density-estimate and true density:
    histogram(vData, normalize=:pdf, fillcolor=:black, fillalpha=0.2, label="Histogram of draws")
    density!(vData, label="Kernel density estimate", line = (:black, 1, 2, :solid)) 
    plot!(Normal(0,1), label="True density", line = (:red, 1, 2, :solid))

    # Note that we can also estimate and then plot the kernel density
    # using the package KernelDensity discussed further below.



    # Bar-plot:

    vy = [2, 3, 6, 7, 9, 14]
    vx = collect(range(start=2, step=2, length=length(vy)))

    bar(vy) # as with plot(), x-axis defaults to 1:1:length(vy)

    bar(vx,vy)
    # adjust ticks:
    bar(vx,vy, label="", xticks=(vx,string.(vx)))



    # Grouped bar-plot:

    mY          = [2 6 3; 7 9 14]
    vsGroupLabs = ["a" "b" "c"]
    println(mY)
    

    groupedbar(mY)

    # Edit labels:    
    groupedbar(mY, label=vsGroupLabs)

    groupedbar(mY, label=vsGroupLabs, bar_position = :stack)
    # default is :dodge, as above

    # Regardless of type, first set of bars is centered at x=1, second at x=2, etc.

    # Change width of each set of bars:
    groupedbar(mY, label=vsGroupLabs, bar_width=0.3)
    groupedbar(mY, label=vsGroupLabs, bar_width=1.0)

    # Change colors:
    groupedbar(mY, label=vsGroupLabs, color = [:red :green :blue])



    # Pie-plot:

    vy      = [2, 3, 7]
    vsLabs  = ["a", "b", "c"]

    pie(vy) # group-labels default to 1:1:length(vy) (they are like x-axis here)

    # Edit labels:
    pie(vsLabs, vy)



    # 3d-plot:

    vx              = collect(-5:0.01:5)
    vy              = collect(-3:0.01:3)

    myDist          = MvNormal([2,0],[1 0.3; 0.3 0.8])
    fMyPDF(x,y)     = pdf(myDist,[x,y])
    mz              = [fMyPDF(x,y) for x in vx, y in vy]


    # Surface:
    plot(vx, vy, mz', st=:surface)

    # Contour:
    plot(vx, vy, mz', st=:contour)

    # Heatmap:
    heatmap(vx, vy, mz')


    # Sidenote: can also supply function:
    plot(vx, vy, fMyPDF, st=:surface)
    plot(vx, vy, fMyPDF, st=:contour)
    heatmap(vx, vy, fMyPDF)

    
    # Again, lots of options from above (labels, axis-appearance, etc.) are applicable,
    # whereby we have three axes here.

    # Can change color by supplying color-gradient:

    plot(vx, vy, mz', st=:surface, color=:reds)
    plot(vx, vy, mz', st=:contour, color=:reds)
    heatmap(vx, vy, mz', color=:reds)

    # Own color gradient:
    myColGr = cgrad([:red,:blue])
    plot(vx, vy, mz', st=:surface, color=myColGr)
    plot(vx, vy, mz', st=:contour, color=myColGr)
    heatmap(vx, vy, mz', color=myColGr)

    # To remove color-bar on the right:
    plot(vx, vy, mz', st=:surface, color=:reds, colorbar = false)
    

    # In surface-plot, can also edit camera-angle:
    
    plot(vx, vy, mz', st=:surface, camera=(60,30))



# --- Combine Multiple Plots into Single Figure ---------------------------------


    vx  = collect(-2:0.1:2)
    vy1 = vx.^2
    vy2 = vx.^3
    vy3 = vx.^4
    vy4 = vx.^5

    plot1 = plot(vx, vy1, line = (:black, 1, 2, :solid))
    plot2 = plot(vx, vy2, line = (:black, 1, 2, :solid))
    plot3 = plot(vx, vy3, line = (:black, 1, 2, :solid))
    plot4 = plot(vx, vy4, line = (:black, 1, 2, :solid))


    plot(plot1, plot2, layout=(1,2))

    # Delete legend in each plot:
    plot(plot1, plot2, layout=(1,2), legend=false)

    # Can also adjust other options (for each plot): e.g.
    plot(plot1, plot2, layout=(1,2), grid=false)
    plot(plot1, plot2, layout=(1,2), ylims=(-5,5))


    # Can also save multiple plots to single vector ...:
    vPlots = Vector{Any}(undef,4)
    vPlots[1] = plot1
    vPlots[2] = plot2
    vPlots[3] = plot3
    vPlots[4] = plot4
    # ... and then combine several plots from this vector:
    plot(vPlots..., layout=(2,2))
    plot(vPlots[1:2]..., layout=(1,2))


    # Note that we fill plots row-by-row;
    plot(vPlots..., layout=(2,2))

    # To fill plots column-by-column:
    nr = 2
    nc = 2
    mA = reshape(1:nr*nc,nr,nc) # this is how I want the plots to be ordered
    mAt = mA' # this is how Julia does it by default
    plot(vPlots[vec(mAt)]..., layout=(nr,nc))



    # Add overarching title to 1x2-plot:

    myLayout = @layout [a{.1h};grid(1,2)]
    plot(
       plot(annotation=(0.5,0.5, "My amazing title"), framestyle = :none),
       plot1, plot2,
       layout = myLayout)



# -------------------------------------------------------------------------------
# 14 FURTHER
# -------------------------------------------------------------------------------


    # Let's install the new packages needed in this section:
    vPkgs = ["Roots",
            "Optim",
            "NLsolve",
            "Zygote",
            "Statistics",
            "QuadGK",
            "Interpolations",
            "Polynomials",
            "Symbolics",
            "KernelDensity"]
    Pkg.add.(vPkgs)



# --- Error Handling ------------------------------------------------------------


    # Some operations return an error. 
    # e.g.
    sqrt(-2)
    # or
    sPathMain            = "/files/Julia/TutorialCodecollection/" # (insert your own path here)
    sPathOutput          = sPathMain * "/Output/"
    mkdir(sPathOutput) # since/if folder already exists

    # In most cases, you need to pay attention to errors (remedy them).
    # In some cases, however, you can safely ignore them.

    # To let your code continue despite an error, 
    # wrap it in a try-catch-end environment:
    # e.g.
    try
        mkdir(sPathOutput)
    catch 
        println("Folder already created; code continues")
    end
    # It is essentially a conditional, 
    # where the code in-between catch and end is executed if 
    # the code in-between try and catch gives an error.


    # You can also define your own error messages (e.g. in own functions).

    function fMyFun(x) 
        x >= 0 ? exp(-x) : throw("argument must be non-negative")
    end

    fMyFun(1)
    fMyFun(-1)



# --- Timing --------------------------------------------------------------------


    # Sometimes, we want to know the time it takes to execute some code,
    # e.g. to find the fastest of several possible approaches,
    # or even just to report the execution time of some algorithm.

    # To print the time needed to execute some code,
    # type @time in front of it: e.g.

    va = rand(10000)

    @time mapreduce(log,+,va)
    
    @time sum(log.(va))

    # Note how the first time a code is executed, 
    # it (typically) takes longer than in subsequent tries.
    # The reason is Julia's "compiling"; 
    # it optimizes its computations after the first run
    # (Julia uses "just-in-time compiling").


    # To store the time, type @elapsed:

    timeMR = @elapsed mapreduce(log,+,va)
    timeSL = @elapsed sum(log.(va))

    println(" Time Map Reduce (s) : ", timeMR)
    println(" Time Manual (s)     : ", timeSL)
    println(" Change (in %)       : ", 100*(timeSL/timeMR-1))


    # To find out the time needed for several lines of code,
    # wrap the code in a begin-end-environment (compound expression),
    # and type @time or @elapsed in front of it.


    # To find out the current time (in seconds)
    # (elapsed since the first second of 1970, I think):
    time()

    # This is useful to time some longer chunk of code (e.g. a whole algorithm):

    timeBefore = time()
    # ... do your thing ...
    timeAfter = time()
    
    timeNeeded = timeAfter - timeBefore
    
    println(" Algorithm needed ", timeNeeded, " seconds to complete")
    
    
    # We can also let Julia do nothing for a while:
    # e.g. for 2 seconds:
    sleep(2) 
    


# --- Optimization --------------------------------------------------------------


    # Suppose we want to minimize the following functions: 

    fToOpt1(x) = 4 * x^2

    fToOpt2(vx) = 500 + ( (vx[1]-3)^2 + 10 ) * ( 35 +  (vx[2]-2)^4 )



    # For simple functions with scalar argument:

    xInit = 5.0

    using Roots

    find_zero(fToOpt1, xInit) # not very precise...
    find_zero(fToOpt1, xInit, verbose=false)
    find_zero(fToOpt1, xInit, verbose=false, maxiters=100, xtol=1e-50, atol=1e-50) # better

    # Setting verbose=true gives you the a list of all points the algorithm tried. Try it!

    # Can store optimizer:
    xSol = find_zero(fToOpt1, xInit, verbose=false, maxiters=100, xtol=1e-50, atol=1e-50) 


    using Optim

    xLower = -10.0
    xUpper = 10.0

    res1 = optimize(fToOpt1, xLower, xUpper, GoldenSection())

    Optim.minimum(res1)
    Optim.minimizer(res1)


    # Can use "Optim" also for more complicated functions and/or functions with vector-argument:

    vxInit = [-1.0, -1.0]

    res2 = optimize(fToOpt2, vxInit)

    Optim.minimum(res2)
    Optim.minimizer(res2)

    # Can supply options:

    myOptions = Optim.Options(iterations = 1000, time_limit=60*60*10, show_trace=true, show_every=10)

    optimize(fToOpt2, vxInit, myOptions)


    # NelderMead() is the default algorithm used by optimize().
    # Other algorithms available (some of which require gradient) 
    # SimulatedAnnealing(),
    # ParticleSwarm(), 
    # BFGS(), 
    # LBFGS(), 
    # GradientDescent(), 
    # ConjugateGradient().

    # e.g.
    res2b = optimize(fToOpt2, vxInit, SimulatedAnnealing())

    Optim.minimum(res2b)
    Optim.minimizer(res2b)

    # Optimization is a rather tricky business.
    # Typically, one has to play around with the algorithms and options
    # in order to find a suitable solution.
    # Thereby, it's oftentimes hard to judge what is suitable, 
    # since the algorithm (as here) will give not very precise results
    # and we sometimes don't even know the exact solution (but only have a rough idea).
    # It's a good idea to first try out the optimizer in a case where the solution is known.



    # Some algorithms support bounds;
    # e.g. the Simulated Annealing algorithm with bounds:

    vxLower = [-5.0, -5.0]
    vxUpper = [5.0, 5.0]

    res2c = Optim.optimize(fToOpt2, vxLower, vxUpper, vxInit, SAMIN())

    Optim.minimum(res2c)
    Optim.minimizer(res2c)

    
    # Alternatively, one can enforce bounds "manually",
    # by adding a conditional to the function to optimize
    # and return an extremely high value as soon as the bounds are violated.



    # We get more preicse results if we can supply gradient and/or Hessian:

    fToOpt2(vx) = 500 + ( (vx[1]-3)^2 + 10 ) * ( 35 +  (vx[2]-2)^4 )

    function fun_grad!(g, vx)
        g[1] = 2 * (vx[1]-3) * ( 35 +  (vx[2]-2)^4 )
        g[2] = 4 * (vx[2]-2) * ( (vx[1]-3)^2 + 10 )
    end

    function fun_hess!(h, vx)
        h[1, 1] = 2 * ( 35 +  (vx[2]-2)^4 )
        h[1, 2] = 2 * 4 * (vx[1]-3) * (vx[2]-2)
        h[2, 1] = 2 * 4 * (vx[1]-3) * (vx[2]-2)
        h[2, 2] = 4 * ( (vx[1]-3)^2 + 10 )
    end

    df = TwiceDifferentiable(fToOpt2, fun_grad!,  fun_hess!, vxInit)

    res2d = optimize(df, vxInit)

    Optim.minimum(res2d)
    Optim.minimizer(res2d)

    # Now the algorithm defaults to Newton's method.


    # Supply bounds as well:

    dfc = TwiceDifferentiableConstraints(vxLower, vxUpper)

    res2e = optimize(df, dfc, vxInit, IPNewton(), myOptions)

    Optim.minimum(res2e)
    Optim.minimizer(res2e)


    # For more information on the Optim package,
    # see https://julianlsolvers.github.io/Optim.jl/stable/.



# --- Solving Systems of Non-Linear Equations -----------------------------------


    # Suppose we want to solve the following system of equations 
    # (the equations are solved for zero):

    function fToSolve(vx) 
        
        F[1] =  (vx[1]-3)^2 * ( 35 +  (vx[2]-2)^4 )
        F[2] = (vx[2]-2) * 530

    end


    # One can, in principle solve a system of equations by
    # minimizing the sum of squared deviations of the equations from zero.

    # However, often, using the outright system-of-equations-solver provided by
    # the package NLsolve is a better idea:

    using NLsolve

    function fToSolve!(F,vx) 
        
        F[1] =  (vx[1]-3)^2 * ( 35 +  (vx[2]-2)^4 )
        F[2] = (vx[2]-2) * 530

    end

    vxGuess = [-1.0, -1.0]

    res1 = nlsolve(fToSolve!, vxGuess)

    res1.zero


    # For more complex systems of equations, 
    # it is a good idea to supply the Jacobian:

    function fJacobian!(J, vx)
        J[1, 1] = 2 * (vx[1]-3) * ( 35 +  (vx[2]-2)^4 )
        J[1, 2] = (vx[1]-3)^2 * 4 * (vx[2]-2)
        J[2, 1] = 0
        J[2, 2] = 530
    end

    res2 = nlsolve(fToSolve!, fJacobian!, vxGuess)

    res2.zero



# --- Differentiation -----------------------------------------------------------


    fToOpt1(x) = 4 * x^2

    fToOpt2(vx) = 500 + ( (vx[1]-3)^2 + 10 ) * ( 35 +  (vx[2]-2)^4 )


    # To find out the gradient of existing functions, such as the above two,
    # we can manually code routines that perform numeric or complex differentiation.

    # We can also use the package Zygote to compute gradients for us:

    using Zygote


    # Evaluate gradient of fToOpt1 at x=5.0:
    gradient(fToOpt1, 5.0)[1]

    # Create a function that does that:
    fMyGradient(x) = gradient(fToOpt1, x)[1]

    vx = -2:0.01:2
    plot(vx,fToOpt1, label="f(x)")
    plot!(vx,fMyGradient, label="f'(x)")


    # Evaluate gradient of fToOpt2 at x=[5.0, 5.0]:
    gradient(fToOpt2, [5.0, 5.0])[1]

    # Create a function that does that:
    fMyGradient2(vx) = gradient(fToOpt2, vx)[1]

    fMyGradient2([5.0, 5.0]) # gives same as above

    fMyGradient2([3.0, 2.0]) # gives zero



# --- Integration ---------------------------------------------------------------


    fToOpt1(x) = 4 * x^2

    fToOpt2(vx) = 500 + ( (vx[1]-3)^2 + 10 ) * ( 35 +  (vx[2]-2)^4 )
    

    # To integrate functions such as the above two,
    # one option is to manually code routines 
    # that perform integration by simulation:

    using Distributions
    using Statistics

    # Function with scalar argument:
    # e.g. integrate fToOpt1(x) over x ∈ [0,2]:

    resultIntBySim = mean( 2 * [ fToOpt1(rand(Uniform(0,2))) for xx = 1:10000 ] )

    println("Integration by simulation: area under curve = ", resultIntBySim)

    # Function with vector argument:
    # e.g. integrate above fToOpt2([x,y]) over x ∈ [0,2] and y ∈ [0,3]:

    mean( 2*3 * [ fToOpt2([rand(Uniform(0,2)),rand(Uniform(0,3))]) for xx = 1:10000 ] )


    # For functions with scalar argument, 
    # one can also perform efficient numerical integration 
    # using the package QuadGK:
    
    using QuadGK    

    resultIntByNum, err = quadgk(fToOpt1, 0, 2)

    println("Numerical integration:     area under curve = ", resultIntByNum)



# --- Interpolation -------------------------------------------------------------


    fToOpt1(x) = 4 * x^2

    fToOpt2(vx) = 500 + ( (vx[1]-3)^2 + 10 ) * ( 35 +  (vx[2]-2)^4 )


    # Suppose we know the values of fToOpt1 evaluated at x=0, x=0.5 and x=1.2:

    vx = [0, 0.5, 1.2]
    vF = fToOpt1.(vx)


    # To obtain a function that interpolates between these three values, 
    # we can use the package Interpolations:

    using Interpolations

    fToOpt1_itp = LinearInterpolation(vx,vF)

    vxAxis = 0:0.01:1.2
    plot(vxAxis, fToOpt1.(vxAxis), label="true function")
    plot!(vxAxis, fToOpt1_itp.(vxAxis), label="linearly interpolated function")

    # Note that fToOpt1_itp returns an error when called outside o x ∈ [0,1.2]:
    fToOpt1_itp(1.5)

    # To allow for extrapolation:

    fToOpt1_itp2 = LinearInterpolation(vx,vF, extrapolation_bc=Line())

    vxAxis = 0:0.01:2
    plot(vxAxis, fToOpt1.(vxAxis), label="true function")
    plot!(vxAxis, fToOpt1_itp2.(vxAxis), label="linearly interpolated function")



    # Interpolation along multiple dimensions:

    vx = [0, 0.5, 1.2]
    vy = [0, 0.3, 0.9]

    mF = [fToOpt2([x,y]) for x in vx, y in vy]

    fToOpt2_itp = LinearInterpolation((vx,vy),mF)



# --- Polynomials ---------------------------------------------------------------


    # To work efficiently with polynomials, we can use the package "Polynomials":

    using Polynomials

    pol1 = Polynomial([1,2,-3])
    pol2 = Polynomial([0,2,0,2])

    println(pol1)
    println(pol2)
    

    # Given two polynomials, we can easily compute their sum...:

    println("sum = ", pol1 + pol2)

    # ... or their product:

    println("product = ", pol1 * pol2)



# --- Symbolic Calculus ---------------------------------------------------------


    using Symbolics 


    # Define variables:
    @variables x y 

    # Define expression (equation):
    expr = x + y + 2*x + 3*x*y^2


    # !! The following three do not work anymore as they should; 
    #    https://docs.sciml.ai/Symbolics/dev/manual/expression_manipulation/ !!

    # Get terms in expresion:
    terms(expr)

    # Get factors in first term in expression:
    factors(terms(expr)[1])

    # Find out variables involved in expression:
    Symbolics.get_variables(expr; sort = true) # to sort by abc


    # Find out degree of expression (if it's polynomial):
    Symbolics.degree(expr)

    # Find out factor multiplying x:
    Symbolics.coeff(expr, x)
    # or y^2:
    Symbolics.coeff(expr, y^2)


    # Evaluate expression:
    substitute(expr, Dict(x => 1, y => 2))

    # Can also substitute variables by other expressions: e.g.
    substitute(expr, Dict(y => x^2))



    # We can use symbolic math to compute derivatives of a function:
    # e.g. get derivative of expr w.r.t. x:

    D       = Differential(x)

    expand_derivatives(D(expr))


    # Get derivative of expr w.r.t. both x and y, combined to 2x1 vector:

    D       = Differential.([x,y])

    vExpr   = [expr]

    expand_derivatives.(collect(Symbolics.@arrayop (i,1) D[i](vExpr[1])))


    # Get derivative of vector valued expression:

    vExpr = [x + y + 2*x + 3*x*y^2, sin(x) - y, sqrt(x) + x*exp(y)]

    expand_derivatives.(collect(Symbolics.@arrayop (i,j) D[j](vExpr[i])))



    # There are more things that the package Symbolics can do,
    # incl. e.g. simplifying expressions and defining vectors and matrices as variables.
    # See https://symbolics.juliasymbolics.org/stable/.



# --- Markdown-Integration ------------------------------------------------------


    # We have two options to combine Julia code with markdown text:

    # 1. use a Jupyter notebook (separate installation needed)
    # This gives a .ipynb-file that can be published as .html or .pdf.

    # 2. use package "Weave".
    # This gives a .jmd-file that can be published as .html (or .pdf, allegedly).
    # See https://github.com/markomlikota/CodingSoftware/ for a template-.jmd-file.

    # Note that, in order for plots to show in the resulting document,
    # you need to display them, by typing e.g. "display(plot1)"



# --- Further Useful Packages ---------------------------------------------------


    # Random strings:

    using Random 

    # Get random string of three characters:
    randstring(3) 



    # Kernel density estimation:

    using KernelDensity

    vData = rand(Normal(0,2),1000)

    k = kde(vData)  # supports also weights
    k.x
    k.density
    plot(k.x,k.density)


    
    using SmolyakApprox 
    # functions to perform Smolyak Algorithm
    # (useful for globally solving smaller DSGE models)


    using StatsFuns                 
    # Contains further distributions and functions useful for statistics
    # that are not in "Distributions" or "Statistics" or "StatsBase",
    # such as the multivariate Gamma distribution (function "logmvgamma()")


    using PythonCall
    using PyCall
    # Allow you to call python functions in Julia.



# -------------------------------------------------------------------------------
# 15 CODING ADVICE
# -------------------------------------------------------------------------------


    # ...
    # ...
    # ...



    # As discussed above, Julia is a just-in-time-compiler;
    # the first time a code is run, it optimizes its computations 
    # so that the code is executed faster in subsequent calls
    # (this holds for codes that are literally executed several times,
    # but also for loops and similarly "repetitive" codes.)

    # You can help Julia optimize the code in several ways.


    # Constants and Global vs Local Variables

    # Declare variables whose value will not change
    # during the current Julia-session as constants: 
    # e.g.
    const δ = 5 
    # One can, in principle, redefine a constant, 
    # but you are advised not to do so:
    δ = 3

    # Avoid global variables.
    # Often you can avoid defining an object as global 
    # by letting functions use this object as an argument. 


    # Type-Stability

    # Avoid changing the type of a variable;
    # e.g. given
    x = 1.5
    # redefine x as 
    x = 2.0
    # rather than 
    x = 2
    
    # Let your functions' output be always of the same type,
    # regardless of the type of the input supplied to them.
    # e.g. write
    fMyFun(x) = 2.0 * x
    # rather than
    fMyFun(x) = 2 * x
    # (Former always returns float, 
    # while latter returns output of same type as x.) 

    # Ideally, also let your functions always take inputs of the same type,
    # though this is, apparently, less important.
    # e.g. write
    fMyFun(x::Float64) = 2.0 * x
    # and call 
    fMyFun(2.0)
    # or 
    fMyFun(Float64(2))
    # rather than letting, as above, fMyFun(x) take x of any type.


    # Pre-allocate outputs:
    # e.g. instead of creating an object (e.g. a matrix) every time anew (say in a loop),
    # create it once (e.g. before the loop) and then just fill it up with different values.
    # This optimizes your code in general, 
    # and even more so if the object stays of the same, specific type.
    

    # Use @. in functions that perform vectorized operations on long vectors:
    # e.g. this
    fMyFun1(x) = @. 3x^2 + 4x^3 + 4
    # is faster than this
    fMyFun2(x) = 3x.^2 + 4x.^3 .+ 4

    vx = rand(10000)
    @time fMyFun1(vx)
    @time fMyFun2(vx)


    # Consider using @views when accessing parts of a vector or a matrix.
    # When you use e.g. mA[1:50,41:70], this creates a copy of this "slice" of mA.
    # This is all right if you use this slice in several operations.
    # However, if you do only a few operations,
    # it is better to write "@views" in front of these operations,
    # which avoids storing a copy of the slice.
    # e.g. for
    mA = rand(100,100)
    # write 
    @views mA[1:50,41:70]
    # instead of
    mA[1:50,41:70]

    # compare time needed for these two methods of accessing:
    @time @views mA[1:50,41:70]
    @time mA[1:50,41:70];

    # e.g. when using the slice in a function:
    @time @views sum(mA[1:50,41:70])
    @time sum(mA[1:50,41:70]);

