# Libraries
library(spotifyr)
library(dplyr)
library(ggplot2)

# Authentication
client_id <- paste(readLines("../keys/client_id.txt"), collapse=" ")
client_secret <- paste(readLines("../keys/client_secret.txt"), collapse=" ")
Sys.setenv(SPOTIFY_CLIENT_ID = client_id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = client_secret)

artists <- c('the beatles')
pop = c()
i = 1
for (artist in artists){
  audio_features <- get_artist_audio_features(artist, include_groups = c('album'))
  if (i == 1) {
    data <- audio_features
  } else {
    data <- rbind(data, audio_features)
  }
  for (id in audio_features$track_id){
    track <- get_track(id)
    pop[i] <- track$popularity
    i <- i + 1
  }
}

data <- data %>% 
  select(danceability, energy, key, loudness, speechiness, acousticness, instrumentalness, liveness, valence, tempo, track_id, mode_name, -track_id) %>% 
  mutate(popularity = pop)

saveRDS(data, file = "../data/data.rds")
