---
  # how do we do it in real world
  
  ##X2 tests (categorcial data)
  ## T-tests
  #ANOVA
  # regression 
  
  ---
  #categorical data
  
  x2 or 'goodness of fit"

examples 
---
## picking cards at random

research hypothesis is that people don't choose cards randomly

What would the null be here?
  
  ---
  
  H0: All four suits are chosen with equal probability
H1: At least one of the suit-choice probabilities isn't .25

---

H0: P = p(25, 25, 25, 25)
H1: P != p(25, 25, 25, 25)

note: usually goodness of fit test all cats are = but doesn't have to be

---
  test statistic
we have observed data O and probablites P...we want to measure how close O is to P..

step 1. what are the expected frequencies if null is true.

n = 200
p2(diamonds) = .25

Ei = N x Pi

could do the math or...

```{r}
probabilities <- c(clubs = .25, diamonds = .25, hearts = .25, spades = .25)
N <- 200

expected <- N * probabilities
```

---
  #so we want to compare the Expected vs. the Observed numb of observations
  
  
  
  -|C|H|S|d
Expected |Yes| | |
  observed|Yes
difference|Yes
.02|NO
.01|NO

---
  #in R
  
  probabilities <- c(clubs = .25, diamonds = .25, hearts = .25, spades = .25)

---
  
  people chose more hearts and fewer clubs than the null hypothesis predicted.
but the negative number is odd...does it matter which way it devaites.
no...so we can squre

```{r}
#(observed - expected)^2
```

so now we can tell that when # is large it means that null made a bad prections and when num is smll it made a ood prection


```{r}
#(observed - expected)^2 / expected
```

each tells us how big a mistake the null made when guessing what te values would be

last step is to sum it all up

```{r}
#sum( (observed - expected)^2 / expected )
```

this is x^2 value. if it is small means the null was close...but how small?
  
  ---
  SAmpling dist of the Goodness-of-Fit

- simple answer: chi-squared (X^2) distribution with k- 1 degress of freedom

- what *are* degrees of freedom!
  
  ---
  
  FIG 12.2 

---
  
  ```{r}
qchisq( p = .95, df = 3 )
pchisq( q = 8.44, df = 3, lower.tail = FALSE )
```

---
  
  in r

with lsr package

```{r}
#goodnessOfFitTest( cards$choice_1 )
```


```{r}
#chisq.test( x = observed )
```

---
  
  ```{r}
#nullProbs <- c(clubs = .2, diamonds = .3, hearts = .3, spades = .2)

#goodnessOfFitTest( x = cards$choice_1, p = nullProbs )
```


```{r}
#chisq.test( x = observed, p = c(.2, .3, .3, .2) )
```

---
  #The X2 test of independence (or association)
  
  research hypothesis is that humans and robots answer the question in different ways", how can I construct a test of the null hypothesis that humans
and robots answer the question the same way



H0: All of the following are true:
P11 = P12 (same probability of saying \puppy"),
P21 = P22 (same probability of saying \
           ower"), and
P31 = P32 (same probability of saying \data").

---
  
  Calcuatlr expected frequence


- for each of the observed counts Oij , we need to figure out what the
null hypothesis would tell us to expect.

Therefore, our expected frequency can be written as the product (i.e. multiplication) of the row total
and the column total, divided by the total number of observations

SKIPPED

---
  
  Fisher's exact test
McNemar Test

---
# comparing two means

What if we want to compare  whetere an outcome varibae is higher in one group or another


---
# z- test (not really used, but useful when thinking about t-tests etc)

z stat = it's equal to the number
of standard errors that separate the observed sample mean X from the population mean mu predicted by the null hypothesis. Better yet, regardless of what the population parameters for the raw scores actually
are, the 5% critical regions for z-test are always the same, as illustrated in Figure 13.3. And what this
meant, way back in the days where people did all their statistics by hand, is that someone could publish
a table like this:
  
  ---
  
  #student's T-Test 
  
  ##use when we don't know for sure the  true standard deviation
  
  assumption:
  normailty

indepedence

show the general eqation and exaplin what appens with it

singal/noise

https://www.youtube.com/watch?v=pTmLQvMM-1M

https://youtu.be/pTmLQvMM-1M?t=285


https://socialresearchmethods.net/kb/Assets/images/stat_t3.gif
---
  #The independent samples t-test
  