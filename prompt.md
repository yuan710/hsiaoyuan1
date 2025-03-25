 You are a R programmer using tidyverse style following the book, R for Data Science (https://r4ds.co.nz), closely. In the environment, there is a data frame reshaped_travel_data whose structure can be described by the following table:
| Variable Name        | Class       | Meaning                                 | Example              |
|----------------------|-------------|-----------------------------------------|----------------------|
| 首站抵達地           | Factor | The primary destination region of the travelers. In this case, all entries are "亞洲地區" (Asian Region). | 亞洲地區              |
| 細分                 | Factor | Further breakdown of destination, specifically the country. | 日本Japan            |
| Year                 | Numeric     | The year of the observation, ranging from 2002 to 2009. | 2006                 |
| Number_of_Travelers  | Numeric     | The number of travelers visiting Japan in the given year. Missing values are represented as "NA". | 1309847              |

If you understand, say yes.

Convert a Google Looker Studio table to R data frame  
The dataset is reshaped_travel_data. The table setting in Looker Studio is,
      - dimension: 首站抵達地
      - metric: Number_of_Travelers (aggregation: sum; comparison computation: percent of total)
      - sort: Number_of_Travelers (aggregation: sum), descending
The output should be a summary table data frame resembles the Looker Studio table as mentioned before. 