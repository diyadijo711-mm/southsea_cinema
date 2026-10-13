import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: '3',
        title: 'Avengers: Endgame',
        runTime: '2h 28m',
        description: 'The film follows the Avengers as they attempt to reverse the effects of Thanos\' actions.',
        posterPath: 'assets/images/avengers.jpeg',
        showTime: '19:00',
        ageRating: 'PG',
        price: 6.00,
      );

      expect(movie.id, 'movie1');
      expect(movie.title, 'Avengers: Endgame');
      expect(movie.runTime, '2h 28m');
      expect(movie.description, 'The film follows the Avengers as they attempt to reverse the effects of Thanos\' actions.');
      expect(movie.posterPath, 'assets/images/avengers.jpeg');
      expect(movie.showTime, '19:00');
      expect(movie.ageRating, 'PG');
      expect(movie.price, 6.00);
    });

    test('formattedPrice returns correct string representation', () {
      const movie = Movie(
        id: '3',
        title: 'Avengers: Endgame',
        runTime: '2h 28m',
        description: 'The film follows the Avengers as they attempt to reverse the effects of Thanos\' actions.',
        posterPath: 'assets/images/avengers.jpeg',
        showTime: '19:00',
        ageRating: 'PG',
        price: 6.00,
      );

      expect(movie.formattedPrice, '£6.00');
    });

    test('isChildFriendly returns correct boolean value', () {
      const movie = Movie(
        id: '3',
        title: 'Avengers: Endgame',
        runTime: '2h 28m',
        description: 'The film follows the Avengers as they attempt to reverse the effects of Thanos\' actions.',
        posterPath: 'assets/images/avengers.jpeg',
        showTime: '19:00',
        ageRating: 'PG',
        price: 6.00,
      );

      expect(movie.isChildFriendly, true);
    });

    test('isAdultOnly returns correct boolean value', () {
      const movie = Movie(
        id: '3',
        title: 'Avengers: Endgame',
        runTime: '2h 28m',
        description: 'The film follows the Avengers as they attempt to reverse the effects of Thanos\' actions.',
        posterPath: 'assets/images/avengers.jpeg',
        showTime: '19:00',
        ageRating: '18',
        price: 6.00,
      );

      expect(movie.isAdultOnly, true);
    });
  });
}
 