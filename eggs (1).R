
# This is a good start - I would recommend using the ggplot package for plotting as an alternative -
# once you pick it up it's way more flexible for plotting, see my additional code below

# list packages that need to be installed:
packages = c("tidyverse", "viridis")


# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
        install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))

# set working directory to the file location (there are better ways to do this we can discuss)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#df <- read.csv("eggs (cest-1.2).csv")
df <- read_csv("eggs (cest-1.2).csv")

glimpse(df)

#add a column for number of eggs:
df <- df %>%
        mutate(num_eggs = .[[3]] + .[[4]] + .[[5]], # this is using the column index so I don't have to type the names
               genotype = fct_relevel(genotype, "N2")) # this is to reorder the names for plotting


# ggplot method - with mean +/- sem
theme_set(theme_classic())
barplot <- df %>% ggplot(aes(x = genotype, y = num_eggs)) +
        geom_bar(stat = "identity") +

        
        
##stat_summary(stat = "mean", geom = "bar") +
##stat_summary(stat = "mean_se", geom = "errorbar", width = 0.5)
        
barplot
# ggplot method - bars are best for total counts, let's use a boxplot first
boxplot1 <- df %>% ggplot(aes(x = genotype, y = num_eggs)) +
        geom_boxplot() + # add boxplot layer
        geom_jitter(width = 0.1) # add scatter points layer
boxplot1

# split between mine and your data:
boxplot1 +
        facet_grid(.~observer)

##### seems like I had higher numbers for cest-1.2, yours were much closer

###### data by age:
### you can use a column to delineate the type of age,we just need to put the 3 columns into one
df %>% pivot_longer(cols = 3:5, names_to = "age", values_to = "number_eggs_bystage")


# now we can 'pipe' this into ggplot:
boxplot2 <- df %>% pivot_longer(cols = 3:5, names_to = "age", values_to = "number_eggs_bystage") %>%
        ggplot(aes(x = genotype, y = number_eggs_bystage)) +
        geom_boxplot() + # add boxplot layer
        geom_jitter(width = 0.1) + # add scatter points layer 
        facet_grid(observer~age)
boxplot2
# so from this it looks like the 0-4 is about the only consistent thing between the two of us, let's look at fraction 0-4:
# 

boxplot3 <- df %>% mutate(pct_young = `[0-4] eggs` / num_eggs) %>%
        ggplot(aes(x = genotype, y = pct_young)) +
        geom_boxplot() +
        geom_jitter(width = 0.1)
boxplot3

# now let's just add some color to the plots:
boxplot4 <- df %>% mutate(pct_young = `[0-4] eggs` / num_eggs) %>%
        ggplot(aes(x = genotype, y = pct_young)) +
        geom_boxplot(aes(fill = genotype)) +
        geom_jitter(width = 0.1) +
        scale_colour_brewer(palette = "Set2") +
        scale_fill_brewer(palette = "Set2") +
        facet_grid(.~observer)
boxplot4
# little bit of a difference between scoring, so we need to repeat
