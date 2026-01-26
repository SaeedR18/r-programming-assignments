# r-programming-assignments

**Name:** Saeed Rahman  
**Course:** LIS4370  
**Description:** Repository for R Programming Assignments

## Module 2 – myMean Function Debugging

### Error from testing myMean
When running `myMean(assignment2)`, the following error occurred:

Error in myMean(assignment2) : object 'assignment' not found

### Explanation
The function fails because it references variables named `assignment` and `someData`, which do not exist. The function argument is named `assignment2`, but it is not used inside the function body. Because of this mismatch in variable names, R cannot find the object `assignment` and throws an error.

### Corrected Function
```r
myMean <- function(assignment2) {
  sum(assignment2) / length(assignment2)
}
