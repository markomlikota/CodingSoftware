# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------



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

