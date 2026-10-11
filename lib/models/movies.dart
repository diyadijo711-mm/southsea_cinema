class Movie {
  final String id;
  final String title;
  final String runTime;
  final String description;
  final String posterPath;
  final DateTime showTime;

  const Movie({
    required this.id,
    required this.title,
    required this.runTime,
    required this.description,
    required this.posterPath,
    required this.showTime,
  });
}