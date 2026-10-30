import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';

const Movie testMovie = Movie(
  id: 'M3',
  title: 'Avengers: Endgame',
  runTime: '2h 28m',
  description:
      'The film follows the Avengers as they attempt to reverse the effects of Thanos\' actions.',
  posterPath: 'assets/images/avengers.jpeg',
  showTime: '19:00',
  ageRating: 'PG',
  price: 6.00,
);

const Movie testMovie2 = Movie(
  id: 'M2',
  title: 'Tangled',
  runTime: '1h 40m',
  description:
      'The film follows the adventures of Rapunzel, a young princess with magical long hair, as she escapes from her tower and discovers the world.',
  posterPath: 'assets/images/tangled.jpeg',
  showTime: '21:00',
  ageRating: 'PG-13',
  price: 5.00,
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  group('CartRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final CartRepository cart = CartRepository.instance;
      expect(cart.getItems().length, 0);
      expect(cart.getTotalItems(), 0);
      expect(cart.totalItemCount, 0);
      expect(cart.getSubtotal(), 0.0);
      expect(cart.getServiceCharge(), 0.0);
      expect(cart.getTotalDue(), 0.0);
    });

    test('adds items and calculates subtotal and service charge correctly', () {
      final CartRepository cart = CartRepository.instance;
      
      const CartItem item1 = CartItem(
        movie: testMovie,
        quantity: 2,
      );
      const CartItem item2 = CartItem(
        movie: testMovie2,
        quantity: 1,
      );

      cart.addItem(item1);
      cart.addItem(item2);

      expect(cart.getItems().length, 2);
      expect(cart.getTotalItems(), 3);
      expect(cart.totalItemCount, 3);
      // Subtotal is (2 tickets × £6) + (1 ticket × £5) = £17.
      expect(cart.getSubtotal(), 17.0);
      expect(cart.getServiceCharge(), 4.00);
      expect(cart.getTotalDue(), 21.00);
    });
    
    test('removes items correctly', () {
      final CartRepository cart = CartRepository.instance;
      const CartItem item = CartItem(
        movie: testMovie,
        quantity: 1,
      );
      cart.addItem(item);
      expect(cart.getItems().length, 1);

      cart.removeItem(0);
      expect(cart.getItems().length, 0);
      expect(cart.getTotalDue(), 0.0);
    });
  });
}