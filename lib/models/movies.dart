class Movie {
  final String id;
  final String title;
  final String runTime;
  final String description;
  final String posterPath;
  final String showTime;
  final String ageRating;
  final double price;



  const Movie({
    required this.id,
    required this.title,
    required this.runTime,
    required this.description,
    required this.posterPath,
    required this.showTime,
    required this.ageRating,
    required this.price,
  });

  String get formattedPrice {
    final String formattedValue = price.toStringAsFixed(2);
    return '£$formattedValue';
  }

  bool get isChildFriendly {
    return ageRating == 'U' || ageRating == 'PG';
  }

  bool get isAdultOnly {
    return ageRating == '18';
  }
}