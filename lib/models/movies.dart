
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String title = json['title'] as String;
    final String runTime = json['runTime'] as String;
    final String description = json['description'] as String;
    final String posterPath = json['posterPath'] as String;
    final String showTime = json['showTime'] as String;
    final String ageRating = json['ageRating'] as String;
    final double price = (json['price'] as num).toDouble();
  
    return Movie(
      id: id,
      title: title,
      runTime: runTime,
      description: description,
      posterPath: posterPath,
      showTime: showTime,
      ageRating: ageRating,
      price: price  
    );
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{
    'id': id,
    'title': title,
    'runTime': runTime,
    'description': description,
    'posterPath': posterPath,
    'showTime': showTime,
    'ageRating': ageRating,
    'price': price
  };
  return data;

  }
  String get formattedPrice {
    final String formattedValue = price.toStringAsFixed(2);
    return '£$formattedValue';
  }

  bool get isChildFriendly {
    return ageRating == 'U' || ageRating == 'PG' || ageRating == '12A';
  }

  bool get isAdultOnly {
    return ageRating == '18';
  }
}
