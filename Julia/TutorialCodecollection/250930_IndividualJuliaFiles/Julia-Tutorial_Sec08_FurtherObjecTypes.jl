# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




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


