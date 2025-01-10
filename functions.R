#### GENERAL FUNCTIONS SCRIPT ----

####FUNCTION DESCRIPTIVE_STATS: ----

#returns 2 data frames of:
##a. numerical descriptive statistics ("results_numeric")
##b. character descriptive statistics ("results_character")

descriptive_stats <- function(df) 
{
  
  #creating new data frame for subjects from user input
  is_valid <- FALSE
  while(!is_valid)
  {
    choice <- menu(c("All", "Certain Range"), title = "Choose range for descriptive statistics: ")
    if (choice == 1) 
    {
      df_new <- df
      is_valid = TRUE
    }
    else if (choice == 2)
    {
      message(paste("Possible range: ", 1, "-", nrow(df)))
      subject_start <- as.numeric(readline("Enter the starting index: "))
      subject_end <- as.numeric(readline("Enter the ending index: "))
      df_new <- data.frame(df[subject_start:subject_end,])
      is_valid = TRUE
    }
    else if(choice == 0)
    {
      return("Function averted")
    }
  }

  
  
  #condition to make sure enough data exists for statistics (>10)
  if(nrow(df_new) < 10) 
  {
    return("data is too short")
  }
  
  #setting empty variables
  results_numeric = data.frame()
  results_categorial = data.frame()
  temp = data.frame()
  
  #going through all column names
  for (name in names(df_new))
  {
    
    #condition for numeric variables:
    if(class(df_new[[name]]) == "numeric")
    {
      temp <- data.frame(
        variable = name,
        min = min(df_new[[name]]),
        max = max(df_new[[name]]),
        mean = mean(df_new[[name]]),
        sd = sd(df_new[[name]])
      )
      results_numeric = rbind(results_numeric, temp)
      temp = data.frame()
    }
    
    #condition for character variables:
    else if(class(df_new[[name]]) == "character")
    {
      temp_table <- table(df_new[[name]])
      counter = 1
      
      ##loop for categories in each character variable
      for(Levels in unique(df_new[[name]]))
      {
        
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