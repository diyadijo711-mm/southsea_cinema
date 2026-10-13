import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;
  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}


class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  int totalTicket = 0;

  int _ticketOrdered (int quantity) {
    return quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //---
            Center(
              child: Container(
                color: cinemaSurface,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      "${widget.movie.title} (${widget.movie.ageRating})",
                      style: cinemaHeaderStyle.copyWith(fontSize: 22),
                    ),
                    Image.asset(
                      widget.movie.posterPath,
                      width: 150,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    const Text(
                      'Southsea Cinema Room ',
                    ),
                    Text(
                      '${widget.movie.showTime} \n',
                      style: cinemaBodyStyle,
                    ),
                    Text(
                      '${widget.movie.description} \n',
                      style: cinemaBodyStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Tickets (${widget.movie.formattedPrice} each)',
                          style: cinemaBodyStyle,
                        ),
                        const SizedBox(width: 12),
                        DropdownMenu<int>(
                          textStyle: const TextStyle(color: Colors.white),
                          initialSelection: _ticketQuantity,
                          onSelected: (int? value) {
                            if (value != null) {
                              setState(() {
                                _ticketQuantity = value;
                              });
                            }
                          },
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 0, label: '0'),
                            DropdownMenuEntry(value: 1, label: '1'),
                            DropdownMenuEntry(value: 2, label: '2'),
                            DropdownMenuEntry(value: 3, label: '3'),
                            DropdownMenuEntry(value: 4, label: '4'),
                            DropdownMenuEntry(value: 5, label: '5'),
                          ],
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            totalTicket = _ticketOrdered(_ticketQuantity);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cinemaBrand,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text(
                          'ADD TO ORDER \n You ordered $totalTicket ticket${totalTicket == 1 ? '' : 's'}',
                          textAlign: TextAlign.center,
                          style: cinemaBodyStyle,
                        ),
                      ),
                    ),
                          ],
                        ),
                      ),
                    ),
            
            ],
          ),
        ),
      );
    }
  }
