#### Plot 1 Instructions ####
## Construct the plot and save it to a PNG file with a width of 480 
## pixels and a height of 480 pixels.

## Name each of the plot files as plot1.png, plot2.png, etc.

## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the 
##   corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
##   Your code file should include code for reading the data so that the plot 
##   can be fully reproduced. You should also include the code that creates the PNG file.

## Add the PNG file and R code file to your git repository.

# Title: Global Active Power
# x-axis: Global Active Power (0-6 kilowatts)
# y-axis: Frequency (0-1200)

#### Plot 1 Code ####
# Load data using loading script.
# NOTE: Data is loaded into data frame object called "powerData.df".
source('LoadPowerData.R')

# Create plot 1.
createPlot1 <- function()
{
     # Open PNG graphic device.
     print("[Plot 1] Configuring PNG graphic device...")
     png(filename="figure/plot1.png",
         bg = "transparent",
         width = 480, 
         height = 480, 
         units = "px")
     
     # Create histogram plot.
     print("[Plot 1] PNG device OK.  Creating histogram plot...")
     hist(powerData.df$Global_active_power,
          main='Global Active Power',
          xlab='Global Active Power (kilowatts)',
          ylab='Frequency',
          col='red')
     
     print("[Plot 1] Plot 1 created OK!")
     
     # Turn off graphic device.
     dev.off()
}
createPlot1()

