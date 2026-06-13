library(tidyverse)
library(cowplot)


# discussion 1 figures
# survival plots
set.seed(120414)
n <- 300
trait <- rnorm(n)
survive <- rbinom(n, 1, plogis(1.5*trait))
x <- seq(-3,3,l=100)
surv <- data.frame(x = x, y = plogis(1.5*x))

data.frame(trait = trait, survive = survive) %>% 
  ggplot(aes(x = trait, y = survive)) +
  geom_point(size = 3, color = "grey", alpha = .75) +
  geom_line(data = surv, aes(x = x, y = y), linewidth = 1) +
  labs(x = "Trait Value",
       y = "Probability of Survival") +
  theme(axis.title = element_text(size = 20, face = "bold"),
        axis.text = element_text(size = 12, face = "bold"),
        panel.background = element_rect(fill = "white"),
        panel.grid = element_line(color = scales::alpha(colour = "grey", alpha = .25)),
        axis.ticks = element_blank())

ggsave("discussion_material/discussion_1_simulating_selection/images/survival.png", device = "png",
       width = 12, height = 8)


data.frame(trait = trait, survive = ifelse(survive == 1, "Alive", "Dead")) %>% 
  mutate(survive = factor(survive, levels = c("Dead", "Alive"))) %>% 
  ggplot(aes(x = trait, fill = survive)) +
  geom_histogram(position = "stack", binwidth = .5, color = "black") +
  labs(x = "Trait Value",
       y = "Count") +
  scale_fill_manual(values = c("grey", "white")) +
  theme_classic() +
  theme(axis.title = element_text(size = 20, face = "bold"),
        axis.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank(),
        legend.text = element_text(size = 20))

ggsave("discussion_material/discussion_1_simulating_selection/images/stacked_hist.png", device = "png",
       width = 12, height = 8)

# simulating plants and herbivores

plants <- sample(1:20, 500, replace = T)
big <- sample(11:20, 500, replace = T)
small <- sample(1:10, 500, replace = T)

survive <- (plants < big & plants > small)*1

data.frame(plants, survive) %>% 
  group_by(plants) %>% 
  summarise(p = mean(survive)) %>% 
  ggplot(aes(x = plants, y = p)) +
  geom_line() +
  geom_point()

ggsave("discussion_material/discussion_1_simulating_selection/images/sim_surv.png", device="png",
       width = 12, height = 8)

data.frame(plants, survive) %>% 
  ggplot(aes(x = plants, fill = factor(survive))) +
  geom_histogram(, position = "stack", binwidth = 2, color = "black") +
  scale_fill_manual(values = c("grey", "white")) +
  theme_classic() +
  theme(axis.title = element_text(size = 20, face = "bold"),
        axis.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank(),
        legend.text = element_text(size = 20))

ggsave("discussion_material/discussion_1_simulating_selection/images/sim_stack.png", device="png",
       width = 12, height = 8)

data.frame(plants, survive) %>% 
  mutate(dist = (plants - 10.5)^2) %>% 
  group_by(dist) %>% 
  summarise(p = mean(survive)) %>% 
  ggplot(aes(x = dist, y = p)) +
  geom_line() +
  geom_point() +
  labs(x = "squared distance from mean",
       y = "Proportion Survived")

ggsave("discussion_material/discussion_1_simulating_selection/images/sim_dist.png", device="png",
       width = 12, height = 8)



