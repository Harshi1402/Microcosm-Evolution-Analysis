# Fixation/loss of gm1 and gm20 at generation 800

gen800 <- read.csv("all e1 gen800.csv")

gm1_means  <- tapply(gen800$gm1,  gen800$pop, mean)
gm20_means <- tapply(gen800$gm20, gen800$pop, mean)

gm1_fixed_lost  <- sum(gm1_means  == 0 | gm1_means  == 2)
gm20_fixed_lost <- sum(gm20_means == 0 | gm20_means == 2)

cat("gm1 fixed or lost in",  gm1_fixed_lost,  "populations\n")
cat("gm20 fixed or lost in", gm20_fixed_lost, "populations\n")
