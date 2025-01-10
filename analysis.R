#clearing environment
rm(list = ls())

#### CREATING VARIABLES ----

N =  20 #as.numeric(readline("enter number of subjects to be generated: "))
df <- data.frame(
  subject = 1:N,
  age = floor(runif(N, 18, 60)),
  gender = sample(c("male", "female"), N, TRUE),
  avg_rt = runif(N, 200, 6000),
  depression = rnorm(N, 50, 20),
  avg_sleep_time = rnorm(N, 7, 2)
)
source("G:/Other computers/My Laptop/עומרי אוניברסיטה/תואר שני/1היכרות עם R/מטלות/מטלה 10/functions.R")
descriptive_stats(df)
