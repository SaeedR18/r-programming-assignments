# Clean column names
clean_names_df <- function(df) {
  janitor::clean_names(df)
}

# Remove rows with missing values
drop_missing_df <- function(df) {
  na.omit(df)
}

# Summary of numeric columns
numeric_summary <- function(df) {
  numeric_cols <- df[sapply(df, is.numeric)]
  summary(numeric_cols)
}

# Count missing values
missing_count <- function(df) {
  colSums(is.na(df))
}

# Quick histogram
quick_histogram <- function(df, column_name) {
  ggplot2::ggplot(df, ggplot2::aes_string(x = column_name)) +
    ggplot2::geom_histogram(bins = 30) +
    ggplot2::labs(
      title = paste("Histogram of", column_name),
      x = column_name,
      y = "Frequency"
    )
}