library(vegan)

# Load one generation file (example: generation 800)
dat <- read.csv("all e1 gen800.csv")

# Sample 400 individuals
samp <- dat[sample(1:nrow(dat), 400), ]

# Manhattan distance on genetic markers (gm1–gm20)
dd <- dist(samp[, 18:37], method = "manhattan")

# NMDS ordination
mymds <- metaMDS(dd, trymax = 50)

# Plot NMDS coloured by population
plot(mymds$points,
     col = as.numeric(samp$pop),
     pch = 16,
     main = "NMDS Population Structure",
     xlab = "NMDS1", ylab = "NMDS2")

legend("topright",
       legend = unique(samp$pop),
       col = unique(as.numeric(samp$pop)),
       pch = 16,
       title = "Population")
