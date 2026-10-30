import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

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
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final BasketRepository basket = BasketRepository.instance;
      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.totalItemCount, 0);
      expect(basket.getSubtotal(), 0.0);
      expect(basket.getServiceCharge(), 0.0);
      expect(basket.getTotalDue(), 0.0);
    });

    test('adds items and calculates subtotal and service charge correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      
      const BasketItem item1 = BasketItem(
        movie: testMovie,
        quantity: 2,
      );
      const BasketItem item2 = BasketItem(
        movie: testMovie2,
        quantity: 1,
      );

      basket.addItem(item1);
      basket.addItem(item2);

      expect(basket.getItems().length, 2);
      expect(basket.getTotalItems(), 3);
      expect(basket.totalItemCount, 3);
      // Subtotal is (2 tickets × £6) + (1 ticket × £5) = £17.
      expect(basket.getSubtotal(), 17.0);
      expect(basket.getServiceCharge(), 4.00);
      expect(basket.getTotalDue(), 21.00);
    });
    
    test('removes items correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      const BasketItem item = BasketItem(
        movie: testMovie,
        quantity: 1,
      );
      basket.addItem(item);
      expect(basket.getItems().length, 1);

      basket.removeItem(0);
      expect(basket.getItems().length, 0);
      expect(basket.getTotalDue(), 0.0);
    });
  });
}