import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class MovieDetailScreen extends StatelessWidget {
  final Map movie;
  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: mediaQuery.height * 0.6,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                colorFilter: const ColorFilter.mode(
                                    Colors.black26, BlendMode.darken),
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 8,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios_new,
                                  size: 30.0, color: Colors.white),
                            ),
                          ),
                          Positioned(
                            bottom: 70,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black.withOpacity(0.7),
                              ),
                              width: mediaQuery.width * 0.8,
                              child: Text(
                                movie['title'] ?? movie['name'],
                                style: kTitleTextStyle,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildText((movie['release_date'] ??
                                        movie['first_air_date'])
                                    .toString()
                                    .split('-')
                                    .first),
                                SizedBox(width: 20.0),
                                Image.asset(
                                  'assets/images/star.png',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.centerLeft,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(width: 3.0),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${movie['vote_average']}/10",
                                        style: kInactiveTextStyle),
                                    Text("${movie['vote_count']} ratings",
                                        style: kInactiveTextStyle),
                                  ],
                                ),
                                const SizedBox(width: 20.0),
                                Image.asset(
                                  'assets/images/popularity.png',
                                  fit: BoxFit.cover,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                    movie['popularity']
                                        .toString()
                                        .split('.')
                                        .first,
                                    style: kInactiveTextStyle),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Text("Storyline", style: kTitleTextStyle),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        width: mediaQuery.width * 0.75,
                        child: Text(
                          "${movie['overview']}\n",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // top: mediaQuery.height * 0.,
                bottom: 10,
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size(mediaQuery.width * 0.75, 50)),
                    overlayColor: MaterialStateProperty.all(Colors.yellow[700]),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow[800]),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Buy Ticket",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    // Book a ticket for me as well.. :)
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14.0, color: Colors.white70, fontFamily: 'Nunito'),
    );
  }
}
