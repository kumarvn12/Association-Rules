# Load the libraries
# install.packages('arules')
# install.packages('datasets')
install.packages("arules")
library(arules)
library(datasets)

# Load the data set
data(Groceries)

# Create an item frequency plot for the top 20 items
itemFrequencyPlot(Groceries,topN=20,type="absolute")

# Get the rules
rules <- apriori(Groceries, parameter = list(supp = 0.002, conf = 0.8))

# Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(rules[1:5])

# Sorting the rules
# By confidence
rules<-sort(rules, by="confidence", decreasing=TRUE)

# By rule length
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8,maxlen=3))

# Targeting Items
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])


rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2), 
               appearance = list(default="rhs",lhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])

