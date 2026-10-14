import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('App displays HomeView with title, movie cards, and buttons',
        (WidgetTester tester) async {
      
      await tester.pumpWidget(const SouthseaCinemaApp());

    
      expect(find.byType(HomeView), findsOneWidget);

      
      expect(find.text('Southsea Cinema'), findsOneWidget);

      
      expect(find.byType(MovieCard), findsWidgets);

      
      expect(find.text('Book Now'), findsWidgets);
    });
  });
}
