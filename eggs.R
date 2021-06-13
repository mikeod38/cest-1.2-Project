df <- read.csv("eggs (cest-1.2).csv")
summary(df)

df$total_eggs <- df$X.0.4..eggs + df$X.4.8..eggs + df$X..8.eggs
df$LateStage_eggs <- df$X.4.8..eggs + df$X..8.eggs

N2.total <- mean(df$total_eggs[df$genotype == "N2"])
cest.total <- mean(df$total_eggs[df$genotype == "cest-1.2"])

par(mfrow = c(2,2))

barplot(c(N2.total,cest.total), names.arg = c("N2", "cest-1.2"), 
        ylab = "Number of Eggs in the Uterus")

N2.early <- mean(df$X.0.4..eggs[df$genotype == "N2"])
cest.early <- mean(df$X.0.4..eggs[df$genotype == "cest-1.2"])

N2.late <- mean(df$LateStage_eggs[df$genotype == "N2"])
cest.late <- mean(df$LateStage_eggs[df$genotype == "cest-1.2"])


#i don't know how to make grouped bar plots...

barplot(c(N2.early, N2.late, cest.early, cest.late), 
        names.arg = c("0-4", "> 4", "0-4", "> 4"), 
        xlab = "   N2                   cest-1.2"
        ,ylab = "Number of Eggs in Each Stage")

N2.percent.early <- sum(df$X.0.4..eggs[df$genotype == "N2"])/ 
        sum(df$total_eggs[df$genotype == "N2"]) * 100

cest.percent.early <- sum(df$X.0.4..eggs[df$genotype == "cest-1.2"])/ 
        sum(df$total_eggs[df$genotype == "cest-1.2"]) * 100

barplot(c(N2.percent.early, cest.percent.early), names.arg = c("N2", "cest-1.2")
        ,ylab = "Percent Early (0-4) Stage Eggs ")

