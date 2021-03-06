# Calculate Simpson's diversity in R

# Load a required package to make data table
library(data.table)

# Create simulated values that are reproducible.
set.seed(5)

# Make random data table with permutation and replacement
# rows are by convention sample number or observations and columns are taxa (e.g. species)
randsampl <- data.table(data= matrix(sample(x=0:50,size = 10000, replace = TRUE), nrow = 10, ncol = 1000))

# Find the column indexes with positive number of species
idx <- which(randsampl[1,1:ncol(randsampl)]>0)

# Calculate the Simpson's diversity index for the first sample (first row of randsampl)
row_number <- 1
simp_div <- 1- sum((randsampl[row_number,..idx])*(randsampl[row_number,..idx]-1))/(sum(randsampl[row_number,])*sum(randsampl[row_number,])-1)

# To calculate the Simpson divertsity index for all samples it can be done using a for loop as follows:
for (i in 1:nrow(randsampl)){
    simp_div[i] <- 1- sum((randsampl[i,..idx])*(randsampl[i,..idx]-1))/(sum(randsampl[i,])*sum(randsampl[i,]-1))
}
    
