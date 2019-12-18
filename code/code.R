# Libraries
library(spotifyr)
library(tidyverse)
library(ggplot2)
library(tidyr)

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


xd = get_artist_audio_features(artist = 'the beatles', include_groups = c("album", "single"), return_closest_artist = TRUE, dedupe_albums = TRUE,authorization = get_spotify_access_token())


cancion = get_track("183Klch3PBWLz2S6zNUVxR")
cancion$popularity

cancionFeatures = get_track(data$track_id)

test = get_artist_audio_features(artist = 'selena gomez', include_groups = c("album", "single"), return_closest_artist = TRUE, dedupe_albums = TRUE,authorization = get_spotify_access_token())




track_features = lapply(test$track_id, get_track)
track_features$popularity
test = test %>% mutate(popularity = track_features$popularity)



data <- data %>% 
  mutate(popularity = (lapply(data$track_id, get_track))$popularity)
