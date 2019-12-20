library(caret)
library(e1071)
library(Metrics)
library(ggplot2)

data <- readRDS(file = "data/data.rds")

# Fit a linear model
linear_model <- function() {
  model <- lm(popularity ~ danceability + key*mode_name + loudness + 
                acousticness + instrumentalness + tempo + duration_ms, data = data)
  summary(model)
}

# Split the data into training and test sets
set.seed(42)
trainIndex <- createDataPartition(data$popularity,
                                  p = .8,
                                  list = FALSE,
                                  times = 1
)
training_set <- data[trainIndex,]
test_set <- data[-trainIndex,]

# Cross-validation
fitControl <- trainControl(
  method = "cv",
  number = 10
)

# Grid search to find the best value for mtry
grid <- expand.grid(mtry=c(1:11))

# Fit a random forest model
fit <- train(
  popularity ~ danceability + key*mode_name + loudness + 
    acousticness + instrumentalness + tempo + duration_ms,
  data = training_set,
  method = "rf",
  metric = "RMSE",
  trControl = fitControl,
  tuneGrid = grid,
  preProcess = "range"
)

# Use the test set to make predictions
preds <- predict(fit, test_set)

# Compute the RMSE
error <- rmse(test_set$popularity, preds)

# Plot RMSE vs mtry
plot_rmse <- function() {
  ggplot(fit$results) +
    geom_point(mapping = aes(x = mtry, y = RMSE)) +
    ggtitle("RMSE in training") +
    labs(x = "mtry", y = "RMSE")
}

# Plot observed vs predicted data
plot_results <- function() {
  ggplot(test_set) +
    geom_point(mapping = aes(x = popularity, y = preds)) +
    geom_abline() +
    ggtitle("Observed vs predicted values") +
    labs(x="Observed popularity", y="Predicted popularity")
}