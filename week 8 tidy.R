library(dplyr)

reshaped_travel_data_tidy <- reshaped_travel_data |>
  filter(
    首站抵達地 != "全區",                            # 移除「全區」
    !stringr::str_detect(細分, "合計|Total")         # 移除「合計」、「Total」等字樣
  )