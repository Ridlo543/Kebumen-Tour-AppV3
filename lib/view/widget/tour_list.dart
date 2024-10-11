// tour_list.dart
import 'package:flutter/material.dart';
import 'package:kebumen_tour_app/model/place.dart';
import 'package:kebumen_tour_app/view/page/detail_place_screen.dart';
import 'package:kebumen_tour_app/view/widget/tour_card.dart';

class TourList extends StatelessWidget {
  final List<TourismPlace> tourismPlaces;
  final bool showBookmarkedOnly;

  const TourList({
    super.key,
    required this.tourismPlaces,
    this.showBookmarkedOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final filteredPlaces = showBookmarkedOnly
        ? tourismPlaces.where((place) => place.isBookmarked).toList()
        : tourismPlaces;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: filteredPlaces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TourCard(
              tourismPlace: filteredPlaces[index],
              onTap: () => navigateToDetail(context, filteredPlaces[index]),
            ),
          );
        },
      ),
    );
  }

  void navigateToDetail(BuildContext context, TourismPlace place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPlaceScreen(place: place),
      ),
    );
  }
}
