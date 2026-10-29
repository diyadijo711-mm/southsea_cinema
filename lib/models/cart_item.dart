import 'package:southsea_cinema/models/movies.dart';


class CartItem {
  final Movie movie;
  final int quantity;

  const CartItem({
    required this.movie, 
    required this.quantity
  });

  double get totalPrice{
    return movie.price * quantity;
  }
}