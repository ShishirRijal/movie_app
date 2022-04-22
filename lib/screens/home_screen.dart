import 'package:flutter/material.dart';
import 'package:movie_app/screens/movies_grid_screen.dart';
import '../constants.dart';
import '../models/movies.dart';
import '../widgets/appbar.dart';
import '../widgets/movie_list.dart';
import '../widgets/underlined_text.dart';

var myMovies = MyMovies();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List topRatedMovies = [];
  List upcomingMovies = [];
  List popularTvShows = [];
  List nowPlaying = [];

  @override
  void initState() {
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
