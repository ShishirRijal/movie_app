# Movie App | Flutter
Here goes a movie app build in flutter.
This application fetches moive and tv shows data from TMDB api and uses that data to render movies in screen.
In this sense, instead of dummy data, real data is fetched from the server.
It has 3 screens. The first one is homescreen in which we fetch data through TMDB api and show the movies/tv shows in the screen, as per their catergory.
Each category list is scrollable in horizontal direction, but limited to a fixed number. If one seeks for the entire movies in that catergoy, he/she can click on See All that leads to the movie grid screen. Moviegrid screen shows all movies/shows of that category. Also, all the movies in homescreen and gridscreen responds to touch. When touched, the detail screen of movie is opened. The detail screen shows detail information about the movie inclusing it's

1. poster image
2. title
3. release data
4. ratings
5. popularity
6. synopsis

Also, a button is built at the bottom of detail screen, which functions to book ticket of that movie.

## Screens
![home_screen](https://user-images.githubusercontent.com/63596895/164883047-b6de8de9-bb9c-49b3-bba5-b6c9cba0bfe9.jpg)
![detail_screen](https://user-images.githubusercontent.com/63596895/164883045-004b52b9-351e-4fd1-abfa-cefff5bf9186.jpg)
![movie_grid](https://user-images.githubusercontent.com/63596895/164883050-1a33c890-b948-4860-874d-5afe570b70f8.jpg)
