import 'package:flutter/material.dart';

import 'movie_card.dart';

class MovieList extends StatelessWidget {
  final List movies;
  final int count;
  const MovieList({
    Key? key,
    required this.movies,
    this.count = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movies.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 220.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return MovieCard(movie: movies[index]);
              },
              itemCount: count,
            ),
          );
  }
}
