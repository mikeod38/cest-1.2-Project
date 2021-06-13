library(tidyverse)
library(ggbeeswarm)
theme_set(theme_classic())
N2 <-c(4.21,7.28,2.02,10.46,20.15,7.12,5.46,1.78,2.95,4.17,2.88,3.45,3.06,11.94,1.68,12.02,2.26,3.99,5.78,2.69)
cest1.2 <- c(2.45,2.03,9.97,9.73,15.15,17.95,3.60,2.96,3.49,4.71,2.92,2.31,6.01,3.90,14.53,1.50,8.87,2.83,6.52,3.65)

tibble(genotype = rep(c("N2", "cest1.2"), each = 20), 
       time = c(N2,cest1.2)) %>%
  ggplot(aes(x = genotype, y = time)) +
  geom_boxplot(aes(fill = genotype), alpha = 0.5) +
  geom_quasirandom(width = 0.1) +
  #scale_fill_brewer(palette = "PuOr")
  scale_fill_manual(values = c("darkorchid3", "darkorange2"))

mean(N2)
mean(cest1.2)

t.test(N2, cest1.2)
