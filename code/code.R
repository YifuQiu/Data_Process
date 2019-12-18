library(ggplot2)

data <- readRDS(file = "../data/data.rds")

ggplot(data = data) +
  geom_boxplot(mapping = aes(x = mode_name, y = valence))

ggplot(data = data) +
  geom_point(mapping = aes(x = valence, y = popularity, color = mode_name))

ggplot(data = data) +
  geom_point(mapping = aes(x = tempo, y = popularity, color = mode_name))
