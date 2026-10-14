import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';


void main() {
  group('App smoke tests', () {
    testWidgets('App displays HomeView with title, movie cards, and buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.pumpAndSettle();

      expect(find.byType(HomeView), findsOneWidget);

      expect(find.text('Southsea Cinema'), findsOneWidget);

      expect(find.text('How to Train Your Dragon'), findsOneWidget);

      expect(find.byType(MovieCard), findsWidgets);

      expect(find.text('Book Now'), findsWidgets);
    });

    testWidgets('Tapping "Book Now" button navigates to MovieListing screen',
        (WidgetTester tester) async {
          
          await tester.pumpWidget(const SouthseaCinemaApp());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Book Now').first);
        await tester.pumpAndSettle();

        expect(find.byType(MovieListing), findsOneWidget);

        expect(find.text('How to Train Your Dragon (PG)'), findsOneWidget);
        expect(find.textContaining('Southsea Cinema Room'), findsOneWidget);
      });

  });
}
