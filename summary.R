library(tidyverse)

# 1. 顯示 factor 類別數量
reshape_travel_data |>
  count(首站抵達地) |>
  print()

reshape_travel_data |>
  count(細分) |>
  print()

# 2. Year 的範圍與總數
reshape_travel_data |>
  summarize(
    min_year = min(Year),
    max_year = max(Year),
    total_years = n_distinct(Year)
  )

# 3. Number_of_Travelers 的統計值
reshape_travel_data |>
  summarize(
    mean_travelers = mean(Number_of_Travelers, na.rm = TRUE),
    median_travelers = median(Number_of_Travelers, na.rm = TRUE),
    sd_travelers = sd(Number_of_Travelers, na.rm = TRUE),
    missing_values = sum(is.na(Number_of_Travelers))
  )

