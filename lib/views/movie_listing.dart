import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

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
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(
                    'How to Train Your Dragon (2010) (PG) ', 
                    style: cinemaHeaderStyle,
                  ),
                  Text(
                    'Southsea Cinema Room ',
                  ),
                  Text(
                    'Thursday 1st June 2026, 7:30 PM - 9:30 PM \n',
                    style: cinemaBodyStyle
                  ),
                  Text(
                    'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets.',
                    style: cinemaBodyStyle
                  ),
                  Text(
                    'Select Quantities (Up to 5 in total) ',
                    style: cinemaBodyStyle
                  ),
                  Text(
                    'TICKETS',
                    style: cinemaHeaderStyle
                  ),
                ],
              ),
            ),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 20),

                DropdownMenu<int>(
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  textStyle: const TextStyle(color: Colors.black),
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
                const Text(
                  'Adult (£7.50) ',
                  style: cinemaBodyStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
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
                  'You ordered $totalTicket ticket${totalTicket == 1 ? '' : 's'}',
                  style: cinemaBodyStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
