# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




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


