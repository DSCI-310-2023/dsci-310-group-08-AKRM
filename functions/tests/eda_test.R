source("functions/EDA.R")



x <- read_dataset("https://raw.githubusercontent.com/abheetkansal/Dataset/main/crimedata_csv_AllNeighbourhoods_2022.csv", "functions/tests/test_Dataset.csv")
y <- read.csv("functions/tests/test_comparison.csv")
z <- EDA(y, c("YEAR", "MONTH", "HOUR"), "YEAR" > 0 & "X" > 0)

testthat::expect_equal(x,y)

test_df <- data.frame(col1 = c(1, 2, 3),
                      col2 = c(4, 5, 6),
                      col3 = c(7, 8, 9))


eda_df <- EDA(test_df, select_cols = c("col1", "col2"), col1 > 1, col2 > 5)
expected_rows <- data.frame(col1 = 3, col2 = 6)


eda_df_2 <- EDA(test_df, select_cols = c("col1", "col2"))
expected_cols <- c("col1", "col2")

testthat::expect_equal(eda_df, expected_rows)
testthat::expect_equal(colnames(eda_df_2), expected_cols)
