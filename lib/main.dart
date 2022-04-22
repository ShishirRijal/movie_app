import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/providers/movies.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyMovies>(
      create: (context) => MyMovies(),
      child: MaterialApp(
        // color: kPrimaryColor,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          backgroundColor: kPrimaryColor,
          primaryColor: kPrimaryColor,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
