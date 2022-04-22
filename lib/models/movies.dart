import 'package:tmdb_api/tmdb_api.dart';
import '../models/movie.dart';

class MyMovies {
  List _topRatedMovies = [];
  List _upcomingMovies = [];
  List _popularTvShows = [];
  List _nowPlaying = [];

  get topRatedMovies {
    return [..._topRatedMovies];
  }

  get upcomingMovies {
    return [..._upcomingMovies];
  }

  get popularTvShows {
    return [..._popularTvShows];
  }

  get nowPlaying {
    return [..._nowPlaying];
  }

  Future<void> fetchMovieData() async {
    const String apiKey = "a0bcfbc8c44fb27ad1b30cfeaa07687b";
    const String readAccessToken =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMGJjZmJjOGM0NGZiMjdhZDFiMzBjZmVhYTA3Njg3YiIsInN1YiI6IjYyNjBmZDRlN2ZjYWIzMDA2NjZiMmY1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.L08KTjg79_80s8tQDTkW0eSUR2o0B4ZSyEHIvZpUuFE";

    final tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    await tmdbWithCustomLogs.v3.movies.getTopRated().then((movieMap) {
      var data = movieMap['results'];
      _topRatedMovies = fetchData(data);
    });
    await tmdbWithCustomLogs.v3.movies.getTopRated().then((movieMap) {
      var data = movieMap['results'];
      _topRatedMovies = fetchData(data);
    });
    await tmdbWithCustomLogs.v3.movies.getUpcoming().then((movieMap) {
      var data = movieMap['results'];
      _upcomingMovies = fetchData(data);
    });
    await tmdbWithCustomLogs.v3.movies.getNowPlaying().then((movieMap) {
      var data = movieMap['results'];
      _nowPlaying = fetchData(data);
    });
    await tmdbWithCustomLogs.v3.tv.getPopular().then((movieMap) {
      var data = movieMap['results'];
      _popularTvShows = fetchData(data);
    });

    // return [_nowPlaying, _popularTvShows, _topRatedMovies, _upcomingMovies];
  }

  List<Movie> fetchData(List<dynamic> data) {
    List<Movie> myList = [];
    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((movie) {
      myList.add(
        Movie(
          id: movie['id'].toString(),
          title: movie['title'] ?? movie['name'],
          imageUrl: movie['poster_path'],
          realeaseDate: (movie['release_date'] ?? movie['first_air_date'])
              .toString()
              .split('-')
              .first,
          popularity: movie['popularity'].toString(),
          rating: movie['vote_average'].toString(),
          votes: movie['vote_count'].toString(),
          synopsis: movie['overview'],
        ),
      );
    });
    return myList;
  }
}
