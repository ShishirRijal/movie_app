import 'package:flutter/material.dart';
import 'package:movie_app/screens/movies_grid_screen.dart';
import 'package:movie_app/screens/trial.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../constants.dart';
import '../widgets/appbar.dart';
import '../widgets/movie_list.dart';
import '../widgets/underlined_text.dart';

// class MovieData {
//   final String title;
//   final List movies;
//   final String option;
//   MovieData(
//       {required this.title, required this.movies, this.option = 'See All'});
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ////
  static const String apiKey = "a0bcfbc8c44fb27ad1b30cfeaa07687b";
  static const String readAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMGJjZmJjOGM0NGZiMjdhZDFiMzBjZmVhYTA3Njg3YiIsInN1YiI6IjYyNjBmZDRlN2ZjYWIzMDA2NjZiMmY1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.L08KTjg79_80s8tQDTkW0eSUR2o0B4ZSyEHIvZpUuFE";
  final url = Uri.parse(
      'https://api.themoviedb.org/3/movie/550?api_key=a0bcfbc8c44fb27ad1b30cfeaa07687b');
  List topRatedMovies = [];
  List upcomingMovies = [];
  List popularTvShows = [];
  List nowPlaying = [];
  // List<MovieData> moviesData = []; ////
  void getMoviesData() async {
    final tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    var topRatedMoviesData = await tmdbWithCustomLogs.v3.movies.getTopRated();
    var upcomingMoviesData = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    var moviesInTheatreData =
        await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    var popularTvShowsData = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      topRatedMovies = topRatedMoviesData['results'];
      upcomingMovies = upcomingMoviesData['results'];
      popularTvShows = popularTvShowsData['results'];
      nowPlaying = moviesInTheatreData['results'];
      print(topRatedMoviesData);
      print("\n\n\n");
      print(popularTvShows);
    });

    // var moviesData = [
    //   MovieData(title: "Now In Cinemas", movies: nowPlaying),
    //   MovieData(title: "Top Rated", movies: topRatedMovies),
    //   MovieData(title: "Popular Tv Shows", movies: popularTvShows),
    //   MovieData(title: "Upcoming", movies: upcomingMovies),
    // ];
  }

  @override
  void initState() {
    getMoviesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyAppBar(),
              // const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildHeader("Now In Cinemas", "View All", nowPlaying),
                    const SizedBox(height: 15.0),
                    MovieList(movies: nowPlaying),
                    buildHeader("Top Rated", "View All", topRatedMovies),
                    const SizedBox(height: 15.0),
                    MovieList(movies: topRatedMovies),
                    buildHeader("Popular Tv Shows", "View All", popularTvShows),
                    const SizedBox(height: 15.0),
                    MovieList(movies: popularTvShows),
                    buildHeader("Upcoming", "View All", upcomingMovies),
                    const SizedBox(height: 15.0),
                    MovieList(movies: upcomingMovies),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildHeader(String title, String option, List movieList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UnderlinedText(
          title: title,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MoviesGridScreen(title: title, moviesData: movieList);
            }));
          },
          child: Text(
            option,
            style: kInactiveTextStyle,
          ),
        ),
      ],
    );
  }
}
