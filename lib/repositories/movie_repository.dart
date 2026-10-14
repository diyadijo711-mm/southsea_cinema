import 'package:southsea_cinema/models/movies.dart';

class MovieRepository {
  List<Movie> getMovies() {
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
}
