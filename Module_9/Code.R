# Assignment #9
# Visualization in R – Base Graphics, Lattice, and ggplot2

# -----------------------------
# 1. Load dataset
# -----------------------------
data("iris", package = "datasets")
head(iris)
str(iris)

# -----------------------------
# 2. Load required packages
# -----------------------------
if (!require(lattice)) install.packages("lattice", dependencies = TRUE)
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)

library(lattice)
library(ggplot2)

# -----------------------------
# 3. Base R Graphics
# -----------------------------

# Base Plot 1: Scatter plot
plot(
  iris$Sepal.Length, iris$Petal.Length,
  col = as.numeric(iris$Species),
  pch = 19,
  main = "Base R: Sepal Length vs Petal Length",
  xlab = "Sepal Length",
  ylab = "Petal Length"
)
legend(
  "topleft",
  legend = levels(iris$Species),
  col = 1:3,
  pch = 19,
  title = "Species"
)

# Base Plot 2: Histogram
hist(
  iris$Sepal.Width,
  main = "Base R: Distribution of Sepal Width",
  xlab = "Sepal Width",
  col = "lightblue",
  border = "white"
)

png("base_scatter.png", width = 800, height = 600)
plot(
  iris$Sepal.Length, iris$Petal.Length,
  col = as.numeric(iris$Species),
  pch = 19,
  main = "Base R: Sepal Length vs Petal Length",
  xlab = "Sepal Length",
  ylab = "Petal Length"
)
legend(
  "topleft",
  legend = levels(iris$Species),
  col = 1:3,
  pch = 19,
  title = "Species"
)
dev.off()

png("base_histogram.png", width = 800, height = 600)
hist(
  iris$Sepal.Width,
  main = "Base R: Distribution of Sepal Width",
  xlab = "Sepal Width",
  col = "lightblue",
  border = "white"
)
dev.off()

# -----------------------------
# 4. Lattice Graphics
# Use conditioned or multivariate plots
# -----------------------------

# Lattice Plot 1: Conditioned scatter plot
xyplot(
  Petal.Length ~ Sepal.Length | Species,
  data = iris,
  type = c("p", "r"),
  main = "Lattice: Petal Length vs Sepal Length by Species",
  xlab = "Sepal Length",
  ylab = "Petal Length",
  layout = c(3, 1)
)

# Lattice Plot 2: Boxplot by species
bwplot(
  Sepal.Width ~ Species,
  data = iris,
  main = "Lattice: Sepal Width by Species",
  xlab = "Species",
  ylab = "Sepal Width"
)

png("lattice_scatter.png", width = 1000, height = 500)
print(
  xyplot(
    Petal.Length ~ Sepal.Length | Species,
    data = iris,
    type = c("p", "r"),
    main = "Lattice: Petal Length vs Sepal Length by Species",
    xlab = "Sepal Length",
    ylab = "Petal Length",
    layout = c(3, 1)
  )
)
dev.off()

png("lattice_boxplot.png", width = 800, height = 600)
print(
  bwplot(
    Sepal.Width ~ Species,
    data = iris,
    main = "Lattice: Sepal Width by Species",
    xlab = "Species",
    ylab = "Sepal Width"
  )
)
dev.off()

# -----------------------------
# 5. ggplot2 Graphics
# Create layered visuals
# -----------------------------

# ggplot2 Plot 1: Scatter plot with smoothing
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "ggplot2: Petal Length vs Sepal Length with Trend by Species",
    x = "Sepal Length",
    y = "Petal Length"
  ) +
  theme_minimal()

# ggplot2 Plot 2: Faceted histogram
ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.2, color = "black") +
  facet_wrap(~ Species) +
  labs(
    title = "ggplot2: Sepal Width Distribution by Species",
    x = "Sepal Width",
    y = "Count"
  ) +
  theme_minimal()

# Save ggplot2 plots
p1 <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "ggplot2: Petal Length vs Sepal Length with Trend by Species",
    x = "Sepal Length",
    y = "Petal Length"
  ) +
  theme_minimal()

ggsave("ggplot_scatter.png", plot = p1, width = 8, height = 6)

p2 <- ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.2, color = "black") +
  facet_wrap(~ Species) +
  labs(
    title = "ggplot2: Sepal Width Distribution by Species",
    x = "Sepal Width",
    y = "Count"
  ) +
  theme_minimal()

ggsave("ggplot_histogram.png", plot = p2, width = 8, height = 6)
