# module11_debug.R
# Debugging and Defensive Programming in R
# Author: Saeed Rahman

# ── Helper function ──────────────────────────────────────────────
tukey.outlier <- function(x, k = 1.5) {
  q1  <- quantile(x, 0.25, na.rm = TRUE)
  q3  <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  x < (q1 - k * iqr) | x > (q3 + k * iqr)
}

# ── Original buggy function (for reference) ──────────────────────
# Bug: && only evaluates the first element of a logical vector,
# causing the error: 'length = 10' in coercion to 'logical(1)'
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])  # bug: && instead of &
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# ── Corrected function with defensive checks ─────────────────────
corrected_tukey <- function(x) {
  if (!is.matrix(x)) {
    stop("x must be a matrix.")
  }
  if (!is.numeric(x)) {
    stop("x must be a numeric matrix.")
  }
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])   # fix: & for element-wise
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

# ── Test run ─────────────────────────────────────────────────────
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# Corrected output
corrected_tukey(test_mat)
# [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
