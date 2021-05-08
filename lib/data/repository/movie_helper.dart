import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/dummy_data.dart';
import 'package:flutter_movies_app_ex/data/models/movie_model.dart';

class MovieRepository extends ChangeNotifier {
  List<Movie> moviesList = [];

  addMovie(int id, String name,String imageUrl,String description, int releaseDate,double rating,String category) {
    Movie movie = Movie(id: id, name: name, imageUrl: imageUrl, description: description, releaseDate: releaseDate, rating: rating, category: category);
    moviesList.add(movie);
    DUMMY_DATA.add(movie);
    notifyListeners();
  }

  removeMovie(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  editMovie (Movie movie, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [movie]);
    notifyListeners();
  }
}
