#1Create a vector with numbers from 1 to 31
#With this vector and the command paste() create a vector named
#tree.name with 31 tree names, from Tree_1 to Tree_31.
V1 <- 1:31
tree.name <- paste("Tree_", V1, sep = "")
print(tree.name)

#2Make and object called d0 with the data frame trees in R datasets. 
#Look into the help to see what is into this data frame.
d0 <- data.frame(trees)
#Result 31 obs. of 3 variables: Girth, Height, Volume

#3Add your variable tree.name to d0
#d0 <- data.frame(tree.name, trees)

d0$arboles.name <- tree.name

str(d0)
summary(d0)

#4Make the code to extract the name in tree.
#name of the larger (volume), the highest and the widest tree.
max(d0$Volume)
d0$Volume == max(d0$Volume)
d0$arboles.name[d0$Volume == max(d0$Volume)]
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
#Large for trees with volume larger or equal the mean
#and Small with trees with volume smaller than the mean
mean(d0$Volume)
d0$ls <- "Large"
d0$ls[d0$Volume < mean(d0$Volume)] <- "Small"
d0$ls
sum(d0$ls == "Large")
#result = 12 large trees

#7Make a new factor variable into d0 with Tall for trees taller or equal 
#the mean and Short with trees with Height shorter than the mean
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
#2
short_large <- (d0$tl == "Short") & (d0$ls == "Large")
short_large
sum(short_large)

mean(d0$Girth[(d0$tl == "Short") & (d0$ls == "Large")])
