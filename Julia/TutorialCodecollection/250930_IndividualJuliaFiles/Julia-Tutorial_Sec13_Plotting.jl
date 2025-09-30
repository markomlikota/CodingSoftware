# Julia: Tutorial & Code-Collection

# Source: https://github.com/markomlikota/CodingSoftware

# MIT License, © Marko Mlikota, https://markomlikota.github.io



# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------




# -------------------------------------------------------------------------------
# 13 PLOTTING
# -------------------------------------------------------------------------------


    # Let's install the new packages needed in this section:
    vPkgs = ["Plots",
    "StatsPlots",
    "Measures"]
    Pkg.add.(vPkgs)


    sPathMain            = "/files/Julia/TutorialCodecollection/" # (insert your own path here)
    sPathOutput          = sPathMain * "/Output/"

    using Plots



# --- Single Vector (Line-Plot) & Basics ----------------------------------------


    vx              = collect(1:5:100)
    
    fMySquare(x)    = x^2
    vy              = fMySquare.(vx)

    using Distributions
    myDist          = Normal(25,8)
    vz              = pdf.(myDist,vx)



    # The very basics:

    # Plot single vector:
    plot(vy) # x-axis defaults to 1:1:length(vy)

    # Plot one vector against another:
    plot(vx, vy)

    # Can also plot directly function against x-axis: 
    plot(fMySquare, vx)

    # Can also plot a distribution against x-axis:
    using StatsPlots
    plot(myDist, vx)

    

    # Labels:

    # Edit line-label:
    plot(vx, vy, label="single label looks ugly")
    plot(vx, vy, label="")

    # Add title and axis-labels:
    plot(vx, vy, label="", title="An amazing plot", xlabel="xxx", ylabel="yyy")

    # Change their font size:
    myFS = 12
    plot(vx, vy, label="", title="An amazing plot", xlabel="xxx", ylabel="yyy", titlefont=font(myFS), xtickfont=font(myFS), ytickfont=font(myFS))

    # Can add latex-labels: e.g.:
    plot(vx, vy, label="", title="Plot of  \$ \\alpha(x) \$")
    # declare equation-start and -end by "\$", and use double-backslash instead of single backlash in front of latex-definitions
    

    # Appearance of line:

    plot(vx, vy, label="", line = (:black, 1, 2, :solid))
    
    # First number gives transparency, second gives thickness:
    plot(vx, vy, label="", line = (:black, 0.5, 2, :solid))
    plot(vx, vy, label="", line = (:black, 1, 5, :solid))

    # Linetype:
    plot(vx, vy, label="", line = (:black, 1, 2, :dash))
    plot(vx, vy, label="", line = (:black, 1, 2, :dot))
    plot(vx, vy, label="", line = (:black, 1, 2, :dashdot))
    plot(vx, vy, label="", line = (:black, 1, 2, :dashdotdot))
    # (Sidenote: can also type ":line" instead of ":solid".)

    # Color:
    plot(vx, vy, label="", line = (:blue, 1, 2, :solid))
    plot(vx, vy, label="", line = (:red, 1, 2, :solid))

    # Get nicer colors by using "colorschemes":
    cgrad(:blues) # color-palette as gradient; indexable by x ∈ [0.0, 1.0]
    palette(:Blues_9) # color-palette as vector; indexable x = 1, 2, ... (here: 9 elements) 
    # see https://docs.juliaplots.org/latest/generated/colorschemes/ for schemes available
    # Can also define own gradient/vector of colors: e.g. 
    myBlue  = cgrad(:blues)[1.0]
    myRed   = cgrad(:reds)[1.0]
    cgrad([myRed,myBlue]) # gradient
    vColors = range(start=myRed, stop=myBlue, length=10) # vector
    
    myBlue = cgrad(:blues)[1.0] # very nice blue
    plot(vx, vy, label="", line = (myBlue, 1, 2, :solid))


    # Appearance of axes:

    # Edit limits:
    plot(vx, vy, label="", xlims=(-20,150), ylims=(0,5000))
    # To just edit lower limit of e.g. x-axis: (analogously for upper limit and for y-axis)
    plot(vx, vy, label="", xlims=(-20,Inf))

    # Edit ticks: (e.g. x-ticks; analogously for y-ticks)
    myTicks         = [0,25,50,100,150]
    myTickLabs      = string.(myTicks)
    plot(vx, vy, label="", xlims=(-20,150), xticks=(myTicks,myTickLabs))
    # e.g. have tick-labels in multiples of 100:
    myTickLabs      = string.(myTicks./100)
    plot(vx, vy, label="", xlims=(-20,150), xticks=(myTicks,myTickLabs), xlabel="xxx [in 100s]")
    # Remove tick-label at 25, but leave tick-mark:
    myTickLabs[2] = ""
    plot(vx, vy, label="", xlims=(-20,150), xticks=(myTicks,myTickLabs))
    # Faster, but less flexible way to have tick-labels in multiples of 100:
    plot(vx, vy, label="", xlims=(-20,150), xformatter = x -> string(x/100), xlabel="xxx [in 100s]")

    # Change font size of ticks:
    plot(vx, vy, label="", title="An amazing plot", xlabel="xxx", ylabel="yyy", xguidefontsize=myFS, yguidefontsize=myFS)

    # Note: to plot dates, best convert to continuous number.
    # e.g. for quarterly data, use 1970.00, 1970.25, etc.


    # Ex-post changes of title, axis-labels, and axis-appearance

    # We can change everything that pertains to the plot as a whole
    # (and not just the single line we plotted) using plot!(...):
    plot(vx, vy, label="")
    # e.g. title and axis-labels:
    plot!(title="An amazing plot", xlabel="xxx", ylabel="yyy")
    # e.g. axis-limits:
    plot!(xlims=(-20,150), ylims=(0,5000))
    # e.g. axis-ticks:
    plot!(xticks=(myTicks,myTickLabs))

    # Sidenote: some of these can also be changed directly using e.g.
    # xlabel!("xxx") or ylims!((0,5000)),
    # but I find it easier to remember the approach above;
    # write plot!(...) and add the options you want 
    # in the same way as you would when you first create a plot.



    # Further options:

    plot(vx, vy, label="", grid=false) # remove grid in background

    vline!([0], label="") # add vertical line at x=0
    hline!([100], label="") # add horizontal line at y=100

    # Add text to plot:
    annotate!(5, 1000, text("note that curve goes below 100", :blue, :left, 10)) 

    xflip!(true) # flip x-axis
    
    # Edit margins:
    using Measures
    # e.g.:
    plot(vx, vy, label="", title="An amazing plot", topmargin=5mm) 

    # Add shaded area around line:
    # 1. same distance for all x: 
    plot(vx, vy, ribbon=(200,500), fillalpha=0.2, fillcolor=:blue)
    # 2. distinct distance across x, but same for top and bottom: ("symmetric bounds")
    vDist           = rand(Uniform(200,500),length(vy))
    plot(vx, vy, ribbon=vDist, fillalpha=0.2 , fillcolor=:blue)
    # 3. distinct distance across x and between top and bottom: ("asymmetric bounds")
    vDistBottom     = rand(Uniform(200,300),length(vy))
    vDistTop        = rand(Uniform(200,800),length(vy))
    plot(vx, vy, ribbon=(vDistBottom,vDistTop), fillalpha=0.2 , fillcolor=:blue)



    # Save the plot as file:

    plot(vx, vy, label="")
    savefig(sPathOutput * "plot1.png") 
    # "savefig" saves currently displayed plot (the one just created in line above)

    # Note that we can create the plot as an object...:
    plot1 = plot(vx, vy, label="")
    # ... and display it even after its creation:
    display(plot1)

    # This allows us to save it after it's been created:
    savefig(plot1, sPathOutput * "plot1.png") 



# --- Multiple Vectors (Line-Plot) ----------------------------------------------

    
    vx  = collect(-2:0.1:2)
    vy1 = vx.^2
    vy2 = vx.^3
    vy3 = vx.^4


    # To plot multiple lines, 
    # type plot() for first line, followed by plot!() for each subsequent one:
    plot(vx, vy1, label="line 1")
    plot!(vx, vy2, label="line 2")
    plot!(vx, vy3, label="line 3")

    # Again, we can save this plot as an object:
    myplot2 = plot(vx, vy1, label="line 1")
    plot!(vx, vy2, label="line 2")
    plot!(vx, vy3, label="line 3")



    # Edit legend:

    # Position:
    plot(vx, vy1, label="line 1", legend = :bottom)
    plot!(vx, vy2, label="line 2")
    plot!(vx, vy3, label="line 3")
    # The option "legend" specifies the position of the legend.
    # Can use :bottom, :top, :left, :right as well as :topright, :bottomleft, etc.,
    # and can also add "outer" in front (e.g. :outertopright) to put legend outside of plot area.

    # To remove the legend, add "legend = false".

    # To set color of legend frame to transparent:
    plot(vx, vy1, label="line 1", legend = :bottom, foreground_color_legend = nothing)
    # To set color of legend background to transparent:
    plot(vx, vy1, label="line 1", legend = :bottom, background_color_legend = nothing)

    # For the legend, even more so than for other options,
    # it is useful to adjust the plot ex-post, e.g.:
    plot(vx, vy1, label="line 1")
    plot!(vx, vy2, label="line 2")
    plot!(vx, vy3, label="line 3")
    plot!(legend = :bottom, foreground_color_legend = nothing, background_color_legend = nothing)



    # Of course, all options discussed above (labels, axis-appearance, ...)
    # are applicable no matter how many lines we plot.

    # Thereby, we can adjust the appearance of each line separately; e.g.
    plot(vx, vy1, label="line 1", line = (:blue, 1, 2, :solid))
    plot!(vx, vy2, label="line 2", line = (:blue, 1, 2, :dash))
    plot!(vx, vy3, label="line 3", line = (:blue, 1, 2, :dashdot))

    # It's useful to create linetypes and/or colors ex-ante
    # (to more easily adjust them later):
    vMyColors       = [cgrad(:blues)[xx/3] for xx in 1:3]
    plot(vx, vy1, label="line 1", line = (vMyColors[1], 1, 2, :solid))
    plot!(vx, vy2, label="line 2", line = (vMyColors[2], 1, 2, :solid))
    plot!(vx, vy3, label="line 3", line = (vMyColors[3], 1, 2, :solid))


    # Along these lines, we can also create a multiple-line-plot in a loop:

    # First, create all necessary ingredients:
    mY              = [vy1 vy2 vy3]
    vMyLineTypes    = [:solid, :solid, :solid]
    vMyColors       = [cgrad(:blues)[xx/3] for xx in 1:3]
    vsMyLineLabs    = string.("line ",1:3)

    # Then, create empty plot:
    plot2 = plot([0,0],[NaN,NaN],label="", grid=false,
                            titlefont=font(myFS), xtickfont=font(myFS), ytickfont=font(myFS), 
                            xguidefontsize=myFS, yguidefontsize=myFS,
                            legend = :bottom, 
                            background_color_legend = nothing, 
                            foreground_color_legend = nothing,
                            legendfontsize=myFS)

    # Thend, add line-by-line to this empty plot in for-loop:
    for ii = 1:3
        plot!(vx, mY[:,ii], label=vsMyLineLabs[ii], line = (vMyColors[ii], 1, 2, vMyLineTypes[ii]))                           
    end

    # Finally, show resulting plot:
    display(plot2)



    # The empty plot also provides a way 
    # to save options that we want to apply to several plots 
    # without having to type them for every plot anew:

    # Create function that returns the empty plot with specified options:
    fMyEmptyPlot() = plot([0,0],[NaN,NaN],label="", grid=false,
                            titlefont=font(myFS), xtickfont=font(myFS), ytickfont=font(myFS), 
                            xguidefontsize=myFS, yguidefontsize=myFS)

    # Create two plots that both use these options:
    plotA = fMyEmptyPlot()
    plot!(vx,vy1, label="", line=(:black,1,2,:solid))    

    plotB = fMyEmptyPlot()
    plot!(vx,vy2, label="", line=(:black,1,2,:solid))   



# --- Multiple Vectors (Scatter-Plot) -------------------------------------------

    
    # Above, we plotted one or several vectors (vy, vz, vy1, ...) against another vector (vx).
    # Using the command plot() (or plot!()), we obtained a line-plot, 
    # i.e. a plot where the values of each plotted vector are connected by a line.
    # To obtain a scatter plot, we just use the command scatter() instead of plot().

    # For example:

    scatter(vx, vy1, label="set of values 1")
    scatter!(vx, vy2, label="set of values 2")
    scatter!(vx, vy3, label="set of values 3")

    # Note that can mix scatter (points) and lines:

    scatter(vx, vy1, label="set of values")
    plot!(vx, vy2, label="line")


    # More sensible scatter-plot-example:

    vx = [2, 3, 6, 7, 9, 14]
    vy = [9, 8, 8, 4, -2, 1]
    scatter(vx, vy, label="")



    # All of the options discussed above are applicable (labels, axis-appearance, legend, ...),
    # except of course the ones regarding line-appearance.
    # e.g.
    scatter(vx, vy, label="", ylims=(-3,10),xlims=(0,15))
    scatter(vx, vy, label="", title="my amazing scatter-plot", xlabel="one set of values", ylabel="another set of values")


    # Instead of adjusting the appearance of lines, 
    # we can adjust the appearance of markers: e.g.
    scatter(vx, vy, label="", marker=(:circ, :red), markersize=5, markerstrokewidth=4)
    # To see list of supported marker-types:
    Plots.supported_markers()


    # Label points:

    vsPointLabs = ["CHE", "AUT", "AUS", "SRB", "HRV", "BRA"]
    scatter(vx, vy, label="", series_annotations = text.(vsPointLabs, :left, :bottom))

    # For non-overlapping scatter-labels, 
    # see post by user "cbsteh" on stackoverflow:
    # https://stackoverflow.com/questions/74355327/how-to-add-text-labels-to-a-scatterplot

    

# --- Histogram -----------------------------------------------------------------


    vData       = rand(Normal(0,1),1000)
    vData2      = rand(Normal(2,2),1000)

    vDataVals3  = [2, 3, 7]
    vWeights    = [0.3, 0.6, 0.1]


    # Histogram with absolute frequency on y-axis:
    histogram(vData)
    
    # Histogram with relative frequency on y-axis:
    histogram(vData, normalize=:pdf)

    # Histogram for set of values with respective relative frequency (weights):
    histogram(vDataVals3, weights=vWeights)


    # Specify bin-borders: (for n bins, need n+1 values!)
    histogram(vDataVals3, weights=vWeights, bins=collect(1:1:8)) 
    # Typically need to edit ticks and tick-labels as well, then:
    minBinVal   = -4
    maxBinVal   = 4
    binWidth    = 0.25
    tickStep    = 2
    histogram(vData, bins=collect((minBinVal-binWidth):binWidth:(maxBinVal+binWidth)), 
                        xlims=((minBinVal-binWidth),(maxBinVal+binWidth)), 
                        xticks=collect(minBinVal:tickStep:maxBinVal)) 


    # Edit bin appearance:
    myBlue      = cgrad(:blues)[1.0]
    myLightBlue = cgrad(:blues)[0.5]
    histogram(vData, linecolor=myBlue, fillcolor=myLightBlue, fillalpha=0.8)


    # Drop label:
    histogram(vData, label="") # or:
    histogram(vData, legend=:none)


    # Can also plot several histograms in single plot:
    myBlue     = cgrad(:blues)[1.0]
    myRed      = cgrad(:reds)[1.0]
    histogram(vData, linecolor=myBlue, fillcolor=myBlue, fillalpha=0.5)
    histogram!(vData2, linecolor=myRed, fillcolor=myRed, fillalpha=0.5)
    # Note that need to have both sets of bins quite transparent,
    # otherwise latter histogram will completely cover parts of former.



# --- Other Plot Types ----------------------------------------------------------


    # Kernel-density plot:

    using StatsBase

    vData       = rand(Normal(0,1),1000)

    density(vData) 
    density(vData, bandwidth = 0.1) # under-smoothing
    density(vData, bandwidth = 10)  # over-smoothing

    # Combine histogram, Kernel density-estimate and true density:
    histogram(vData, normalize=:pdf, fillcolor=:black, fillalpha=0.2, label="Histogram of draws")
    density!(vData, label="Kernel density estimate", line = (:black, 1, 2, :solid)) 
    plot!(Normal(0,1), label="True density", line = (:red, 1, 2, :solid))

    # Note that we can also estimate and then plot the kernel density
    # using the package KernelDensity discussed further below.



    # Bar-plot:

    vy = [2, 3, 6, 7, 9, 14]
    vx = collect(range(start=2, step=2, length=length(vy)))

    bar(vy) # as with plot(), x-axis defaults to 1:1:length(vy)

    bar(vx,vy)
    # adjust ticks:
    bar(vx,vy, label="", xticks=(vx,string.(vx)))



    # Grouped bar-plot:

    mY          = [2 6 3; 7 9 14]
    vsGroupLabs = ["a" "b" "c"]
    println(mY)
    

    groupedbar(mY)

    # Edit labels:    
    groupedbar(mY, label=vsGroupLabs)

    groupedbar(mY, label=vsGroupLabs, bar_position = :stack)
    # default is :dodge, as above

    # Regardless of type, first set of bars is centered at x=1, second at x=2, etc.

    # Change width of each set of bars:
    groupedbar(mY, label=vsGroupLabs, bar_width=0.3)
    groupedbar(mY, label=vsGroupLabs, bar_width=1.0)

    # Change colors:
    groupedbar(mY, label=vsGroupLabs, color = [:red :green :blue])



    # Pie-plot:

    vy      = [2, 3, 7]
    vsLabs  = ["a", "b", "c"]

    pie(vy) # group-labels default to 1:1:length(vy) (they are like x-axis here)

    # Edit labels:
    pie(vsLabs, vy)



    # 3d-plot:

    vx              = collect(-5:0.01:5)
    vy              = collect(-3:0.01:3)

    myDist          = MvNormal([2,0],[1 0.3; 0.3 0.8])
    fMyPDF(x,y)     = pdf(myDist,[x,y])
    mz              = [fMyPDF(x,y) for x in vx, y in vy]


    # Surface:
    plot(vx, vy, mz', st=:surface)

    # Contour:
    plot(vx, vy, mz', st=:contour)

    # Heatmap:
    heatmap(vx, vy, mz')


    # Sidenote: can also supply function:
    plot(vx, vy, fMyPDF, st=:surface)
    plot(vx, vy, fMyPDF, st=:contour)
    heatmap(vx, vy, fMyPDF)

    
    # Again, lots of options from above (labels, axis-appearance, etc.) are applicable,
    # whereby we have three axes here.

    # Can change color by supplying color-gradient:

    plot(vx, vy, mz', st=:surface, color=:reds)
    plot(vx, vy, mz', st=:contour, color=:reds)
    heatmap(vx, vy, mz', color=:reds)

    # Own color gradient:
    myColGr = cgrad([:red,:blue])
    plot(vx, vy, mz', st=:surface, color=myColGr)
    plot(vx, vy, mz', st=:contour, color=myColGr)
    heatmap(vx, vy, mz', color=myColGr)

    # To remove color-bar on the right:
    plot(vx, vy, mz', st=:surface, color=:reds, colorbar = false)
    

    # In surface-plot, can also edit camera-angle:
    
    plot(vx, vy, mz', st=:surface, camera=(60,30))



# --- Combine Multiple Plots into Single Figure ---------------------------------


    vx  = collect(-2:0.1:2)
    vy1 = vx.^2
    vy2 = vx.^3
    vy3 = vx.^4
    vy4 = vx.^5

    plot1 = plot(vx, vy1, line = (:black, 1, 2, :solid))
    plot2 = plot(vx, vy2, line = (:black, 1, 2, :solid))
    plot3 = plot(vx, vy3, line = (:black, 1, 2, :solid))
    plot4 = plot(vx, vy4, line = (:black, 1, 2, :solid))


    plot(plot1, plot2, layout=(1,2))

    # Delete legend in each plot:
    plot(plot1, plot2, layout=(1,2), legend=false)

    # Can also adjust other options (for each plot): e.g.
    plot(plot1, plot2, layout=(1,2), grid=false)
    plot(plot1, plot2, layout=(1,2), ylims=(-5,5))


    # Can also save multiple plots to single vector ...:
    vPlots = Vector{Any}(undef,4)
    vPlots[1] = plot1
    vPlots[2] = plot2
    vPlots[3] = plot3
    vPlots[4] = plot4
    # ... and then combine several plots from this vector:
    plot(vPlots..., layout=(2,2))
    plot(vPlots[1:2]..., layout=(1,2))


    # Note that we fill plots row-by-row;
    plot(vPlots..., layout=(2,2))

    # To fill plots column-by-column:
    nr = 2
    nc = 2
    mA = reshape(1:nr*nc,nr,nc) # this is how I want the plots to be ordered
    mAt = mA' # this is how Julia does it by default
    plot(vPlots[vec(mAt)]..., layout=(nr,nc))



    # Add overarching title to 1x2-plot:

    myLayout = @layout [a{.1h};grid(1,2)]
    plot(
       plot(annotation=(0.5,0.5, "My amazing title"), framestyle = :none),
       plot1, plot2,
       layout = myLayout)

