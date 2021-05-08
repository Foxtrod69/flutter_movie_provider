import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = "/details-screen";

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              children: [
                Image.network(movie.imageUrl),
                Text(movie.category),
                Text(movie.releaseDate.toString()),
                Text(movie.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
