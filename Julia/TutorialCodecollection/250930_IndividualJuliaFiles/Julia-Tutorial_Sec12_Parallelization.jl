# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




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


