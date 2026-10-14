import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns three movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 3);
    });

    test('getMovies contains valid movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie movie = movies[0];
      expect(movie.id, isNotEmpty);
      expect(movie.title, isNotEmpty);
      expect(movie.runTime, isNotEmpty);
      expect(movie.description, isNotEmpty);
      expect(movie.ageRating, isNotEmpty);
      expect(movie.price, greaterThan(0));
      expect(movie.posterPath, isNotEmpty);

      final Movie movie2 = movies[1];
      expect(movie2.id, isNotEmpty);
      expect(movie2.title, isNotEmpty);
      expect(movie2.runTime, isNotEmpty);
      expect(movie2.description, isNotEmpty);
      expect(movie2.ageRating, isNotEmpty);
      expect(movie2.price, greaterThan(0));
      expect(movie2.posterPath, isNotEmpty);
    });

    test('getMovieById returns correct movie', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('M3');

      expect(movie, isNotNull);
      expect(movie!.id, 'M3');
      expect(movie.title, 'Avengers: Endgame');
    });

    test('getMoviesByAgeRating returns correct movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMoviesByAgeRating('PG');

      expect(movies.length, 2);
      expect(movies[0].ageRating, 'PG');
      expect(movies[1].ageRating, 'PG');
    });

    test('getMoviesUnderPrice returns correct movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMoviesUnderPrice(7.00);

      expect(movies.length, 2);
      expect(movies[0].price, lessThan(7.00));
      expect(movies[1].price, lessThan(7.00));
    });
  });
}
