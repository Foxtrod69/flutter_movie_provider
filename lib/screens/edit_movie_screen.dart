import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/movie_model.dart';
import 'package:flutter_movies_app_ex/data/repository/movie_helper.dart';

class EditMovieScreen extends StatefulWidget {
  static const routeName = "/edit-movie-screen";

  @override
  _EditMovieScreenState createState() => _EditMovieScreenState();
}

class _EditMovieScreenState extends State<EditMovieScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController movieID;
  late TextEditingController movieName;
  late TextEditingController movieDescription;
  late TextEditingController movieRating;
  late TextEditingController movieReleaseDate;
  late TextEditingController movieCategory;
  late TextEditingController movieUrl;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Movie movie = parsedData["movie"];
    final int index = parsedData["index"];
    movieID = TextEditingController(text: movie.id.toString());
    movieName = TextEditingController(text: movie.name);
    movieDescription = TextEditingController(text: movie.description);
    movieCategory = TextEditingController(text: movie.category);
    movieReleaseDate = TextEditingController(text: movie.releaseDate.toString());
    movieRating = TextEditingController(text: movie.rating.toString());
    movieUrl = TextEditingController(text: movie.imageUrl);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: movieID,
                    decoration: InputDecoration(hintText: "Please enter id"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid id";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: movieName,
                    decoration: InputDecoration(hintText: "Please enter title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid title";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: movieUrl,
                    decoration: InputDecoration(hintText: "Please enter url"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid url";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: movieDescription,
                    decoration:
                        InputDecoration(hintText: "Please enter description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid description";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: movieRating,
                    decoration:
                        InputDecoration(hintText: "Please enter rating"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid rating";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: movieReleaseDate,
                    decoration:
                        InputDecoration(hintText: "Please enter release date"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid release date";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: movieCategory,
                    decoration:
                        InputDecoration(hintText: "Please enter category"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid category";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Movie movie = Movie(
                            id: int.parse(movieID.text),
                            name: movieName.text,
                            imageUrl: movieUrl.text,
                            description: movieDescription.text,
                            releaseDate: int.parse(movieReleaseDate.text),
                            rating: double.parse(movieRating.text),
                            category: movieCategory.text,
                          );
                          MovieRepository().editMovie(movie, index);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Add"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
