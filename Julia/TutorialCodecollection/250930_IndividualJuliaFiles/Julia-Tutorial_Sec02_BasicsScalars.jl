# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




# -------------------------------------------------------------------------------
# 2 BASICS & SCALARS
# -------------------------------------------------------------------------------


    # To start Julia on VS Code, you need to run some Julia-code 
    # or you need to type "julia" in the terminal.

    # To run a chunk of code, select it and press 'shift+enter' (Mac).
    # To run a whole .jl-file (script), 
    # click on the 'Play' button on the top-right of the script-window.

    # To close Julia, execute the command "exit()".


    # Comments are chunks of code (or text) that are ignored when running.
    # They start with a hashtag.  
    # To comment-out a line of code, select it and press 'cmd+/' (Mac)
    # (i.e. cmd+shift+7 for my Swiss keyboard).

    # To highlight a whole line, click 'cmd+l'.


    # To request help with a command, type a question mark followed by the command in the REPL: 
    # e.g. `'?sqrt' shows the help page for the command 'sqrt'.

    # If you indent a section of code, you can hide it by clicking on the last non-indented line.
    # To automatically hide all such sections, press 'cmd+k+0' (Mac).

    # You can see further keybindings for VS Code under 
    # https://www.julia-vscode.org/docs/stable/userguide/keybindings/.

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



