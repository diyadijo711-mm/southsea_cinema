
class Booking {
  final int? id;
  final int bookingNumber;
  final String summary;
  final double total;
  final String date;

  const Booking({
    this.id,
    required this.bookingNumber,
    required this.summary,
    required this.total,
    required this.date,
  });
}
