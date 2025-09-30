# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




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



