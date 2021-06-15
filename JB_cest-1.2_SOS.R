library(tidyverse)
library(ggbeeswarm)
theme_set(theme_classic())

#initial dataset

N2_a <-c(4.21,7.28,2.02,10.46,20.15,7.12,5.46,1.78,2.95,4.17,2.88,3.45,3.06,11.94,1.68,12.02,2.26,3.99,5.78,2.69)
cest1.2_a <- c(2.45,2.03,9.97,9.73,15.15,17.95,3.60,2.96,3.49,4.71,2.92,2.31,6.01,3.90,14.53,1.50,8.87,2.83,6.52,3.65)

tibble(genotype = rep(c("N2_a", "cest1.2_a"), each = 20), 
       time = c(N2_a,cest1.2_a)) %>%
  ggplot(aes(x = genotype, y = time)) +
  geom_boxplot(aes(fill = genotype), alpha = 0.5) +
  geom_quasirandom(width = 0.1) +
  #scale_fill_brewer(palette = "PuOr")
  scale_fill_manual(values = c("darkorchid3", "darkorange2"))

mean(N2_a)
mean(cest1.2_a)

#repeated data

N2_b <- c(6.39,7.02,4.23,8.59,3.14,11.44,5.88,2.71,2.83,6.49,9.89,5.09,9.18,7.56,2.03,13.18,1.05,7.27,20.01,9.92)
cest1.2_b <- c(5.18,8.02,12.32,3.88,3.76,9.17,11.95,11.52,5.49,2.60,5.77,6.43,5.03,2.19,6.39,3.43,8.83,3.85,5.54,15.79)

tibble(genotype = rep(c("N2_b", "cest1.2_b"), each = 20), 
       time = c(N2_b,cest1.2_b)) %>%
  ggplot(aes(x = genotype, y = time)) +
  geom_boxplot(aes(fill = genotype), alpha = 0.5) +
  geom_quasirandom(width = 0.1) +
  #scale_fill_brewer(palette = "PuOr")
  scale_fill_manual(values = c("darkorchid3", "darkorange2"))

mean(N2_b)
mean(cest1.2_b)
