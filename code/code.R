library(dplyr)
library(ggplot2)
library(tibble)
library(caret)

set.seed(42)

data <- readRDS(file = "../data/data.rds")

ggplot(data = data) +
  geom_point(mapping = aes(x = danceability, y = valence))

ggplot(data = data) +
  geom_point(mapping = aes(x = energy, y = danceability))

ggplot(data = data) +
  geom_point(mapping = aes(x = valence, y = popularity, color = mode_name))

corrs <- data %>%
  select(-key, -mode_name, -mode) %>% 
  cor() %>%
  data.frame() %>%
  select(corr = popularity) %>%
  rownames_to_column("variable") %>%
  filter(variable != "popularity") %>%
  arrange(corr) %>%
  mutate(variable = factor(variable, levels = variable))

ggplot(data = data) +
  geom_point(mapping = aes(x = loudness, y = popularity))

ggplot(data = corrs) +
  geom_point(mapping = aes(x = variable, y = corr)) +
  coord_flip() +
  geom_hline(yintercept = 0) +
  ylim(-.8, .8) +
  ggtitle("Correlation between features and popularity") +
  labs(x = "Feature", y = "Correlation")
