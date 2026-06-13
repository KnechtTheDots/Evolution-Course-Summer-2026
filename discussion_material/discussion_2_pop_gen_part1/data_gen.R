# question 1
set.seed(12043012)

a1 <- sample(c("A1", "A2"), 100, replace = T, prob = c(.75,.25))
a2 <- sample(c("A1", "A2"), 100, replace = T, prob = c(.75,.25))

geno <- paste0(a1,a2)
d <- data.frame(individual = 1:length(geno), genotype = geno)
write.csv(d, "discussion_material/discussion_2_pop_gen_part1/question_1.csv", quote = F,row.names = F)

# solution

sum((a1=="A2")*1 + (a2=="A2")*1)/200


# question 2

sample(0:2, 200, replace = T, prob = c(.2, .3, .5))



wbar <- function(p, w1,w2,w3){
  q <- 1-p
  wmax <- max(c(w1,w2,w3))
  w1 <- w1/wmax
  w2 <- w2/wmax
  w3 <- w3/wmax
  p^2*w1 + 2*p*q*w2 + q^2*w3
}

curve(wbar(x, .9, .5, .7), 0, 1)

genotype <- c(rep(0, 50), rep(1,50), rep(2, 50))
p <- c(rep(.9, 50), rep(.5,50), rep(.7, 50))
survive <- rbinom(150, 1, p)

library(tidyverse)

data.frame(genotype, survive) %>% 
  group_by(genotype) %>% 
  summarise(p = mean(survive))

d <- data.frame(genotype, survive)
write.csv(d, "discussion_material/discussion_2_pop_gen_part1/q5.csv")

# answers

#q1
tot <- 1200

a1 <- (290 + .5*410 + .5*100)/tot

a1

a2 <- (100 + .5*410 + .5*230)/tot
a2

a3 <- (70 + .5*100 + .5*230)/tot

a1*a1*tot
2*a1*a2*tot
2*a1*a3*tot
a2*a2*tot
2*a2*a3*tot
a3*a3*tot


#q2

2*.01*.99/(.01^2)


# functions for q3-5

wbar <- function(p, w1,w2,w3){
  q <- 1-p
  wmax <- max(c(w1,w2,w3))
  w1 <- w1/wmax
  w2 <- w2/wmax
  w3 <- w3/wmax
  p^2*w1 + 2*p*q*w2 + q^2*w3
}


#q3

d <- read.csv("discussion_material/discussion_2_pop_gen_part1/q3.csv")

geno <- 0:2
survival <- c()
for(i in 1:3){
  survival[i] <- mean(d$survive[d$genotype==geno[i]])
}

curve(wbar(x, survival[1], survival[2], survival[3]), 0,1)

relfit <- survival/max(survival)

(.2/wbar(.2, survival[1],survival[2], survival[3]))*(.2*relfit[1] + .8*relfit[2]) - .2

(.8/wbar(.8, survival[1],survival[2], survival[3]))*(.8*relfit[1] + .2*relfit[2]) - .8

#q4

d <- read.csv("discussion_material/discussion_2_pop_gen_part1/q4.csv")

geno <- 0:2
survival <- c()
for(i in 1:3){
  survival[i] <- mean(d$survive[d$genotype==geno[i]])
}

curve(wbar(x, survival[1], survival[2], survival[3]), 0,1)

relfit <- survival/max(survival)

abline(v = (relfit[3]-1)/(relfit[1] + relfit[3] - 2))
(.2/wbar(.2, survival[1],survival[2], survival[3]))*(.2*relfit[1] + .8*relfit[2]) - .2

(.8/wbar(.8, survival[1],survival[2], survival[3]))*(.8*relfit[1] + .2*relfit[2]) - .8


# q5


d <- read.csv("discussion_material/discussion_2_pop_gen_part1/q5.csv")

geno <- 0:2
survival <- c()
for(i in 1:3){
  survival[i] <- mean(d$survive[d$genotype==geno[i]])
}

curve(wbar(x, survival[1], survival[2], survival[3]), 0,1)

relfit <- survival/max(survival)

(.2/wbar(.2, survival[1],survival[2], survival[3]))*(.2*relfit[1] + .8*relfit[2]) - .2

(.8/wbar(.8, survival[1],survival[2], survival[3]))*(.8*relfit[1] + .2*relfit[2]) - .8

relfit <- survival/survival[2]
