import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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


            // EXERCISE 1: Container for Title and Description
            Container(
              padding: const EdgeInsets.all(16.0),
              // You can add a color here later, e.g., color: cinemaSurface,
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
                    'Thursday 1st June 2026, 7:30 PM - 9:30 PM ',
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



            // EXERCISE 2: Row for Dropdown and Button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //--
                const Text('Dropdown placeholder'), 
                
                const SizedBox(width: 16), // Spacing

                //--
                ElevatedButton(
                  onPressed: () {}, // We will add logic here later
                  child: const Text('Add to order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
