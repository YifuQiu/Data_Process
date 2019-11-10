# Domain of interest: music
## Interest in the field:
- TODO

## Examples of data driven project:
- [Spleeter](ttps://github.com/deezer/spleeter). Deep learning project that uses Tensorflow to make a source separation on music tracks. Its trained model can perform various flavour of separation.
- [Can We Predict the Outcome of Pitchfork Music Reviews?](https://towardsdatascience.com/can-we-predict-the-outcome-of-pitchfork-music-reviews-3b084d90c18f). It's a data analysis project that uses data from Pitchfork Music. It explores the relationship between several features (genre, artist, author, label) and the “Best New Music” distinction.
- [Sentiment analysis of musical taste: a cross-European comparison](http://paulelvers.com/post/emotionsineuropeanmusic/). A data analysis project that provides an emotion classification of top 50 music charts across Europe.

## Data-driven questions:
- What is the relationship between the duration of the song and its popularity?
- how songs popularity varies in time?
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


The second data set we found is about the most popular songs ranking. 
- We downloaded the data set from Kaggle. In this web site, we are free to download and share the data set.
- The data set we found was made by Eduardo. This data set collects the 200 most popular songs per day, the data spans from 1/1/2017 to 11/04/2017.
- The data set contains 1.048.576 observations and 7 features. Each column corresponds to the position (rank), track name, artist name, streams URL, date and region. We can explain that each row corresponds to the ranking of the song on that date.
- Using this data set, we can answer the second question. If we want to know the daily ranking of the song Chantaje, we can group the data set by date, filter the song Chantaje and obtain its position. We can plot a scatterplot figure to visualize the result, the horizontal axis of the figure should be the date and the vertical axis should be the position.
The data set is available online: 

  [Music Csv File](https://www.kaggle.com/edumucelli/spotifys-worldwide-daily-song-ranking/version/1/).
  
  or you can find the data set in the path Data_Process\data. Due to the size of the data set, it is divided into two part (music2-part1 and music2-part2)

