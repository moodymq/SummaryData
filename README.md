# SummaryData
Simple R Program which compares user user defined summary data across a dataset separated by
a user defined factor.

Example usage:
sum_by_group(inputs = GPA, funcs = list("mean", "median"), groups = "gender")
             mean, gender = F median, gender = F mean, gender = M median, gender = M
GPA          3.145455         3.2                3.13             2.9               
Credit.Hours 3.818182         3                  3.3              3                 
