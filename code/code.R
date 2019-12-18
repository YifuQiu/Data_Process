# Libraries
library(spotifyr)
library(tidyverse)
library(ggplot2)

# Authentication
client_id <- paste(readLines("../keys/client_id.txt"), collapse=" ")
client_secret <- paste(readLines("../keys/client_secret.txt"), collapse=" ")
Sys.setenv(SPOTIFY_CLIENT_ID = client_id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = client_secret)
access_token <- get_spotify_access_token()

data <- get_artist_audio_features('the beatles', include_groups = c('album', 'single'))
artists <- c('queen','eminem')
for (artist in artists){
  audio_features <- get_artist_audio_features(artist, include_groups = c('album', 'single'))
  data <- rbind(data, audio_features)
}

data <- data %>% 
  select(danceability, energy, key, loudness, speechiness, acousticness, instrumentalness, liveness, valence, tempo, track_id, mode_name)

