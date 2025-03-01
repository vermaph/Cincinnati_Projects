#Topic: Binomial Distribution Visualization in R
#Author: Piyush Verma
#College: University of Cincinnati
#Date:  10/10/2017


install.packages("manipulate")  #Great package to change parameters dynamically
library("manipulate")
manipulate(
{
hist(rbinom(trials,size = trials,p=probability)
     ,xlim = c(0,trials)
     ,xlab="Number of successes"
     ,ylab="Probability"
     ,probability = TRUE
     ,main = paste("Binomial distribution of ",trials,"trials with success probability = ", round(probability,2)) #Dynamic title
     ,col = "blue"
     )
lines(density(rbinom(trials,size = trials,p=probability),na.rm = TRUE), col="darkgreen", lwd=4)

p<-dbinom(0:trials,size = trials,p=probability)
x<-0:trials
arr<-p*x
exp<-sum(arr)

legend("topright",legend = parse(text = sprintf('paste(mean,\' = %s\')',round(exp,2))))
}
,trials=slider(1,500)
,probability=slider(0,1)
)
