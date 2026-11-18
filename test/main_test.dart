import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/database/cinema_db.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:southsea_cinema/models/booking.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/views/basket_view.dart';
import 'package:southsea_cinema/views/settings_view.dart';

void main() {
  setUp(() async {
    rootBundle.clear();
    sqfliteFfiInit();
    final Database database = await databaseFactoryFfiNoIsolate.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: CinemaDatabase.instance.createTables,
      ),
    );
    CinemaDatabase.instance.setDatabase(database);
    BasketRepository.instance.clear();
  });

  tearDown(() async {
    await CinemaDatabase.instance.close();
  });

  group('App smoke tests', () {
    testWidgets('App starts in dark mode and provides both theme variants',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      final MaterialApp app =
          tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.themeMode, ThemeMode.dark);
      expect(app.theme?.brightness, Brightness.light);
      expect(app.darkTheme?.brightness, Brightness.dark);
      expect(
        Theme.of(tester.element(find.byType(HomeView))).brightness,
        Brightness.dark,
      );
    });

    testWidgets('Settings switch updates the app theme mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      Navigator.of(tester.element(find.byType(HomeView)))
          .pushNamed('/settings');
      await tester.pumpAndSettle();

      expect(find.text('Light mode'), findsOneWidget);
      await tester.tap(find.byType(SwitchListTile));
      await tester.pumpAndSettle();

      final MaterialApp app =
          tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.themeMode, ThemeMode.light);
      expect(
        tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value,
        isTrue,
      );
      expect(
        Theme.of(tester.element(find.byType(SettingsScreen))).brightness,
        Brightness.light,
      );

      await tester.tap(find.byType(SwitchListTile));
      await tester.pumpAndSettle();
      expect(
        tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value,
        isFalse,
      );
      expect(
        tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
        ThemeMode.dark,
      );
    });

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
      expect(find.text('How to Train Your Dragon (12A)'), findsOneWidget);
      expect(find.textContaining('Southsea Cinema Room'), findsOneWidget);
    });

    testWidgets('Adding tickets stores them in the basket',
        (WidgetTester tester) async {
      final BasketRepository basket = BasketRepository.instance;
      basket.clear();

      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Book Now').first);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownMenu<int>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2').last);
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining('ADD TO ORDER'));
      await tester.pumpAndSettle();

      expect(basket.getItems(), hasLength(1));
      expect(basket.getItems().single.quantity, 2);
      expect(basket.getItems().single.movie.title, 'How to Train Your Dragon');

      basket.clear();
    });

    testWidgets('Checkout saves a booking and shows confirmation',
        (WidgetTester tester) async {
      const testMovie = Movie(
        id: 'M1',
        title: 'How to Train Your Dragon',
        ageRating: 'PG',
        description: 'Test',
        runTime: '1h 42m',
        showTime: '01/01/2026',
        posterPath: 'assets/images/httyd.jpeg',
        price: 6.00,
      );
      BasketRepository.instance
          .addItem(const BasketItem(movie: testMovie, quantity: 2));

      await tester.pumpWidget(const MaterialApp(home: BasketScreen()));
      await tester.pumpAndSettle();

      await tester.runAsync(() async {
        await tester.tap(find.text('BUY TICKETS'));
        await tester.pumpAndSettle();
      });
      await tester.pumpAndSettle();

      expect(find.textContaining('Booking 1001 saved'), findsOneWidget);

      final bookings =
          await tester.runAsync(() => CinemaDatabase.instance.getAllBookings());
      expect(bookings?.length, 1);
      expect(bookings?[0].bookingNumber, 1001);
      expect(bookings?[0].total, 16.00);
    });

    testWidgets('Basket screen displays past bookings',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await CinemaDatabase.instance.insertBooking(
          const Booking(
            bookingNumber: 1001,
            summary: '2 x How to Train Your Dragon',
            total: 12.00,
            date: '01/01/2026 10:00',
          ),
        );
      });

      await tester.pumpWidget(const MaterialApp(home: BasketScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Booking #1001'), findsOneWidget);
      expect(find.text('2 x How to Train Your Dragon'), findsOneWidget);
      expect(find.text('£12.00'), findsOneWidget);
    });
  });
}
