library(tidyverse)
library(ggbeeswarm)
# Johannsen's seeds

d <- read.csv("lectures/lecture_4/Johannsen.dataset1.csv")


mod <- lm(d$mean.seed.progeny ~ d$class.seed.mother)

int <- mod$coefficients[[1]]
slope <- mod$coefficients[[2]]

d %>% 
  ggplot(aes(x = class.seed.mother, y = mean.seed.progeny)) +
  geom_point() +
  theme_classic() +
  labs(x = "Mother Seed Size",
       y = "Progeny Mean Seed Size") +
  theme(axis.title = element_text(size = 20))

ggsave("lectures/lecture_4/jhns1.png", device = "png",
       width = 12, height = 8)

d %>% 
  ggplot(aes(x = class.seed.mother, y = mean.seed.progeny)) +
  geom_point() +
  geom_abline(slope = slope, intercept = int, linewidth = 1, color = "grey") +
  theme_classic() +
  labs(x = "Mother Seed Size",
       y = "Progeny Mean Seed Size") +
  theme(axis.title = element_text(size = 20))

ggsave("lectures/lecture_4/jhns2.png", device = "png",
       width = 12, height = 8)


d2 <- read.csv("lectures/lecture_4/Johannsen.dataset2.csv")

d2



d2 %>% 
  mutate(tot = class.seed.progeny*freq) %>% 
  group_by(line) %>% 
  summarise(mu = sum(tot)/sum(freq)) %>% 
  ggplot(aes(x = line, y = mu)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Line",
       y = "Seed Size") +
  theme(axis.title = element_text(size = 20))

ggsave("lectures/lecture_4/jhns6.png", device = "png",
       width = 12, height = 8)

ao_only <- d2 %>% 
  filter(line %in% c("A", "O", "N", "B"))
line <- c()
for(i in 1:nrow(ao_only)){
  line <- c(line, rep(ao_only$line[i], ao_only$freq[i]))
}

size <- c()
for(i in 1:nrow(ao_only)){
  size <- c(size, rep(ao_only$class.seed.progeny[i], ao_only$freq[i]))
}
d <- data.frame(line = line, seed_size = size)

mu <- d %>% 
  group_by(line) %>% 
  summarise(mu = mean(seed_size))

d %>% 
  ggplot(aes(x = line, y = seed_size)) +
  geom_jitter(width = .25, color = "grey") +
  theme_minimal() +
  labs(x = "Line",
       y = "Seed Size") +
  theme(axis.title = element_text(size = 20))

ggsave("lectures/lecture_4/jhns3.png", device = "png",
       width = 12, height = 8)

d %>% 
  ggplot(aes(x = line, y = seed_size)) +
  geom_jitter(width = .25, color = "grey") +
  geom_point(data = mu, aes(x = line, y = mu), size = 4, color = "red") +
  theme_minimal() +
  labs(x = "Line",
       y = "Seed Size") +
  theme(axis.title = element_text(size = 20))
 
ggsave("lectures/lecture_4/jhns4.png", device = "png",
       width = 12, height = 8)

d %>% 
  ggplot(aes(x = line, y = seed_size)) +
  #geom_jitter(width = .25, color = "grey") +
  geom_point(data = mu, aes(x = line, y = mu), size = 4, color = "red") +
  theme_minimal() +
  labs(x = "Line",
       y = "Seed Size") +
  theme(axis.title = element_text(size = 20))
 
ggsave("lectures/lecture_4/jhns5.png", device = "png",
       width = 12, height = 8)

