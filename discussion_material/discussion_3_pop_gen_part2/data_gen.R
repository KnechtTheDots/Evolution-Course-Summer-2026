# question 1 underdominance again

genotype <- rep(c(0,1,2), each = 50)

s0 <- sample(c(rep(0, 20), rep(1, 30)))

s1 <- sample(rep(c(0,1), each = 25))

s2 <- sample(c(rep(0, 10), rep(1, 40)))

write.csv(data.frame(genotype = genotype, survive = c(s0, s1, s2)),
          file = "discussion_material/discussion_3_pop_gen_part2/q1.csv")

# question 2

s0 <- sample(c(rep(0, 10), rep(1, 40)))
s1 <- sample(c(rep(0, 10), rep(1, 40)))
s2 <- sample(c(rep(c(0,1), each = 25)))

write.csv(data.frame(genotype = genotype, survive = c(s0, s1, s2)),
          file = "discussion_material/discussion_3_pop_gen_part2/q2.csv")

# question 3

new_york <- rbinom(150, 2, .25)
virginia <- rbinom(150, 2, .6)

write.csv(data.frame(genotype = c(new_york, virginia),
                     population = rep(c("new_york", "virginia"), each = 150)),
          file = "discussion_material/discussion_3_pop_gen_part2/q3.csv")

# question 6

s0 <- sample(c(rep(0, 20), rep(1, 30)))
s1 <- sample(c(rep(0, 10), rep(1, 40)))
s2 <- sample(c(rep(0, 5), rep(1, 45)))

write.csv(data.frame(genotype = genotype, survive = c(s0, s1, s2)),
          file = "discussion_material/discussion_3_pop_gen_part2/q6.csv")
