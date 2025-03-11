# Codebook: Travelers Dataset

## Dataset Description

This dataset contains information on the number of travelers visiting various destinations over multiple years. The data includes the region, specific country, year, and the number of travelers recorded. Some missing values (NA) are present in earlier years.

## Variable Table
I use R program and follow tidyverse style, and the R for data science book (https://r4ds.had.co.nz/) closely. The data is imported as reshape_travel_data. How to parse variables accordingly

| Variable Name         | Class     | Description                                                 | Example Value |
|--------------|--------------|-----------------------------|--------------|
| `首站抵達地`          | factor | The broad region of the destination                         | "亞洲地區"    |
| `細分`                | factor | The specific country or sub-region of arrival               | "日本Japan"   |
| `Year`                | integer   | The year of recorded travel data                            | 2010          |
| `Number_of_Travelers` | integer   | The number of travelers (can contain NA for missing values) | 1377957       |

## Notes

-   The dataset is structured in a tidy format where each row represents a unique observation of traveler count per year for a given destination.
-   Some values in the `Number_of_Travelers` column are missing (NA), indicating unrecorded or unavailable data for certain years.
-   The dataset can be useful for analyzing trends in tourism across different years and regions.

------------------------------------------------------------------------

**Author:** [Your Name]\
**Date Created:** [Insert Date]
