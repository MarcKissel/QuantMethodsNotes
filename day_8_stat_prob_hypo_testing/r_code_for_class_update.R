




dbinom(x = 4, size = 20, prob = 1/6)

#If we want to find the single probability of exactly 10 successes
#in 100 trials with p = 0.1, we do this.
dbinom(10, 100, 0.1)

#90th percentile of a binomial distribution with n = 200 and p = 0.3.
qbinom(0.9, 200, 0.3)

gbinom(200, 0.3, scale = T, quantile = 0.9)


pbinom(q = .9, prob = .3, size = 200)






install.packages("moderndive")
library(dplyr)
library(ggplot2)
library(moderndive)
tactile_prop_red
View(tactile_prop_red)

ggplot(tactile_prop_red, aes(x = prop_red)) +
  geom_histogram(binwidth = 0.05, boundary = 0.4, color = "white") +
  labs(x = "Proportion of 50 balls that were red", 
       title = "Distribution of 33 proportions red") 

bowl

virtual_shovel <- bowl %>% 
  rep_sample_n(size = 50)

View(virtual_shovel)

virtual_shovel %>% 
  mutate(is_red = (color == "red")) 

virtual_shovel %>% 
  mutate(is_red = (color == "red")) %>% summarise(num_red = sum(is_red))

virtual_shovel %>% 
  mutate(is_red = color == "red") %>% 
  summarize(num_red = sum(is_red)) %>% 
  mutate(prop_red = num_red / 50)

virtual_shovel %>% 
  summarize(num_red = sum(color == "red")) %>% 
  mutate(prop_red = num_red / 50)


virtual_samples <- bowl %>% 
  rep_sample_n(size = 50, reps = 33)
View(virtual_samples)


virtual_prop_red <- virtual_samples %>% 
  group_by(replicate) %>% 
  summarize(red = sum(color == "red")) %>% 
  mutate(prop_red = red / 50)

View(virtual_prop_red)


ggplot(virtual_prop_red, aes(x = prop_red)) +
  geom_histogram(binwidth = 0.05, boundary = 0.4, color = "white") +
  labs(x = "Proportion of 50 balls that were red", 
       title = "Distribution of 33 proportions red") 

#Why do we have these differences in proportions red? Because of 
#sampling variation

#1000 times
virtual_samples <- bowl %>% 
  rep_sample_n(size = 50, reps = 1000)
View(virtual_samples)
virtual_prop_red <- virtual_samples %>% 
  group_by(replicate) %>% 
  summarize(red = sum(color == "red")) %>% 
  mutate(prop_red = red / 50)
View(virtual_prop_red)


ggplot(virtual_prop_red, aes(x = prop_red)) +
  geom_histogram(binwidth = 0.05, boundary = 0.4, color = "white") +
  labs(x = "Proportion of 50 balls that were red", 
       title = "Distribution of 1000 proportions red") 


# Segment 1: sample size = 25 ------------------------------
# 1.a) Virtually use shovel 1000 times

virtual_samples_25 <- bowl %>% 
  rep_sample_n(size = 25, reps = 1000)

# 1.b) Compute resulting 1000 replicates of proportion red
virtual_prop_red_25 <- virtual_samples_25 %>% 
  group_by(replicate) %>% 
  summarize(red = sum(color == "red")) %>% 
  mutate(prop_red = red / 25)

# 1.c) Plot distribution via a histogram
ggplot(virtual_prop_red_25, aes(x = prop_red)) +
  geom_histogram(binwidth = 0.05, boundary = 0.4, color = "white") +
  labs(x = "Proportion of 25 balls that were red", title = "25") 

# Segment 2: sample size = 50 ------------------------------
# 2.a) Virtually use shovel 1000 times
virtual_samples_50 <- bowl %>% 
  rep_sample_n(size = 50, reps = 1000)

# 2.b) Compute resulting 1000 replicates of proportion red
virtual_prop_red_50 <- virtual_samples_50 %>% 
  group_by(replicate) %>% 
  summarize(red = sum(color == "red")) %>% 
  mutate(prop_red = red / 50)

# 2.c) Plot distribution via a histogram
ggplot(virtual_prop_red_50, aes(x = prop_red)) +
  geom_histogram(binwidth = 0.05, boundary = 0.4, color = "white") +
  labs(x = "Proportion of 50 balls that were red", title = "50")  

# Segment 3: sample size = 100 ------------------------------
# 3.a) Virtually using shovel with 100 slots 1000 times
virtual_samples_100 <- bowl %>% 
  rep_sample_n(size = 100, reps = 1000)

# 3.b) Compute resulting 1000 replicates of proportion red
virtual_prop_red_100 <- virtual_samples_100 %>% 
  group_by(replicate) %>% 
  summarize(red = sum(color == "red")) %>% 
  mutate(prop_red = red / 100)

# 3.c) Plot distribution via a histogram
ggplot(virtual_prop_red_100, aes(x = prop_red)) +
  geom_histogram(binwidth = 0.05, boundary = 0.4, color = "white") +
  labs(x = "Proportion of 100 balls that were red", title = "100") 


# n = 25
virtual_prop_red_25 %>% 
  summarize(sd = sd(prop_red))

# n = 50
virtual_prop_red_50 %>% 
  summarize(sd = sd(prop_red))

# n = 100
virtual_prop_red_100 %>% 
  summarize(sd = sd(prop_red))

############################3
#sampling dist of the mean
############################

IQ.1 <- round( rnorm(n=5, mean=100, sd=15 ))
IQ.1
mean(IQ.1)
IQ.2 <- round( rnorm(n=5, mean=100, sd=15 ))
mean(IQ.2)

#lets say i do this 10,000 times and plot the means

#erage of 5 IQ scores is usually between 90 and 110. But more importantly, what it highlights is that if
#we replicate an experiment over and over again, what we end up with is a distribution of sample means!
#  This distribution has a special name in statistics: it’s called the sampling distribution of the mean.


#######
##CI
#######


library(dplyr)
library(ggplot2)
library(janitor) # learn more about this!
library(moderndive)
library(infer)  # 


pennies_sample

#lets say we want to know ean age of all US pennies from this data collected in 2011


ggplot(pennies_sample, aes(x = age_in_2011)) +
  geom_histogram(bins = 10,fill = "blue", color = "red")

#where does the mean value fall for this sample? 
#e.g. the point estiamte

x_bar <- pennies_sample %>% 
  summarize(x_bar = mean(age_in_2011))
x_bar

#now, if we had all the pennies we could do this again by sampling the same amount and getting a point esiamte
#but we dont...

#think of EXAMPLES of this in your work!!!!!! what is the sample and what is the population


#computer gives us a great way of wokring this out via a bootstrap

#The process of bootstrapping allows us to use a single sample to 
#generate many different samples that will act as our way of
#approximating a sampling distribution using a created bootstrap 
#distribution instead. We will pull ourselves up from our bootstraps
#using a single sample (pennies_sample) to get an idea of the grander
#sampling distribution.

#basics
#1. sample w/ replacement from our original sample
#2. make new samples of the same size


bootstrap_sample1 <- pennies_sample %>% 
  rep_sample_n(size = 40, replace = TRUE, reps = 1)
bootstrap_sample1

ggplot(bootstrap_sample1, aes(x = age_in_2011)) +
  geom_histogram(bins = 10, color = "white")

#what is the sample mean of tis new sample

bootstrap_sample1 %>% 
  summarize(x_bar = mean(age_in_2011))


#First, pretend that each of the 40 values of age_in_2011 in pennies_sample were written 
#on a small piece of paper. Recall that these values were 6, 30, 34, 19, 6, etc.
#Now, put the 40 small pieces of paper into a receptacle such as a baseball cap.
#Shake up the pieces of paper.
#Draw “at random” from the cap to select one piece of paper.
#Write down the value on this piece of paper. Say that it is 28.
#Now, place this piece of paper containing 28 back into the cap.
#Draw “at random” again from the cap to select a piece of paper. Note that this is the sampling with replacement part since you may draw 28 again.
#Repeat this process until you have drawn 40 pieces of paper and written down the values on these 40 pieces of paper. Completing this repetition produces ONE bootstrap sample.

#lets say we want more than one bootstrap

six_bootstrap_samples <- pennies_sample %>% 
  rep_sample_n(size = 40, replace = TRUE, reps = 6)

six_bootstrap_samples %>% 
  group_by(replicate) %>% 
  summarize(mean = mean(age_in_2011))

ggplot(six_bootstrap_samples, aes(x = age_in_2011)) +
  geom_histogram(bins = 10, color = "white") +
  facet_wrap(~ replicate) 


#Instead of doing this six times, we could do it 1000 times 
#and then look at the distribution of stat across all 1000 of 
#the replicates. This sets the stage for the infer R package (Bray et al. 2018)
#that was created to help users perform statistical inference such as confidence intervals 
#and hypothesis tests using verbs similar to what you’ve seen with dplyr. We’ll walk through 
#setting up each of the infer verbs for confidence intervals using this pennies_sample example,
#while also explaining the purpose of the verbs in a general framework.


#To begin to create a confidence interval for the population 
#mean age of US pennies in 2011, we start by using specify()
#to choose which variable in our pennies_sample data we’d 
#like to work with. This can be done in one of two ways:

pennies_sample %>% 
  specify(response = age_in_2011)


#After specify()ing the variables we’d like in our
#inferential analysis, we next feed that into the
#generate() verb. The generate() verb’s main argument is 
#reps, which is used to give how many different repetitions
#one would like to perform. Another argument here is type,
#which is automatically determined by the kinds of variables
#passed into specify(). We can also be explicit and set this 
#type to be type = "bootstrap". This type argument will be
#further used in hypothesis testing in Chapter 10 as well.
#Make sure to check out ?generate to see the options here 
#and use the ? operator to better understand other verbs as well.


#Let’s generate() 1000 bootstrap samples:

thousand_bootstrap_samples <- pennies_sample %>% 
  specify(response = age_in_2011) %>% 
  generate(reps = 1000)

thousand_bootstrap_samples %>% 
  count(replicate)

#Notice that each replicate has 40 entries here.
#Now that we have 1000 different bootstrap samples,
#our next step is to calculate the bootstrap statistics
#for each sample.


#After generate()ing many different samples,
#we next want to condense those samples down into a 
#single statistic for each replicated sample. 
#As seen in the diagram, the calculate() function is helpful here.

#As we did at the beginning of this chapter, 
#we now want to calculate the mean age_in_2011 
#for each bootstrap sample. To do so, we use the 
#stat argument and set it to "mean" below. The stat 
#argument has a variety of different options here and 
#we will see further examples of this throughout the 
#remaining chapters.

bootstrap_distribution <- pennies_sample %>% 
  specify(response = age_in_2011) %>% 
  generate(reps = 1000) %>% 
  calculate(stat = "mean")

bootstrap_distribution 

#Just as group_by() %>% summarize() produces a useful workflow 
#in dplyr, we can also use specify() %>% calculate() to compute 
#summary measures on our original sample data. It’s often helpful 
#both in confidence interval calculations, but also in hypothesis testing to 
#identify what the corresponding statistic is in the original data.
#For our example on penny age, we computed above a value of x_bar using the
#summarize() verb in dplyr:

#The visualize() verb provides a simple way to view the bootstrap distribution
#as a histogram of the stat variable values. It has many other arguments that
#one can use as well including the shading of the histogram values 
#corresponding to the confidence interval values.


bootstrap_distribution %>% 
  visualize()

#In this case, we can see that the bootstrap
#distribution provides us a guess as to what the 
#variability in different sample means may look 
#like only using the original sample as our guide

###show 

#https://d33wubrfki0l68.cloudfront.net/85fc78237377abd7436bd44a27b35c09353217df/e7f74/images/flowcharts/infer/ci_diagram.png

#now lets make a CI

#bootstrapign will givee us a dist that has the center be the orignal mean

bootstrap_distribution %>% 
  visualize(obs_stat = x_bar)
bootstrap_distribution %>% 
  visualize(obs_stat = x_bar, color = "orange")





bootstrap_distribution %>% 
  summarize(mean_of_means = mean(stat))


percentile_ci <- bootstrap_distribution %>% 
  get_ci(level = 0.95, type = "percentile")


percentile_ci 

bootstrap_distribution %>% 
  visualize(endpoints = percentile_ci, direction = "between")


###is this accurate?


ggplot(pennies, aes(x = age_in_2011)) +
  geom_histogram(bins = 10, color = "white")

pennies %>% 
  summarize(mean_age = mean(age_in_2011),
            median_age = median(age_in_2011))

pennies_sample %>% 
  summarize(mean_age = mean(age_in_2011), median_age = median(age_in_2011))

#Let’s assume that pennies represents our population of interest. 
#We can then create a sampling distribution for the population mean age of pennies,
#denoted by the Greek letter   #μ, using the rep_sample_n() function seen
#in Chapter 8. First we will create 1000 samples from the pennies data frame.


thousand_samples <- pennies %>% 
  rep_sample_n(size = 40, reps = 1000, replace = FALSE)

#When creating a sampling distribution,
#we do not replace the items when we create each sample
#This is in contrast to the bootstrap distribution
#It’s important to remember that the sampling distribution is sampling without 
#replacement from the population to better understand sample-to-sample variability, 
#whereas the bootstrap distribution is sampling with replacement from our
#original sample to better understand potential sample-to-sample variability.


sampling_distribution <- thousand_samples %>% 
  group_by(replicate) %>% 
  summarize(stat = mean(age_in_2011))

ggplot(sampling_distribution, aes(x = stat)) +
  geom_histogram(bins = 10, fill = "salmon", color = "white")

sampling_distribution %>% 
  summarize(se = sd(stat))


bootstrap_distribution %>% 
  visualize(bins = 10, fill = "blue")


#Interpreting the confidence interval

#lets take another 40 sample from the larger dataset


pennies_sample2 <- pennies %>% 
  sample_n(size = 40)

percentile_ci2 <- pennies_sample2 %>% 
  specify(formula = age_in_2011 ~ NULL) %>% 
  generate(reps = 1000) %>% 
  calculate(stat = "mean") %>% 
  get_ci()

percentile_ci2

#does the new ci also conatin the vlue of mu
