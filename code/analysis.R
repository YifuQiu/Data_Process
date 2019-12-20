# Code used in the Exploratory Data Analysis section

library(dplyr)
library(ggplot2)
library(GGally) # ggpairs
library(tibble) # rownames_to_column
library(fmsb) # Radar chart

data <- readRDS(file = "data/data.rds")

# Correlations between the variables
analysis1 <- function() {
  ggpairs(data)
}

# Correlation between the features and popularity
analysis2 <- function() {
  corrs <- data %>%
    select(-mode_name) %>% 
    cor() %>%
    data.frame() %>%
    select(corr = popularity) %>%
    rownames_to_column("variable") %>%
    filter(variable != "popularity") %>%
    arrange(corr) %>%
    mutate(variable = factor(variable, levels = variable))
  
  ggplot(corrs) +
    geom_point(mapping = aes(x = variable, y = corr)) +
    coord_flip() +
    geom_hline(yintercept = 0) +
    ylim(-.8, .8) +
    ggtitle("Correlation between features and popularity") +
    labs(x = "Feature", y = "Correlation")
}

# Relationship between key and mode
analysis3 <- function() {
  ggplot(data) +
    geom_bar(mapping = aes(x = key, fill = mode_name))
}

# Distribution of popularity
analysis4 <- function() {
  ggplot(data, aes(x=popularity)) +
    geom_histogram(binwidth=1, color="black", fill="cyan") +
    geom_vline(aes(xintercept=mean(popularity)), color="red", linetype="dashed", size=1) +
    ggtitle("Distribution of popularity")
}

# Distribution of popularity by mode
analysis5 <- function() {
  ggplot(data) +
    geom_histogram(mapping = aes(x = popularity, fill = mode_name)) +
    ggtitle("Distribution of popularity by mode")
}
