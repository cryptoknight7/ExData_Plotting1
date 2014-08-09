#### Plot 3 Instructions ####

## Construct the plot and save it to a PNG file with a width of 480 
## pixels and a height of 480 pixels.

## Name each of the plot files as plot1.png, plot2.png, etc.

## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the 
##   corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
##   Your code file should include code for reading the data so that the plot 
##   can be fully reproduced. You should also include the code that creates the PNG file.

## Add the PNG file and R code file to your git repository.

# Title: <N/A>
# x-axis: Day of Week (Thu-Sat)
# y-axis: Energy Sub Metering (0-30)

#### Plot 3 Code ####

# Load data using loading script.
# NOTE: Data is loaded into data frame object called "powerData.df".
source('LoadPowerData.R')

# Create plot 3.
createPlot3 <- function()
{
     # Open PNG graphic device.
     print("[Plot 3] Configuring PNG graphic device...")
     png(filename="figure/plot3.png",
         bg = "transparent",
         width = 480, 
         height = 480, 
         units = "px")

     # Create plot.
     print("[Plot 3] PNG device OK.  Creating plot...")
     plot(powerData.df$date.time, 
          powerData.df$Sub_metering_1,
          ylab='Energy sub metering',
          xlab='', 
          type='l')

     lines(powerData.df$date.time, 
           powerData.df$Sub_metering_2, 
           col='red')

     lines(powerData.df$date.time, 
           powerData.df$Sub_metering_3, 
           col='blue')

     legend('topright',
            legend=c('Sub_metering_1', 
                     'Sub_metering_2', 
                     'Sub_metering_3'),
            col=c('black', 'red', 'blue'),
            lty='solid')
     
     print("[Plot 3] Plot 3 created OK!")
     
     # Turn off graphic device.
     dev.off()
}
createPlot3()
