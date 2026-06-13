library(tidyverse)
w_bar <- function(p, w11, w12, w22){
  q <- 1-p
  
  p^2*w11 + 2*p*q*w12 + q^2*w22
}

p_prime <- function(p, w11, w12, w22){
  q <- 1-p
  (p/w_bar(p, w11, w12, w22))*(p*w11 + q*w12)
}

# question 1

set.seed(120414)

#1.1

s0 <- sample(c(rep(0, 20), rep(1, 30)))
s1 <- sample(c(rep(1, 45), rep(0, 15)))
s2 <- sample(c(rep(1, 45), rep(0, 5)))

genotype <- c(rep(0, 50), rep(1, 60), rep(2, 50))
d <- data.frame(genotype = genotype, survive = c(s0, s1, s2))
d %>% 
  group_by(genotype) %>% 
  summarise(survive = mean(survive)) %>% 
  mutate(fit = survive/max(survive))

p_prime(.9, .667, .833, 1) - .9

write.csv(d,
          file = "exams/q1.1.csv")

#1.2

s0 <- sample(c(rep(0, 20), rep(1, 30)))
s1 <- sample(c(rep(0, 20), rep(1, 30)))
s2 <- sample(c(rep(1, 45), rep(0, 5)))

genotype <- c(rep(0, 50), rep(1, 50), rep(2, 50))
d <- data.frame(genotype = genotype, survive = c(s0, s1, s2))
d %>% 
  group_by(genotype) %>% 
  summarise(survive = mean(survive)) %>% 
  mutate(fit = survive/max(survive))


p_prime(.9, .667, .667, 1) - .9

write.csv(d,
          file = "exams/q1.2.csv")


#1.3


s0 <- sample(c(rep(0, 20), rep(1, 30)))
s1 <- sample(c(rep(1, 45), rep(0, 5)))
s2 <- sample(c(rep(1, 45), rep(0, 5)))

genotype <- c(rep(0, 50), rep(1, 50), rep(2, 50))
d <- data.frame(genotype = genotype, survive = c(s0, s1, s2))
d %>% 
  group_by(genotype) %>% 
  summarise(survive = mean(survive)) %>% 
  mutate(fit = survive/max(survive))

p_prime(.9, .667, 1, 1) - .9


write.csv(d,
          file = "exams/q1.3.csv")


# Question 2


s0 <- sample(c(rep(0, 20), rep(1, 30)))
s1 <- sample(c(rep(1, 45), rep(0, 5)))
s2 <- sample(c(rep(1, 45), rep(0, 15)))

genotype <- c(rep(0, 50), rep(1, 50), rep(2, 60))
d <- data.frame(genotype = genotype, survive = c(s0, s1, s2))
d %>% 
  group_by(genotype) %>% 
  summarise(survive = mean(survive)) %>% 
  mutate(fit = survive/max(survive))

curve(w_bar(x, .667, 1, .833))
(.833 - 1)/(.833 + .667 - 2)
abline(v = .334)
write.csv(d,
          file = "exams/q2.csv")


# 6

pop <- rep(c("pennsylvania", "kentucky"),each = 75)

penn <- rbinom(75, 2, .1)
kent <- rbinom(75, 2, .6)

d <- data.frame(genotype = c(penn, kent), population = pop)
write.csv(d, file = "exams/q6.csv")



