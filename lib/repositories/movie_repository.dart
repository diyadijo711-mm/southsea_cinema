import 'package:southsea_cinema/models/movies.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        id: '1',
        title: 'How to Train Your Dragon',
        runTime: '1h 42m',
        description:
            'A young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and decides to help him defeat his father\'s new enemy.',
        posterPath: 'assets/images/httyd.jpeg',
        showTime: DateTime(2026, 10, 15, 11, 0),
      ),
      Movie(
        id: '2',
        title: 'Tangled',
        runTime: '1h 58m',
        description:
            'A young princess who is locked in a tower is rescued by a young thief and together they must find their way to the kingdom.',
        posterPath: 'assets/images/tangled.jpeg',
        showTime: DateTime(2023, 10, 15, 19, 0),
      ),
    ];
    
  }
}