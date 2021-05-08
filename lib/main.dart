import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/screens/add_new_movie_screen.dart';
import 'package:flutter_movies_app_ex/screens/edit_movie_screen.dart';
import 'package:flutter_movies_app_ex/screens/movie_details_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
          )
        )

      ),
      home: HomeScreen(),
      routes: {
        MovieDetailsScreen.routeName: (ctx) => MovieDetailsScreen(),
        AddNewMovieScreen.routeName: (ctx) => AddNewMovieScreen(),
        EditMovieScreen.routeName: (ctx) => EditMovieScreen(),
      },
    );
  }
}

