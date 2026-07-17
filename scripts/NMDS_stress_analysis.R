library(vegan)

path <- "first100/"
generation_files <- list.files(path, pattern = "*.csv", full.names = TRUE)

stress_values <- numeric(length(generation_files))

for (gen in seq_along(generation_files)) {
  message("Processing generation: ", gen)
  dat <- read.csv(generation_files[gen])

  samp <- dat[sample(1:nrow(dat), 400), ]
  dd <- dist(samp[, 18:37], method = "manhattan")

  mymds <- metaMDS(dd, trymax = 50)
  stress_values[gen] <- mymds$stress
}

plot(stress_values, type = "b", col = "blue",
     main = "NMDS Stress Across Generations",
     xlab = "Generation", ylab = "Stress")
