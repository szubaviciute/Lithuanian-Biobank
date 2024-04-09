# Preparation and data cleaning

# Importing libraries

library(dplyr)
library(tidyverse)
library(base)
library(lubridate)
library(ggplot2)
library(webr)

# Importing data

data <- read.table(file = "C:\\Users\\Simona\\Desktop\\Personal_Portfolio\\Biobank_LT\\biobank.txt", header = TRUE, sep = ',')

data

# Checking for the number of rows and columns in data set

glimpse(data)

# Merging the prefix and suffix to form ID

data$ID <- paste(data$emimprefix, data$megnrsuffix, sep = "")

data

# Cheking if all samples have unique ID

unique(data$ID)

# Removing duplicates to get clean data set

df <- data %>% distinct()

df

# Renaming columns from Lithuanian to English

df_renamed <-
df %>%
  rename(age_group = amzgr,
    sex = lytis,
    diagnosis = dgn,
    localization = lokalizacija,
    stored_sample = megpavad,
    container = indpavad,
    amount = kiekis,
    measurmement = vnt,
    year = megmetai
  )

df_renamed

# Removing not useful columns

df_full <- subset(df_renamed, select = -c(megmen, emimprefix, megnrsuffix))

df_full

# Changing diagnosis values to Cancerous and Non-Cancerous


df_full$diagnosis <- sub(".\\d+","Cancerous", df_full$diagnosis)

df_full


df_full$diagnosis <- sub("^$","Non-cancerous", df_full$diagnosis)

df_full


# Visualization

# Plot1

breaks_y = c(0, 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000)

plot1 <- ggplot(df_full, aes(x = age_group, fill = localization)) +
  geom_bar() +
  labs(x = "Age group", y = "Counts per Localization", title = "Stored Samples by Age Group in Lithuanian NVI Biobank", color = "Localization", fill = "Localization") +
  scale_y_continuous(limits = c(0, 4000), breaks = breaks_y) +
  scale_fill_discrete(labels=c("Gimdos kūnas" = "Uterus",
     "Inkstai" = "Kidneys",
     "Kiaušidės" = "Ovaries",
     "Krūtis" = "Breast",
     "Melanoma" = "Melanoma",
     "Plaučiai" = "Lungs",
     "Prostatos biopsija" = "Prostate biopsy",
     "Sėklidės" ="Testicles",
     "Žarnynas" ="Intestine")) +
  theme_bw() +
  theme(axis.text = element_text(size = 12),
    axis.title.y = element_text(size = 12, face ="bold"),
    axis.title.x = element_text(size = 12, face ="bold"),
    legend.title=element_text(size=12, face ="bold"),
    legend.text=element_text(size=12),
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(size = 14, face = "bold"))

plot1


# Plot2

breaks_y = c(0, 1000, 2000, 3000, 4000)

df_full_mod <- df_full %>%
  mutate(sex = recode(sex, "V" = "Male", "M" = "Female"))

plot2 <- ggplot(df_full_mod, aes(x = year, fill = localization)) +
  geom_bar() +
  facet_wrap(vars(sex)) +
  labs(x = "Year of Collection", y = "Counts per Localization", title = "Stored Samples by Sex in Lithuanian NVI Biobank", color = "Localization", fill = "Localization") +
  scale_y_continuous(limits = c(0, 4000, breaks = breaks_y)) +
  scale_fill_discrete(labels=c("Gimdos kūnas" = "Uterus",
     "Inkstai" = "Kidneys",
     "Kiaušidės" = "Ovaries",
     "Krūtis" = "Breast",
     "Melanoma" = "Melanoma",
     "Plaučiai" = "Lungs",
     "Prostatos biopsija" = "Prostate biopsy",
     "Sėklidės" ="Testicles",
     "Žarnynas" ="Intestine")) +
  theme_bw() +
  theme(axis.text = element_text(size = 12),
    axis.title.y = element_text(size = 12, face ="bold"),
    axis.title.x = element_text(size = 12, face ="bold"),
    legend.title=element_text(size=12, face ="bold"),
    legend.text=element_text(size=12),
    plot.title = element_text(size = 14, face = "bold"))

plot2 + coord_flip()


# Plot3

breaks_y = c(0, 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000)

plot3 <- ggplot(df_full, aes(x = age_group, fill = localization)) +
  geom_bar() +
  facet_wrap(vars(diagnosis)) +
  labs(x = "Age group", y = "Counts per Localization", title = "Stored Samples by Diagnosis and Age Group\nin Lithuanian NVI Biobank", color = "Localization", fill = "Localization") +
  scale_y_continuous(limits = c(0, 4000), breaks = breaks_y) +
  scale_fill_discrete(labels=c("Gimdos kūnas" = "Uterus",
     "Inkstai" = "Kidneys",
     "Kiaušidės" = "Ovaries",
     "Krūtis" = "Breast",
     "Melanoma" = "Melanoma",
     "Plaučiai" = "Lungs",
     "Prostatos biopsija" = "Prostate biopsy",
     "Sėklidės" ="Testicles",
     "Žarnynas" ="Intestine")) +
  theme_bw() +
  theme(axis.text = element_text(size = 10),
    axis.title.y = element_text(size = 12, face ="bold"),
    axis.title.x = element_text(size = 12, face ="bold"),
    legend.title=element_text(size=12, face ="bold"),
    legend.text=element_text(size=10),
    axis.text.x = element_text(angle = 90, hjust = 1),
    plot.title = element_text(size = 14, face = "bold"))

plot3
