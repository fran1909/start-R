#Francisco Martinez Martinez 06/10/2020
### Creating simple objects and vectors ----------------

### Simple Objects
N5 <- 5  # Numeric
Te <- "Five"                        # Text

### Vectors
VN <- c(1, 3, 4, N5)                   # Numeric vector
VT <- c("One", "Three", "Four", Te)    # Text vector

###   We created four objects: N5, Te, VN and VT.
###   We used the first two objects as part of the vectors.

###  See the content of the objects
N5   # or print(N5)
Te
VN
VT

###  See the  mode of the objects
mode(N5)
mode(Te)
mode(VN)
mode(VT)

###  See the  structure of the objects
str(N5)
str(Te)
str(VN)
str(VT)

### See the  length of the objects
length(VT)

### If we mix character and numeric objects into a vector, 
### it will became a character vector:
UN <- c(VN, VT)
UN
str(UN)
length(UN)

### Convert numeric vector to character and vice versa
VNC <- as.character(VN)
str(VN)
str(VNC)                # Notice that character data are in quotations
as.numeric(VNC)         # Back to previous numeric vector

### Extract part of a vector
VT[1:2]                 # Extracts fist two positions of VT
VT[c(1, 3)]             # Extracts positions 1 and 3 of VT

### Replace parts of a vector
VT                                    # See initial VT
VT[2:4] <- c("two", "three", "four")  # Replace
VT                                    # See the result

### Logical Vectors
VN                                    # This is a numeric vector
VN <= 3                               # This is a logical vector (TRUE or FALSE)
VN[VN <= 3]                           # Crop the values minor or equal 3
You may use ls() to see a list of all your objects, as in the “Environment” tab in RStudio. Also it is possible to remove an object with rm().

### Use of ls() and rm() -------------------------------------------
ls()                                 # See the actual objects list
rm(Te)                               # Remove the object Te
ls()                                 # Check Te disappeared
Factors
as.vector(), as.factor(), levels(), factor()

Categorical data can be in two different formats: character vectors or factors. To change between them use as.vector() or as.factor(). Factors structure is a numeric vector with the order and a character vector called names with the list of categories.

###  Factors  ---------------------------------------------

Vec <- c("Red","Blue","Red","Blue","Red") # This is a character vector
str(Vec)                                  # Notice its structure
Fac <- as.factor(Vec)                     # Create factor
as.vector(Fac)                            # Vector
str(Fac)        # Notice structure of a factor with levels and numbers
Fac[3]          # Position 3
levels(Fac)     # To see the levels. 
# Notice that levels are in alphabetical order
levels(Fac)[2]  # The second level of the factor

###  Reorder Factors ----------------------------------------
levels(Fac)[c(2, 1)]                 # The levels ordered as wanted
FacR <- factor(Fac, levels = levels(Fac)[c(2, 1)]) # Redo the factor
str(FacR)                            # Factor ordered

### Other way to reorder factors
FacR2 <- factor(Vec, levels = c("Red", "Blue"))
str(FacR2)      
# Same result
trees
#1Create a vector with numbers from 1 to 31
#With this vector and the command paste() create a vector named
#“tree.name” with 31 tree names, from “Tree_1” to “Tree_31”.
V1 <- 1:31
tree.name <- paste("Tree_", V1, sep = "")
print(tree.name)

#2Make and object called “d0” with the data frame “trees” in R datasets. 
#Look into the help to see what is into this data frame.
d0 <- data.frame(trees)
#Result 31 obs. of 3 variables: Girth, Height, Volume

#3Add your variable tree.name to d0
d0$tree.name <- tree.name
str(d0)

#4Make the code to extract the name in tree.
#name of the larger (volume), the highest and the widest tree.
max(d0$Volume)
d0$Volume == max(d0$Volume)
d0$tree.name[d0$Volume == max(d0$Volume)]
mean(d0$Volume)
d0$Volume < mean(d0$Volume)
#highest
max(d0$Height)
d0$Height == max(d0$Height)
d0$tree.name[d0$Height == max(d0$Height)]
mean(d0$Height)
d0$Height < mean(d0$Height)
#widest
max(d0$Girth)
d0$Girth == max(d0$Girth)
d0$tree.name[d0$Girth == max(d0$Girth)]
d0$Girth < mean(d0$Girth)

#5Using the function mean() calculate the mean Diameter, Height and Volume.
mean(d0$Volume)
mean(d0$Height)
mean(d0$Girth)

#6Make a new factor variable into d0 with two levels:
#“Large” for trees with volume larger or equal the mean
#and “Small” with trees with volume smaller than the mean
mean(d0$Volume)
d0$ls <- "Large"
d0$ls[d0$Volume < mean(d0$Volume)] <- "Small"
d0$ls
#result = 12 large trees

#7Make a new factor variable into d0 with “Tall” for trees taller or equal 
#the mean and “Short” with trees with Height shorter than the mean
mean(d0$Height)
d0$tl <- "Tall"
d0$tl[d0$Height < mean(d0$Height)] <- "Short"
d0$tl
sum(d0$tl == "Short" )

#8.Make a subset with the trees that are both short and large 
#and calculate the mean diameter of these Short-Large 
d1 <- subset(d0, ls == "Large" & tl == "Short", drop =FALSE, select=c(Girth)  ) 
sum(d0$tl == "Short" & d0$ls == "Large" )
print(mean(d1$Girth))


