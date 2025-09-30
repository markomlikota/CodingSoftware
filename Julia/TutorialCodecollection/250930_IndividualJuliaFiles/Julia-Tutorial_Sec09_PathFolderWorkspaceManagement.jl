# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




# -------------------------------------------------------------------------------
# 9 PATH-, FOLDER- & WORKSPACE-MANAGEMENT
# -------------------------------------------------------------------------------


    # Look up present working directory:

    pwd()


    # Set up working directory:

    cd("/files/Julia/") # (insert your own path here)

    # It is a good idea to store the paths you frequently use:

    sPathMain            = "/files/Julia/TutorialCodecollection/" # (insert your own path here)
    sPathFunctions       = sPathMain * "Functions/"
    sPathOutput          = sPathMain * "/Output/"
    
    cd(sPathMain)
    
    # It's best practice to let all your paths end with a backslash, 
    # so that you can reference individual files or folders in them by just adding 
    # the corresponding filename.


    # List all folders/files in pwd:

    readdir()

    # Create new folder in present working directory:

    mkdir("mynewfolder")

    # Note: this returns error if folder already exists.
    # Hence, best wrap folder-creation in try-catch-environment:
    try
        mkdir("mynewfolder")
    catch
    end

    # Remove folder/file in present working directory:
    rm("mynewfolder")


    # It is a good idea to divide project into several files.
    # An external julia-file can then be called from the present script by typing e.g.

    include(sPathFunctions * "fMyAmazingFunction.jl") # this gives error, since no such file exists



