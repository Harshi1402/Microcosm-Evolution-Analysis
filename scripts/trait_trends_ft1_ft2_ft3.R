# Trends of ft1, ft2, ft3 over time

folder_path <- "all files/"

ft1_values <- c()
ft2_values <- c()
ft3_values <- c()
generations <- c()

for (gen in 1:2500) {
  file_name <- file.path(folder_path, paste0("all e1 gen", gen, ".csv"))
  if (!file.exists(file_name)) next

  dat <- read.csv(file_name)

  ft1_values <- c(ft1_values, mean(dat$ft1, na.rm = TRUE))
  ft2_values <- c(ft2_values, mean(dat$ft2, na.rm = TRUE))
  ft3_values <- c(ft3_values, mean(dat$ft3, na.rm = TRUE))
  generations <- c(generations, gen)
}

matplot(generations,
        cbind(ft1_values, ft2_values, ft3_values),
        type = "l", lty = 1,
        col = c("red", "blue", "darkgreen"),
        xlab = "Generation", ylab = "Mean trait",
        main = "ft1, ft2, ft3 over time")

legend("topright",
       legend = c("ft1", "ft2", "ft3"),
       col = c("red", "blue", "darkgreen"),
       lty = 1)
