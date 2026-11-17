import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/booking.dart';

void main() {
  group('Booking model tests', () {
    test('creates a Booking with the given values', () {
      const Booking booking = Booking(
        id: 1,
        bookingNumber: 1001,
        summary: '2 x Tangled',
        total: 15.0,
        date: '01/01/2026 10:00',
      );
      expect(booking.id, 1);
      expect(booking.bookingNumber, 1001);
      expect(booking.summary, '2 x Tangled');
      expect(booking.total, 15.0);
      expect(booking.date, '01/01/2026 10:00');
    });

    test('toMap omits the id when it is null', () {
      const Booking booking = Booking(
        bookingNumber: 1001,
        summary: 'Test',
        total: 6.0,
        date: '01/01/2026 10:00',
      );
      final Map<String, Object?> map = booking.toMap();
      expect(map.containsKey('id'), isFalse);
      expect(map['booking_number'], 1001);
    });

    test('toMap includes the id when it is set', () {
      const Booking booking = Booking(
        id: 7,
        bookingNumber: 1002,
        summary: 'Test',
        total: 6.0,
        date: '01/01/2026 10:00',
      );
      expect(booking.toMap()['id'], 7);
    });

    test('fromMap rebuilds a Booking and converts a whole-number total', () {
      final Booking booking = Booking.fromMap(<String, Object?>{
        'id': 3,
        'booking_number': 1003,
        'summary': 'Test',
        'total': 12,
        'date': '01/01/2026 10:00',
      });
      expect(booking.id, 3);
      expect(booking.total, 12.0);
      expect(booking.total, isA<double>());
    });
  });
}