import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: cinemaBackground,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: cinemaBrand,
                  ),
                ),
                Text(
                  ' (${movie.ageRating})',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  movie.posterPath,
                  width: 150,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    movie.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BOOK TICKETS',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.showTime.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cinemaBrand,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Book Now',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}