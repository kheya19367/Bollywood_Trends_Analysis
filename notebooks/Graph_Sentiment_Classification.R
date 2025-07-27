#' ---
#' title: "Sentiment Analysis Plots"
#' output: html_document
#' ---


#importing libraries
library(ggplot2)
library(dplyr)
library(tidyr)

df <- read.csv("your_system_path/classified_data.csv")
df$year_of_release <- as.integer(df$year_of_release) #storing years as integers instead of long 



#' ## Plot 1: Frequency of Thematic Sentiment Over The Years 

#+ plot1, fig.width=15.6, fig.height=8.9

df_long <- df %>%
  pivot_longer(cols = ends_with("_llm_label"),
               names_to = "theme",
               values_to = "label") %>%
  mutate(
    year_of_release = as.factor(year_of_release),
    theme = case_when(
      theme == "hindu_muslim_llm_label" ~ "Hindu-Muslim Relations",
      theme == "feminist_misogynistic_llm_label" ~ "Gender Dynamics",
      theme == "nationalism_llm_label" ~ "Nationalism",
      theme == "caste_dynamics_llm_label" ~ "Caste Dynamics"
    )
  )


ggplot(df_long, aes(x = year_of_release, fill = label)) +
  geom_bar(position = "stack", width = 0.7) +
  facet_wrap(~theme, scales = "free_y") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal(base_size = 13) +
  labs(title = "Frequency of Thematic Sentiment in Bollywood Movies (2011–2019)",
       x = "Year of Release",
       y = "Number of Movies",
       fill = "LLM Sentiment Label") +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 14),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

#' ## Plot 2: Proportion of Sentiment Labels

#+ plot2, fig.width=15.6, fig.height=8.9
df_long <- df_long %>%
  mutate(
    year_of_release = as.numeric(as.character(year_of_release)),
    period = cut(
      year_of_release,
      breaks = seq(2010, 2020, by = 3),
      labels = c("2010–12", "2013–15", "2016–19"),
      right = TRUE
    )
  )

df_prop <- df_long %>%
  group_by(theme, period, label) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(theme, period) %>%
  mutate(prop = n / sum(n))

ggplot(df_prop, aes(x = period, y = prop, fill = label)) +
  geom_col(position = "fill", width = 0.7) +
  facet_wrap(~theme, scales = "free_y") +
  scale_fill_brewer(palette = "Pastel1") +
  theme_minimal(base_size = 13) +
  labs(title = "Proportion of Sentiment Labels by Theme (2010–Present)",
       x = "Release Period",
       y = "Proportion",
       fill = "Sentiment Label") +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 14),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

