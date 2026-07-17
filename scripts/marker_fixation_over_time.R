# First generation where any marker becomes fixed or lost in population 1

folder_path <- "all files/"
marker_columns <- paste0("gm", 1:20)

first_fixed_gen   <- NA
first_fixed_marker <- NA
first_lost_gen    <- NA
first_lost_marker  <- NA

for (gen in 1:2500) {
  filename <- file.path(folder_path, paste0("all e1 gen", gen, ".csv"))
  if (!file.exists(filename)) next

  gen_data <- read.csv(filename)
  pop1_data <- gen_data[gen_data$pop == 1, ]

  for (marker in marker_columns) {
    n2 <- sum(pop1_data[[marker]] == 2)
    n1 <- sum(pop1_data[[marker]] == 1)
    N  <- nrow(pop1_data)

    if (N == 0) next

    freq <- (2 * n2 + n1) / (2 * N)

    if (is.na(first_fixed_gen) && freq == 1) {
      first_fixed_gen    <- gen
      first_fixed_marker <- marker
    }
    if (is.na(first_lost_gen) && freq == 0) {
      first_lost_gen    <- gen
      first_lost_marker <- marker
    }

    if (!is.na(first_fixed_gen) && !is.na(first_lost_gen)) break
  }

  if (!is.na(first_fixed_gen) && !is.na(first_lost_gen)) break
}

cat("First fixed marker:", first_fixed_marker,
    "at generation:", first_fixed_gen, "\n")
cat("First lost marker:", first_lost_marker,
    "at generation:", first_lost_gen, "\n")
