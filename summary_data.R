library(dplyr)

summarise_variable <- function(data) {
  summary_list <- lapply(names(data), function(var) {
    column <- data[[var]]
    na_prop <- mean(is.na(column))
    
    if (is.numeric(column)) {
      summary_stats <- tibble(
        Mean = mean(column, na.rm = TRUE),
        Median = median(column, na.rm = TRUE),
        SD = sd(column, na.rm = TRUE),
        Max = max(column, na.rm = TRUE),
        Min = min(column, na.rm = TRUE),
        Range = Max - Min,
        NA_Proportion = na_prop
      )
    } else if (is.factor(column) || is.ordered(column)) {
      summary_stats <- data |>
        count(!!sym(var), name = "Frequency") |>
        mutate(NA_Proportion = na_prop)
    } else if (is.character(column)) {
      summary_stats <- tibble(
        Unique_Values = n_distinct(column),
        Count = n(),
        NA_Proportion = na_prop
      )
    } else if (inherits(column, "Date")) {
      summary_stats <- tibble(
        Min = min(column, na.rm = TRUE),
        Max = max(column, na.rm = TRUE),
        Range = as.numeric(difftime(Max, Min, units = "days")),
        NA_Proportion = na_prop
      )
    } else if (inherits(column, "POSIXct")) {
      summary_stats <- tibble(
        Min = min(column, na.rm = TRUE),
        Max = max(column, na.rm = TRUE),
        Range = difftime(Max, Min),
        Time_Interval = mean(diff(sort(unique(column))), na.rm = TRUE),
        NA_Proportion = na_prop
      )
    } else if (is.logical(column)) {
      summary_stats <- data |>
        count(!!sym(var), name = "Frequency") |>
        mutate(NA_Proportion = na_prop)
    } else {
      summary_stats <- tibble(Note = "Unsupported variable type", NA_Proportion = na_prop)
    }
    
    list(var = summary_stats)
  })
  
  names(summary_list) <- names(data)
  return(summary_list)
}

summary_results <- summarise_variable(reshaped_travel_data)

saveRDS(summary_results, file = "summary_data.Rds")