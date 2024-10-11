// tour_card.dart
import 'package:flutter/material.dart';
import 'package:kebumen_tour_app/model/place.dart';

class TourCard extends StatelessWidget {
  final TourismPlace tourismPlace;
  final VoidCallback onTap;

  const TourCard({super.key, required this.tourismPlace, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(tourismPlace.imageAsset),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tourismPlace.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Product_Sans_Bold",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tourismPlace.location,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Product_Sans_Regular",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
