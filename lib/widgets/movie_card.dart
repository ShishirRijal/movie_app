import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  // final double imageheight;
  // final double containerwidth;
  const MovieCard({
    Key? key,
    required this.movie,
    // this.imageheight = 160,
    // this.containerwidth = 130,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MovieDetailScreen(movie: movie);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(right: kPadding),
        width: 130,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                // height: imageheight,
                // width: containerwidth * 0.8,
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${movie.imageUrl}",
                ),
              ),
            ),
            SizedBox(
              // width: 120,
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
