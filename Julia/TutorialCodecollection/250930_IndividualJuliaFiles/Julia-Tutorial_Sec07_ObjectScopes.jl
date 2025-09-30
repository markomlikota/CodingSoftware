# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




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



