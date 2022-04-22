import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';
import 'package:movie_app/widgets/underlined_text.dart';

import '../providers/movie.dart';

class MoviesGridScreen extends StatelessWidget {
  final List moviesData;
  final String title;
  const MoviesGridScreen({
    Key? key,
    required this.title,
    required this.moviesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 25.0),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 20.0),
                  UnderlinedText(title: title),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: moviesData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MovieDetailScreen(movie: moviesData[index]);
                        }));
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${moviesData[index].imageUrl}",
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: SizedBox(
                              child: Text(
                                moviesData[index].title,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
