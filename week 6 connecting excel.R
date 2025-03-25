library(googlesheets4)
library(dplyr)

# 你的 Google Sheets 連結
gs_url <- "https://docs.google.com/spreadsheets/d/1o9l5Zim_LqcHhSuMbQ7Jc89_80erjzGFh4LCFSofbaw/edit"

# 建立新 Sheet 並寫入 travel_summary
sheet_write(travel_summary, ss = gs_url, sheet = "Travel Summary")

# 你的 Google Sheets 連結
gs_url <- "https://docs.google.com/spreadsheets/d/1o9l5Zim_LqcHhSuMbQ7Jc89_80erjzGFh4LCFSofbaw/edit"

# 上傳 reshaped_travel_data 到新的 Sheet
sheet_write(reshaped_travel_data, ss = gs_url, sheet = "Reshaped Travel Data")