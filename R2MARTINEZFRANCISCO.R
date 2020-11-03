#FRANCISCO MARTINEZ MARTINEZ Chapter 2: Operations in R

#1.Open the data frame in iris {datasets}. 
#Use the help to know about this data. 
#In which units are measured the length and width of sepals and petals? 
#How many variables and observations are there in iris?
iris <- data.frame(iris)
#answer the length and width are mesured in centimeters
#and there are 5 variables and 150 observations. 

#2.Create a vector with the species names. Remember that genus 
#should be with capital letters and species in small letters 
#(e.g.Iris setosa).
str(iris$Species)
sp.name <- c(paste("Iris", iris$Species, " "))
sp.name <- unique(sp.name)
sp.name

#3Create a vector with the name of all quantitative variables
Qv <- variable.names(iris[1:4])
Qv

#4Make a data frame with the combination of the two previous vectors.
Species <- vector()
Variable <- vector()
i <- 1

for(x in 1:length(sp.name)){
for (y in 1:length(Qv)){
Species[i] <- sp.name[x]
Variable[i] <- Qv[y]
i <- i+1
  }
}
print(Species)
print(Variable)
comb <- data.frame(Species,Variable)
print(comb)

#5Using dataframe from exercise 4, make a data frame with the following variables:
#Species.
#Variable.
#Mean, the mean for each variable and species.
#Standard_error, the standard error for each variable and species.
#Median, the median for each variable and species.
#Minimum, the minimum for each variable and species.
#Maximum, the maximum for each variable and species.
D1 <- data.frame()
D2 <- data.frame()
D1 <- expand.grid(unique(iris$Species), unique(Variable))
D1 <- data.frame(D1)
colnames(D1) <- c("Species", "Variable")
D1
D2 <- D1
D2

for (i in 1:length(D2$Species)){
current_species <- D1$Species[i]
current_variable <- D1$Variable[i]
name_of_current_variable = as.character(current_variable)
  
myvar <- c(as.character(current_variable),"Species") 

newdata <- iris[myvar] 
finaldata <- newdata[ which(newdata$Species==as.character(current_species)), ] 
values_needed <- finaldata[name_of_current_variable] 
values_needed <- unlist(values_needed, use.names=FALSE) 
print(newdata)
print(finaldata)
print(values_needed)
print(typeof(values_needed))
  
D2$Mean[i] <- mean(values_needed)
D2$Standard_error[i] <- sd(values_needed) / sqrt(length(values_needed))
D2$Median[i] <- median(values_needed)
D2$Minimum[i] <- min(values_needed)
D2$Maximum[i] <- max(values_needed)
}
D2
#6Install the package writexl and use the command write_xlsx 
#to create a yourname.xlsx file with your data frame.
library("writexl")
write_xlsx(D2,"C:\\Users\\marti\\Documents\\FranciscoMM.xlsx")

