# Domain of interest: music
## Interest in the field:
- TODO

## Examples of data driven project:
- [Spleeter](ttps://github.com/deezer/spleeter). Deep learning project that uses Tensorflow to make a source separation on music tracks. Its trained model can perform various flavour of separation.
- [Can We Predict the Outcome of Pitchfork Music Reviews?](https://towardsdatascience.com/can-we-predict-the-outcome-of-pitchfork-music-reviews-3b084d90c18f). It's a data analysis project that uses data from Pitchfork Music. It explores the relationship between several features (genre, artist, author, label) and the “Best New Music” distinction.
- [Sentiment analysis of musical taste: a cross-European comparison](http://paulelvers.com/post/emotionsineuropeanmusic/). A data analysis project that provides an emotion classification of top 50 music charts across Europe.

## Data-driven questions:
- What is the relationship between the duration of the song and its popularity?
- What is the evolution of the popularity accross time?
- Are 'happy songs' more popular than 'sad songs'?

# Finding Data
[Spotify Web API](https://developer.spotify.com/documentation/web-api/)
- The data is collected directly from Spotify. The aritists themselves upload their music into the database.
- As it is a Web API, there is not a definite number of rows or columns in the dataset. It depends on the query. The documentation of the object model returned by the API can be found [here](https://developer.spotify.com/documentation/web-api/reference/object-model/).
- With this data, we could answer the first and last questions proposed.

[Music CSV File](https://think.cs.vt.edu/corgis/csv/music/).
- This library comes from the Million Song Dataset, which used a company called the Echo Nest to derive data points about one million popular contemporary songs. The Million Song Dataset is a collaboration between the Echo Nest and LabROSA, a laboratory working towards intelligent machine listening. The project was also funded in part by the National Science Foundation of America (NSF) to provide a large data set to evaluate research related to algorithms on a commercial size while promoting further research into the Music Information Retrieval field. The data contains standard information about the songs such as artist name, title, and year released. Additionally, the data contains more advanced information; for example, the length of the song, how many musical bars long the song is, and how long the fade in to the song was.
- There are 10,000 rows and 35 columns.
- With this dataset, we could solve the first question proposed.
