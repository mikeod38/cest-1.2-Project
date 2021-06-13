library(tidyverse)

df <- read.csv("eggs(cest-1.2).repeat.csv")

df <- df %>%
  mutate(num_eggs = .[[3]] + .[[4]] + .[[5]], # this is using the column index so I don't have to type the names
         genotype = fct_relevel(genotype, "N2"))  # this is to reorder the names for plotting
 
boxplot1 <- df %>% ggplot(aes(x = genotype, y = num_eggs)) +
  geom_boxplot() + # add boxplot layer
  geom_jitter(width = 0.1) # add scatter points layer

boxplot1

df %>% pivot_longer(cols = 3:5, names_to = "age", values_to = "number_eggs_bystage")

boxplot2 <- df %>% pivot_longer(cols = 3:5, names_to = "age", values_to = "number_eggs_bystage") %>%
  ggplot(aes(x = genotype, y = number_eggs_bystage)) +
  geom_boxplot() + # add boxplot layer
  geom_jitter(width = 0.1) + # add scatter points layer
  facet_grid(.~age)

boxplot2

boxplot3 <- df %>% mutate(pct_young = under_4 / num_eggs) %>%
  ggplot(aes(x = genotype, y = pct_young)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)
boxplot3

#combined data

df1 <- subset(df, select = c(1:5))

df2 <- read.csv("eggs (cest-1.2).csv")

df3 <- bind_rows(df1, df2)

#plots same as above

df3 <- df3 %>%
  mutate(num_eggs = .[[3]] + .[[4]] + .[[5]],
         genotype = fct_relevel(genotype, "N2"))

boxplot4 <- df3 %>% ggplot(aes(x = genotype, y = num_eggs)) +
  geom_boxplot() + # add boxplot layer
  geom_jitter(width = 0.1) # add scatter points layer

boxplot4

df3 %>% pivot_longer(cols = 3:5, names_to = "age", values_to = "number_eggs_bystage")


boxplot5 <- df3 %>% pivot_longer(cols = 3:5, names_to = "age", values_to = "number_eggs_bystage") %>%
  ggplot(aes(x = genotype, y = number_eggs_bystage)) +
  geom_boxplot() + # add boxplot layer
  geom_jitter(width = 0.1) + # add scatter points layer
  facet_grid(.~age)

boxplot5

boxplot6 <- df3 %>% mutate(pct_young = under_4 / num_eggs) %>%
  ggplot(aes(x = genotype, y = pct_young)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)
boxplot6

#getting rid of 4-8 catagory 
 
df4 <- df3 %>% mutate(more_than_4 = .[[4]] + .[[5]])

df4 %>% pivot_longer(cols = c(3,7), names_to = "age", values_to = "number_eggs_bystage")


boxplot7 <- df4 %>% pivot_longer(cols = c(3,7) , names_to = "age", values_to = "number_eggs_bystage") %>%
  ggplot(aes(x = genotype, y = number_eggs_bystage)) +
  geom_boxplot() + # add boxplot layer
  geom_jitter(width = 0.1) + # add scatter points layer
  facet_grid(.~age) 
  
boxplot7

#same thing but with data only from 6/9

df5 <- df1 %>% mutate(more_than_4 = .[[4]] + .[[5]])

df5 %>% pivot_longer(cols = c(3,6), names_to = "age", values_to = "number_eggs_bystage")


boxplot8 <- df5 %>% pivot_longer(cols = c(3,6) , names_to = "age", values_to = "number_eggs_bystage") %>%
  ggplot(aes(x = genotype, y = number_eggs_bystage)) +
  geom_boxplot() + # add boxplot layer
  geom_jitter(width = 0.1) + # add scatter points layer
  facet_grid(.~age)

boxplot8




