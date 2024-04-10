# Lithuanian Biobank

### Overview

This data analysis project aims to provide insights into the samples of Lithuanian NVI biobank over the years 2018 to 2022. By analyzing various aspects of the stored samples I aimed to identify trends and gain a deeper understanding of the stored samples and how they might reflect Lithuanian patient's health parameters. 

### Data sources

The primary dataset used for this analysis is the "biobank.txt" file, containing detailed information about each sample stored at Lithuania's NVI Biobank. The data were collected from Lithuania's official data site https://data.gov.lt/datasets/2332/

### Tools
R studio - Data Cleaning, analysis and visualization

### Data Cleaning/Preparation

The initial data preparation phase included following tasks:

- Data loading and inspection
- Removing duplicates
- Renaming columns from Lithuanian to English
- Data cleaning and formatting

### Exploratory Data Analysis

EDA involved exploring the sample data to answer key questions, such as:

1. What are the most common localizations of stored samples by age group
2. How stored sample count changed during the years 2018-2022 by sex and localization
3. Whether stored samples by localization and age group were cancerous or not

### Data Analysis snippet

``` R
df_full$diagnosis <- sub(".\\d+","Cancerous", df_full$diagnosis)
df_full$diagnosis <- sub("^$","Non-cancerous", df_full$diagnosis)

df_full
```

