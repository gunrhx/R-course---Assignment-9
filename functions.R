#### GENERAL FUNCTIONS SCRIPT ----

####FUNCTION DESCRIPTIVE_STATS: ----

#returns 2 data frames of:
##a. numerical descriptive statistics ("results_numeric")
##b. character descriptive statistics ("results_character")

descriptive_stats <- function(df) {
  
  #setting empty variables
  results_numeric = data.frame()
  results_categorial = data.frame()
  temp = data.frame()
  
  #loop for all column names
  for (name in names(df)) {
    
    #condition for numeric variables:
    if(class(df[[name]]) == "numeric") {
      temp <- data.frame(
        variable = name,
        min = min(df[[name]]),
        max = max(df[[name]]),
        mean = mean(df[[name]]),
        sd = sd(df[[name]])
      )
      results_numeric = rbind(results_numeric, temp)
      temp = data.frame()
    }
    
    #condition for character variables:
    else if(class(df[[name]]) == "character") {
      temp_table <- table(df[[name]])
      counter = 1
      
      ##loop for categories in each character variable
      for (Levels in unique(df[[name]])) {
        
        temp <- data.frame(
          variable = name,
          categories = Levels,
          frequency = temp_table[counter]
        )
        counter = counter + 1
        
        results_categorial = rbind(results_categorial, temp)
        temp = data.frame()
      }
    }
  }
  return(list(results_numeric, results_categorial))
}