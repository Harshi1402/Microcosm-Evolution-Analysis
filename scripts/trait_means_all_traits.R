# Mean trajectories for all traits over time

folder_path <- "all files/"

meantraits <- list()

for (gen in 1:2500) {
  filename <- file.path(folder_path, paste0("all e1 gen", gen, ".csv"))
  if (!file.exists(filename)) next

  gendata <- tryCatch(
    read.csv(filename, header = TRUE),
    error = function(e) NULL
  )

  if (!is.null(gendata) && nrow(gendata) > 0) {
    meantrait_values <- colMeans(
      gendata[, c("ft1","ft2","ft3","ft4","ft5",
                  "mt1","mt2","mt3","mt4","mt5",
                  "sct1","sct2","sct3")],
      na.rm = TRUE
    )
    meantraits[[gen]] <- meantrait_values
  }
}

meanmatrix <- do.call(rbind, meantraits)

matplot(meanmatrix,
        type = "l", lty = 1,
        col = rainbow(ncol(meanmatrix)),
        xlab = "Generation", ylab = "Trait mean",
        main = "Trait means over time")

legend("topright",
       legend = colnames(meanmatrix),
       col = rainbow(ncol(meanmatrix)),
       lty = 1)
