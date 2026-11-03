import 'dart:convert';
import 'package:southsea_cinema/models/movies.dart';
import 'package:flutter/services.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }

    return [
      Movie(
        id: 'M1',
        title: 'How to Train Your Dragon',
        runTime: '1h 42m',
        description:
            'A young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and decides to help him defeat his father\'s new enemy.',
        posterPath: 'assets/images/httyd.jpeg',
        showTime: 'Sunday, 15 October 2023, 18:00',
        ageRating: 'PG',
        price: 6.00,
      ),
      Movie(
        id: 'M2',
        title: 'Tangled',
        runTime: '1h 58m',
        description:
            'A young princess who is locked in a tower is rescued by a young thief and together they must find their way to the kingdom.',
        posterPath: 'assets/images/tangled.jpeg',
        showTime: 'Sunday, 15 October 2026, 19:00',
        ageRating: '12A',
        price: 7.50,
      ),
      Movie(
        id: 'M3',
        title: 'Avengers: Endgame',
        runTime: '2h 28m',
        description:
            'The film follows the Avengers as they attempt to reverse the effects of Thanos\' actions.',
        posterPath: 'assets/images/avengers.jpeg',
        showTime: 'Sunday, 15 October 2023, 19:00',
        ageRating: 'PG',
        price: 6.00,
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  List<Movie> getMoviesByAgeRating(String ageRating) {
    return getMovies().where((movie) => movie.ageRating == ageRating).toList();
  }

  List<Movie> getMoviesUnderPrice(double maxPrice) {
    return getMovies().where((movie) => movie.price < maxPrice).toList();
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
}
