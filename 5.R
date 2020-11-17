## For the data InsectSpray, make a table for the number of insects for each spray with the mean, median and standard error.
#Note: Remember to use knitr::kable(), or a similar function to print the table with its caption.

me <- med <- se <- In <- numeric()
sp <- character()

for(i in levels(InsectSprays$spray)){   #i is a random value given to the spray column.
  for(j in names(InsectSprays)[-2]){    #j is a random value given to the count column.
    
    sp <-c(sp,i)                   # vector that allows to go through the values related to the levels of spray.
    
    x <- InsectSprays[InsectSprays$spray ==i,j]   
    me <- round(c(me, mean(x)), 2)
    se <- round(c(se, sd(x) / sqrt(length(x))),2)
    med <- c(med, median(x))
    In <- c(In, sum(x))
    
  }
}

d <- data.frame(Spray  = sp,
                Insects_count = In,
                Mean = me,
                Standarderror = se,
                Median = med)
## Exercice 2. Print a plot to see the differences of counts between sprays. 
#Include a caption explaining the figure. Which type of plot is the one you choose and why?

boxplot(count ~ spray, data = InsectSprays)
title(main="Effect of different sprays on insect count")

## Exercice 3. Test for differences between sprays using anova and a posthoc comparison.


res.aov <- aov(count ~ spray, data = InsectSprays)
summary(res.aov)
tukey.test <- TukeyHSD(res.aov)
print(tukey.test)

## install packages: agricolae

library(agricolae)
letter_test <- HSD.test(res.aov, "spray")
letter_test

## Redo the previous plot including the representation of all posthoc differences.

plot(count ~ spray, data = InsectSprays, ylim = c(0,30))
text(x = 1:6, y = 29, c("a", "a", "b", "b", "b", "a"))

## Exercice 4. Test for differences between sprays using non-parametric Kruskal-Wallis rank sum test. 
# Again, redo the plot with these results. Use agricolae::kruskal().


krus <- kruskal(InsectSprays$count, InsectSprays$spray)
print(krus)
plot(count ~ spray, data = InsectSprays, ylim = c(0,30))
text(x = 1:6, y = 29, c("a", "a", "c", "b", "bc", "a"))

# Proved that the difference in treatment C and D is significant.
## Exercice 5. Transform count data using sqrt(counts) and redo the anova, the Tukey posthoc comparison and the plot.


res.aov2 <- aov(sqrt(count) ~ spray, data = InsectSprays)
summary(res.aov2)
tukey.test2 <- TukeyHSD(res.aov2)
print(tukey.test2)
plot(tukey.test2)

# Performing the agricolae test
letter_test2 <- HSD.test(res.aov2, "spray")
letter_test2

# putting up the plot
plot(count ~ spray, data = InsectSprays, ylim = c(0,30))
text(x = 1:6, y = 29, c("a", "a", "c", "b", "bc", "a"))

## Exercice 6. Test for normality of residuals for the two performed anova analyses of points 4 and 6 using shapiro.test()

# shapiro test for the 1 anova analysis
shapiro.test(res.aov$residuals)

# conclusion: p < 0.05 => the null hypothesis is rejected, there is no normality

# shapiro test for the 2 anova analysis
shapiro.test(res.aov2$residuals)

# conclusion: p > 0.05 => the null hypothesis is accepted, there is normality.

# Use plot the anova to see the qqplots and compare them.

qqnorm(res.aov$residuals, main = "QQplot for Direct anova")
qqline(res.aov$residuals)

qqnorm(res.aov2$residuals, main = "QQplot for square transformed anova")
qqline(res.aov2$residuals)


# The square transformed anova is closer to normality than the first one. In fact, in the qqplot the points are closer to the line than in the qqplot for the direct anova.

## Exercice 7. Which of the previous analysis is the adequate in this case? Why? 

The square root anova appears to be the most adequate because it allowed us to prove normality by transforming the data.
It was more accurate than the direct anova in detecting significant differences between the treatments (e.g. C and D). 
The Kruskal-Wallis analysis was also relevant as it captured the same differences that were shown in the square root anova.
# Is there any difference in the results between the square root transformed ANOVA and the Kruskal-Wallis analyses?
No, there was no difference. The statistical significance between the treatments remained the same
# Is there any difference in the results between the direct ANOVA and the square root transformed ANOVA? Which ones?
Yes, some differences were detected. The square root transformed anova showed that spray C and D are statistically different whereas they were not shown to be statistically different in the direct anova. 
However, note that there is no statistical difference between C and E and D and E in both the direct and square root anova test.