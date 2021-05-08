class Movie {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final int releaseDate;
  final double rating;
  final String category;

  Movie(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.releaseDate,
      required this.rating,
      required this.category});
}
