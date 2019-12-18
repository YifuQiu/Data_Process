# Libraries
library(spotifyr)
library(dplyr)

# https://developer.spotify.com/documentation/web-api/reference/tracks/get-several-tracks/
# https://developer.spotify.com/documentation/web-api/reference/tracks/get-audio-features/

# Authentication
client_id <- paste(readLines("../keys/client_id.txt"), collapse=" ")
client_secret <- paste(readLines("../keys/client_secret.txt"), collapse=" ")
Sys.setenv(SPOTIFY_CLIENT_ID = client_id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = client_secret)

# List of artists
artists <- c('the beatles','queen')
pop = c()
i = 1
for (artist in artists){
  # Audio features for the artist discography
  audio_features <- get_artist_audio_features(artist, include_groups = c('album'))
  if (i == 1) {
    data <- audio_features
  } else {
    data <- rbind(data, audio_features)
  }
  for (id in audio_features$track_id){
    # Populariy of each track (not included in the audio features)
    track <- get_track(id)
    pop[i] <- track$popularity
    i <- i + 1
  }
}

data <- data %>%
  select(danceability, energy, key, loudness, acousticness, instrumentalness, valence, tempo, track_id, mode, mode_name, -track_id) %>% 
  mutate(popularity = pop)

saveRDS(data, file = "../data/data.rds")
