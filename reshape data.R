# 讀取 CSV 檔案
df <- readr::read_csv("歷年中華民國國民出國目的地人數統計2002-2024.csv")

# 轉換所有年份欄位為數字，確保格式一致
df <- df |> 
  dplyr::mutate(across(-c(`首站抵達地`, `細分`), as.numeric))

# 轉換為長格式
df_long <- df |> 
  tidyr::pivot_longer(
    cols = -c(`首站抵達地`, `細分`), # 排除前兩欄（地區與國家）
    names_to = "Year",  # 轉換年份為變數
    values_to = "Travelers"  # 轉換出國人數為變數
  ) |> 
  dplyr::mutate(Year = as.integer(Year)) # 確保 Year 是數字格式

# 查看整理後的數據
print(df_long)

write.csv(df_long, "df_long.csv", row.names = FALSE)


