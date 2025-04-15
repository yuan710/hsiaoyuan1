library(tidyverse)

# 讀取原始資料（請把 "your_file.csv" 換成你的實際檔名）
raw_data <- read_csv("reshaped_travel_data_tidy")

# 資料清理與轉型
tidy_data <- raw_data |>
  # 移除首站抵達地為「全區」，或細分為「合計 Total」的行
  dplyr::filter(
    首站抵達地 != "全區",
    !str_detect(細分, "合計|Total")
  ) |>
  # 指定欄位型別
  mutate(
    首站抵達地 = as.factor(首站抵達地),
    細分 = as.factor(細分),
    Year = as.integer(Year),
    Number_of_Travelers = as.integer(Number_of_Travelers)
  )

reshaped_travel_data_tidy <- tidy_data

glimpse(reshaped_travel_data_tidy)
summary(reshaped_travel_data_tidy)

readr::write_csv(reshaped_travel_data_tidy, "reshaped_travel_data_tidy.csv")


