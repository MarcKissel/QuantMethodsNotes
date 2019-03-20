library(lsr)
load("randomness.Rdata")
load( "randomness.Rdata" )
str(cards)
observed <- table( cards$choice_1 )
#think about building this obsereved set in class to teach student
probabilities <- c(clubs = .25, diamonds = .25, hearts = .25, spades = .25)
N <- 200
expected <- N * probabilities
expected


observed - expected

(observed - expected)^2

(observed - expected)^2 / expected

load( "chapek9.Rdata" )
head(chapek9)
summary(chapek9)
chapekFrequencies <- xtabs( ~ choice + species, data = chapek9)
#give  students chapekFre or something simialr

#do robots ad huams prefer differnet hitns



###############################3
###########3
##ttest
#######################33


load( "zeppo.Rdata" )
print( grades )