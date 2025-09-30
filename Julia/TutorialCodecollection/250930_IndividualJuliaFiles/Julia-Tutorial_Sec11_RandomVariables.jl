# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




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




