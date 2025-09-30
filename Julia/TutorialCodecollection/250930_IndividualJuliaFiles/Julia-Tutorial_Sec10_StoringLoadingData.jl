# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




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


