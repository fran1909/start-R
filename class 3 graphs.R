################ BASIC GRAPHS ###################
# Define the greenfly vector with 5 values
greenfly <- c(1, 3, 6, 4, 9)

################ POINTS #########################
# Graph the greenfly vector with all defaults
plot(greenfly)
################ LINES  #########################
# Graph the greenfly vector with a line
plot(greenfly, type = "l")
################ BARPLOT ########################
# Names for the bars
years <- as.character(1999:2003)
# Graph the greenfly vector with barplot
barplot(greenfly, names.arg = years)
################ PIE PLOT #######################
# Graph the greenfly vector with a line
pie(greenfly, labels = years)
################ BOX PLOT #######################
# Graph the greenfly vector with a boxplot
boxplot(greenfly)
####### HISTOGRAM WITH FREQUENCIES ##############
# Graph the greenfly vector with a histogram with frequencies
hist(greenfly)
##### HISTOGRAM WITH PROBABILITY DENSITIES ######
# Graph the greenfly vector with a histogram with probability densities
hist(greenfly, freq = F)
# ADD other graph with density
lines(density(greenfly), col = "red")
################ LINES AND POINTS ###############
# Graph greenfly using blue points overlayed by a line
# and with bold/italic title
plot(greenfly, type = "o", col = "blue"
     , main = "Greenfly", font.main = 4)

####### TWO GRAPHS WITH LOW-LEVEL COMMANDS #######
# Define other vector
aphids <- c(2, 5, 4, 5, 12)
# Graph greenfly using a y axis that ranges from 0 to 12
plot(greenfly, type = "l", col = "blue"
     , ylim = c(0,12), x = years)
# Add graph for aphids with red dashed line
lines(aphids, type = "l", lty = 2, col = "red", x = years)

# Add a title with red and bold/italic font
title(main = "Aphids and greenfly"
      , col.main = "red", font.main = 4)
# Add legend
legend("topleft", c("greenfly", "aphids")
       , col = 1:2, lty = 1:2)
##### Cheat-sheet for pch (point type) -------------------------------------
plot(0, 0, xlim = c(0, 21), ylim = c(0.5, 1.5)
     , ylab = "", xlab = "", yaxt = "n")
axis(2, 1, labels = c("pch"))
for (i in 1:20) {
  points(i, 1, pch = i, cex = 3)
}
#### Cheat-sheet for colors ----------------------------------------------
plot(0, 0, xlim = c(0, 21), ylim = c(0.5, 1.5)
     , ylab = "", xlab = "", yaxt = "n")
axis(2, 1, labels = c("col"))
for (i in 1:20) {
  points(i, 1, pch = 15, col = i, cex = 3)
}
#### Cheat-sheet for ALL ---------------------------------------------
num = 0 ; num1 = 0
plot(0, 0, xlim = c(0, 21), ylim = c(0.5, 3.5)
     , yaxt = "n", ylab = "", xlab = "")

### Add axis
axis(2, at = c(1, 2, 3), labels = c("pch", "col", "lty"))

### Fill the graph
for (i in seq(1,20)) {
  points(i, 1, pch = i, cex = 3)                        # pch
  points(i, 2, col = i, pch = 15 , cex = 3)             # col
  #lty
  if (i %in% c(seq(1, 18, 3))) {
    num = num + 1
    points(c(i, i + 2), c(3, 3)
           , col = "black"
           , lty = num, type = "l", lwd = 2)
    text(i + 1.1, 3.15, num)
  }
}
plot(iris)  
### Same plot with only 1:4 variables and colors by Species
plot(iris[1:4], col = iris$Species )   # colors by species
### Dependent variable numeric, independent variable categorical
plot(iris$Petal.Length ~ iris$Species) # Same that boxplot()

## Two numeric variables, color by species, title and legend
PETAL <- iris$Petal.Length                       # Numeric variable 1
SEPAL <- iris$Sepal.Length                       # Numeric variable 2
SP    <- iris$Species               # Categorical variable for colors

### Scatterplot
plot(SEPAL~PETAL, col = SP, xlab = "Petal length (cm)", 
     ylab = "Sepal length (cm)")                        

### low-levels
title("Example of scatterplot")           # low-level command title()
legend("bottomright", levels(SP), pch = T,col = c(1:3))    #low-level

### HISTOGRAMS OF DISTRIBUTIONS -----------------------------------
? Distributions  # help for Distributions

### Plot with random normal (0,1) data
x <- rnorm(100, mean = 0, sd = 1)                 # Random normal data
hist(x, freq = F, ylim = c(0, 0.5))               # Histogram 

### Plot normal density over the histogram
xl <- seq(-5, 5, length = 100)          # sequence of numbers
y <- dnorm(xl, mean = 0, sd = 1)        # Normal densities for x
lines(xl, y, col = "red")               # Red line with distribution

### Plot graphic with ten normal distributions using for() 
x   <- seq(-15, 15, length = 1000)      # Sequence of 1000 numbers
y   <- dnorm(x, mean = 0, sd = 1)       # Normal densities for x
plot(x, y, type = "n")                  # Empty plot (type = "n")

### Plot lines over first plot 
for (i in 1:10) {                   # Ten lines with sd from 1 to 10
  y <- dnorm(x, 0, i)             # Calculate the normal density
  lines(x, y, col = i)           # Plot the line
}

### Legend
legend("topright", legend = paste("sd =", 1:10)
       , lty = 1, col = 1:10)
title(main = "normal distributions, mean = 0, sd = 1:10")

OTHER DISTRIBUTIONS ------------------------------------
  
  ### Plot graphic with ten CHI-SQUARE distributions using for()
  x   <- seq(-1, 20, 1)                # Sequence
y   <- dchisq(x, df = 2)             # densities for x
plot(x, y, type = "n")               # Empty plot (type = "n")

### Plot lines over first plot
for (i in 1:10) {                    # Ten lines with DF from 1 to 10
  y <- dchisq(x, df = i)           # Calculate density
  lines(x, y, col = i)              # Plot the line
}

### Legend and title 
legend("topright", legend = paste("df =", 1:10),lty = 1, col = 1:10)
title(main = "Chi-square distributions, df = 1:10")

#Plot graphic with ten BINOMIALS distributions using for() -----------
  x   <- seq(0, 25, 1)                    # Sequence
y   <- dbinom(x, prob = 0.5, size = 3)  # densities for x
plot(x, y, type = "n")                  # Empty plot (type = "n")

### Plot lines over first plot
for (i in 1:10) {          # Ten lines with SIZES from 1 to 10
  y <- dbinom(x, prob = 0.5, size = i * 3)    # densities for x
  lines(x, y, col = i)                       # Plot the line
}
### Legend and title
legend("topright", legend = paste("df =", 1:10*3)
       , lty = 1, col = 1:10)
title(main = "Binomial distributions, probability = 0.5, size = 3:30")

#### jpeg plot ---------------------------------------
jpeg(filename = "Plot1.jpeg")           # Open the device "Plot1.jpeg"
plot(iris[1:4], col = iris$Species)    # make the plot into the device
dev.off()              # Close the device. Do not forget to put the () 
#### See the plot into the working directory. getwd() to see where.
getwd()
#### tiff plot ------------------------------------------
tiff("Plot1.tiff", width = 12, height = 10, units = "cm", 
     bg = "transparent", res = 150)       # Open the device "Plot1.tiff"
plot(iris[1:4], col = iris$Species)    # make the plot into the device
dev.off()              # Close the device. Do not forget to put the () 
#### See the plot into the working directory. getwd() to see where.

#### Export data ---------------------------
### Export iris dataframe
write.table(iris, file = "IrisFile.csv", dec = ",", sep = ";")

#### Import IrisFile.csv -------------------------------
MyIris <- read.table("IrisFile.csv", dec = ",", sep = ";")
str(MyIris)                  # Check if it has been correctly imported

#### Import csv from web 
# Original CSV from https://peerj.com/articles/8195/ "Effect of temperature on pollen germination for several Rosaceae species: influence of freezing conservation time on germination patterns"
# zip file <- "https://dfzljdn9uc3pi.cloudfront.net/2019/8195/1/CIT_2018_r_Pollination-rosaceae-temperature.zip"
Webcsv <- "http://personales.upv.es/algarsal/R-tutorials/polen-rosaceas-temperatura_UTF-8.csv"
Data <- read.table(Webcsv, header = T, sep = ",")
str(Data)                    # Check if it has been correctly imported
