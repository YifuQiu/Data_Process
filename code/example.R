# Example from https://www.rcharlie.com/spotifyr/
# sudo apt-get install libssl-dev
# sudo apt-get install libcurl4-openssl-dev
# install.packages('spotifyr')
library(spotifyr)
library(readr)
library(stringr)
library(tidyverse)
library(knitr)
library(ggjoy)

# Authentication
client_id <- paste(readLines("../keys/client_id.txt"), collapse=" ")
client_secret <- paste(readLines("../keys/client_secret.txt"), collapse=" ")
Sys.setenv(SPOTIFY_CLIENT_ID = client_id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = client_secret)
access_token <- get_spotify_access_token()

# What was The Beatles’ favorite key?
beatles <- get_artist_audio_features('the beatles')

# What’s the most joyful Joy Division song?
joy <- get_artist_audio_features('joy division')
joy %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(5) %>% 
  kable()

# Joyplot of the emotional rollercoasters that are Joy Division’s albums
ggplot(joy, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Joy Division's joy distributions", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")
