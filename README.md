# Lithuanian Biobank

### Overview

This data analysis project aims to provide insights into the samples of Lithuanian NVI biobank over the years 2018 to 2022. By analyzing various aspects of the stored samples I aimed to identify trends and gain a deeper understanding of the stored samples and how they might reflect Lithuanian patient's health parameters. 

<img width="781" alt="Plots" src="https://github.com/szubaviciute/Lithuanian-Biobank/assets/159541216/f2165978-0fae-4e2a-8cc7-e14ef3eb5f98">

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

### Results

The analysis results are summarized as follows:
1. The most common origin of stored samples in 15-54 and 65-85+ age brackets are kidneys, however prostate samples dominate in 55-64 age groups
2. The stored sample count during the years increased from males, however such increase was not observed from female samples. Furthermore, prostate and kidney sample storage quickly increased from male patient's, but not necessarily from female patient's
3. Most of the stored samples at Lithuania's NVI biobank came to be cancerous

### Recommendations

Based on the performed analysis, it seems that:

1. Lithuanian's might likely suffer from kidney cancer, while specifically males tend to develop prostate cancer, thus prevention programs for kidney and prostate cancer should be implemented in the future
2. Males might tend to neglect their well being, concluding their increase in cancer developmenent, thus health providers should implement cancer prevention action programs specifically for male patients
3. Healthy lifestyle and cancer prevention programs should be encouraged more to prevent this heavy diagnosis

### Limitations

The Lithuania's NVI Biobank is the biggest cancerous sample database, however other hospitals might also have data on patient's cancer/non-cancer diagnosis. Thus having more datasets from other Lithuania's hospitals would be an advantage for future analysis to gather more insights on Lithuanian's well being

### References

- https://www.r-bloggers.com/2023/08/the-substring-function-in-r/
