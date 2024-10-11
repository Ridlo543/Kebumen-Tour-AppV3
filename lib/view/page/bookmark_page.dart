import 'package:flutter/material.dart';
import 'package:kebumen_tour_app/data/place_data.dart';
import 'package:kebumen_tour_app/model/place.dart';
import 'package:kebumen_tour_app/view/widget/tour_list.dart';

// bookmark_page.dart
class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TourismPlace> allTourismPlaces = tourismPlaces;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Bookmarked",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontFamily: "Product_Sans_Regular",
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: TourList(
        tourismPlaces: allTourismPlaces,
        showBookmarkedOnly: true,
      ),
    );
  }
}
