#### Plot 4 Instructions ####

## Construct the plot and save it to a PNG file with a width of 480 
## pixels and a height of 480 pixels.

## Name each of the plot files as plot1.png, plot2.png, etc.

## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the 
##   corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
##   Your code file should include code for reading the data so that the plot 
##   can be fully reproduced. You should also include the code that creates the PNG file.

## Add the PNG file and R code file to your git repository.

# Title: <N/A>
# Top-Left Plot x-axis: Day of Week (Thu-Sat)
# Top-Left Plot y-axis: Global Active Power (0-6 kW)

# Top-Right Plot x-axis: Day of Week (Thu-Sat) -- datetime
# Top-Right Plot y-axis: Voltage (234-246V)

# Bottom-Left Plot x-axis: Day of Week (Thu-Sat)
# Bottom-Left Plot y-axis: Energy Sub Metering (0-30)

# Bottom-Right Plot x-axis: Day of Week (Thu-Sat) -- datetime
# Bottom-Right Plot y-axis: Global Reactive Power (0.0-0.5)

#### Plot 4 Code ####

# Load data using loading script.
# NOTE: Data is loaded into data frame object called "powerData.df".
source('LoadPowerData.R')

# Create plot 4.
createPlot4 <- function()
{
     # Open PNG graphic device.
     print("[Plot 4] Configuring PNG graphic device...")
     png(filename="figure/plot4.png",
         bg = "transparent",
         width = 480, 
         height = 480, 
         units = "px")
     
     # Create plot (4 plots in 2x2 arrangement).
     print("[Plot 4] PNG device OK.  Creating plot...")
     par(mfrow=c(2,2))
     
     # Create Top-left panel "Global Active Power" plot (basically same as Plot 2).
     plot(powerData.df$date.time, 
          powerData.df$Global_active_power,
          ylab='Global Active Power', 
          xlab='', 
          type='l')
     
     # Create Top-right panel "Voltage" plot.
     plot(powerData.df$date.time, 
          powerData.df$Voltage,
          ylab='Voltage', 
          xlab='datetime', 
          type='l')
     
     # Create Bottom-left panel "Energy Sub Metering" plot (same as Plot 3).
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
            lty='solid',
            bty='n')
     
     # Create Bottom-right panel "Global Reactive Power" plot.
     plot(powerData.df$date.time, 
          powerData.df$Global_reactive_power,
          ylab='Global_reactive_power', 
          xlab='datetime',
          type='l')
     
     print("[Plot 4] Plot 4 created OK!")
     
     # Turn off graphic device.
     dev.off()
}
createPlot4()
