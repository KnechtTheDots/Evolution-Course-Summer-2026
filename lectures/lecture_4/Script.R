library(lme4)
library(ggplot2)
library(dplyr, warn.conflicts = FALSE)
library(lmtest)

# Suppress summarise info
options(dplyr.summarise.inform = FALSE)

Johannsen.dataset1 <- read.csv("Johannsen.dataset1.csv")
Johannsen.dataset2 <- read.csv("Johannsen.dataset2.csv")

# 1. Heterogeneity among lines in seed weight variability ------------------

#  For text
mean.std.by.line <- Johannsen.dataset1 %>% group_by(line) %>% summarize(mean.std = mean(stdev.seed.progeny))

summary(mean.std.by.line$mean.std)

f0 <- lm(stdev.seed.progeny ~ mean.seed.progeny + line, data = Johannsen.dataset1)
summary(f0)
f1 <- lm(stdev.seed.progeny ~ mean.seed.progeny , data = Johannsen.dataset1)
summary(f1)

lrtest(f0, f1)
rm(f0, f1)

# Analyses based on Uebersichtstabelle I (p.25), named Dataset2 in article -----------

Johannsen.dataset2 <- read_xlsx("Johannsen.data.xlsx", sheet ="Dataset2")

# Variance partitioning ---------------

fs <- lmer(class.seed.progeny ~ 1 + (1|line), weights = freq, data = Johannsen.dataset2)

summary(fs)

medias <- Johannsen.dataset2 %>% group_by(line) %>% summarize(media = weighted.mean(class.seed.progeny, w = freq), weighted.std = sqrt(Hmisc::wtd.var(class.seed.progeny,freq)), total = sum(freq)) %>% mutate(CV = weighted.std/media)

#  Center to mean = 0
centered <- full_join(Johannsen.dataset2, medias) %>% mutate(centered = class.seed.progeny - media, relfreq = 100*freq / total)

fig1 <- ggplot(centered, aes(x = centered, y = relfreq, group=line, color = line)) + stat_smooth(se=FALSE) + theme_bw(20) + labs(x ="Seed mass deviation around mean (mg)", y = "Frequency (%)") + theme(legend.position = "none",legend.key = element_blank(), strip.background = element_blank())

print(fig1)
ggsave(fig1, file ="Fig.1.pdf", width = 8, height = 6)

# 2. Transgenerational effect of within-line variability in seed size --------------

# El peso medio de las semillas no solo depende de la línea, 
# sino también, to a lesser extent, de la clase de tamaño de la que procede

#  Likelihood ratio test within-line effect

f0 <- lm(mean.seed.progeny ~ 1 + line/class.seed.mother, data = Johannsen.dataset1)

f1 <- lm(mean.seed.progeny ~ 1 + line, data = Johannsen.dataset1)

lrtest(f0, f1)
rm(f0, f1)

# Effects within line, Fig. 2 -------------------

#  For figure caption
range(table(Johannsen.dataset1$line))
mean(table(Johannsen.dataset1$line))
sd(table(Johannsen.dataset1$line))/sqrt(length(Johannsen.dataset1$line))

fig2 <- ggplot(Johannsen.dataset1, aes(x=class.seed.mother, y=mean.seed.progeny, group=line, color=line)) + stat_smooth(se=FALSE, method ="lm", linewidth=1.5)  + theme_bw(20) + theme(legend.position = "none",legend.key = element_blank(), strip.background = element_blank())

fig2 <- fig2 + labs (x="F1 seed weight class (mg)", y ="Mean F2 seed weight (mg)")
print(fig2)

ggsave(fig2, file ="Fig.2.pdf", width = 8, height = 6)

# FIGURE 3 ---------------------

# Theme to make  plots transparent
transp <- theme(
  panel.background = element_rect(fill='transparent'), #transparent panel bg
  rect=element_rect(color = NA, fill="transparent"),
  panel.border = element_blank(),
  plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
  panel.grid.major = element_blank(), #remove major gridlines
  panel.grid.minor = element_blank(), #remove minor gridlines
  legend.background = element_rect(fill='transparent'), #transparent legend bg
  legend.box.background = element_rect(fill='transparent') #transparent legend panel
)

ene = 100
set.seed(10)

grid <- expand.grid(x = seq(from = 1, by = 1, l = sqrt(ene)), y = seq(from = 1, by = 1, l = sqrt(ene)))
grid$a <- rnorm(ene, mean = 20, sd = 5)
grid$b <- rnorm(ene, mean = 20, sd = 15)

# Round corners a bit for aesthetics
r = 5
circ.grid <- grid %>% filter(sqrt((x-r)^2 + (y-r)^2) < r )

(fig.3a <- ggplot(circ.grid, aes(x=x, y=y, size=a)) + geom_point(color="green4") + theme_void(25) + scale_size_area(limits=c(min(grid$b), max(grid$b))) + theme(legend.position="none")
)

fig.3a <- fig.3a + transp

ggsave(fig.3a, file ="fig.3a.png", width = 3, height =3)

(fig.3b <- ggplot(circ.grid, aes(x=x, y=y, color=b, size=b))  + geom_point(color="green4") + theme_void(25) + theme(legend.position="none"))

fig.3b <- fig.3b + transp

ggsave(fig.3b, file ="fig.3b.png", width = 3, height =3)

#  Density distributions for inset

distribs <- data.frame(a= rnorm(1e7, mean = 20, sd = 5), b = rnorm(1e7, mean = 20, sd = 15))

fig.distribs <- ggplot(distribs, aes(x = a )) + geom_density(linewidth=1.75, color="grey30", trim =TRUE) + geom_density(aes(x=b), linewidth=1.75, color="grey30", trim = TRUE) + theme_void(10) 

fig.distribs <- fig.distribs + annotate("text", x = 9, y = 0.05, label = "A", size=10) + annotate("text", x = -0.03, y = 0.018, label = "B", size=10) + transp

print(fig.distribs)

ggsave(fig.distribs, file ="fig.3c.png", width = 8, height = 6)

