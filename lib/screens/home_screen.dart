import 'package:flutter/material.dart';
import 'package:movie_app/providers/movies.dart';
import 'package:movie_app/screens/movies_grid_screen.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../constants.dart';
import '../providers/movie.dart';
import '../widgets/appbar.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_list.dart';
import '../widgets/underlined_text.dart';
import 'movie_detail_screen.dart';

var myMovies = MyMovies();

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

    //   var topRatedMoviesData = await tmdbWithCustomLogs.v3.movies.topRated();
    //   var upcomingMoviesData = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    //   var moviesInTheatreData =
    //       await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    //   var popularTvShowsData = await tmdbWithCustomLogs.v3.tv.getPopular();

    //   setState(() {
    //     topRatedMovies = topRatedMoviesData['results'];
    //     upcomingMovies = upcomingMoviesData['results'];
    //     popularTvShows = popularTvShowsData['results'];
    //     nowPlaying = moviesInTheatreData['results'];
    //   });
  }

  @override
  void initState() {
    getMoviesData();
    myMovies.fetchMovieData().then((_) {
      setState(() {
        topRatedMovies = myMovies.topRatedMovies;
        popularTvShows = myMovies.popularTvShows;
        nowPlaying = myMovies.nowPlaying;
        upcomingMovies = myMovies.upcomingMovies;
      });
    });
    // Provider.of<MyMovies>(context, listen: false);
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
