//homepage
import 'package:flutter/material.dart';
import 'package:kebumen_tour_app/data/place_data.dart';
import 'package:kebumen_tour_app/view/widget/tour_swiper.dart';
import 'package:kebumen_tour_app/view/widget/tour_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "Welcome to Kebumen",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Product_Sans_Regular",
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // TourSwiper(imageAssets: tourismPlaces.map((place) => place.imageAsset).toList()),
            TourSwiper(places: tourismPlaces),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "Find your best tour",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Product_Sans_Regular",
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TourList(tourismPlaces: tourismPlaces),
          ],
        ),
      ),
    );
  }
}
