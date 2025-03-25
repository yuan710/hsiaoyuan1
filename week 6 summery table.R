library(ggplot2)
library(dplyr)

# 計算不同首站抵達地的旅客人數佔比
travel_summary <- reshaped_travel_data |>
  group_by(首站抵達地) |>
  summarise(Total_Travelers = sum(Number_of_Travelers, na.rm = TRUE)) |>
  ungroup() |>
  mutate(Percentage = (Total_Travelers / sum(Total_Travelers)) * 100)

# 繪製直條圖
print(ggplot(travel_summary, aes(x = 首站抵達地, y = Percentage, fill = 首站抵達地)) +
  geom_col() +
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), vjust = -0.5) +
  labs(title = "不同首站抵達地的旅客人數佔比",
       x = "首站抵達地",
       y = "旅客佔比 (%)") +
  theme_minimal() +
  theme(legend.position = "none"))