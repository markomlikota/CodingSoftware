# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




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



