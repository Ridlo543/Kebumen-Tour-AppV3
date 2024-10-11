// tour_swiper.dart
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:kebumen_tour_app/model/place.dart';
import 'package:kebumen_tour_app/view/page/detail_place_screen.dart';

class TourSwiper extends StatelessWidget {
  final List<TourismPlace> places;

  const TourSwiper({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 200,
      child: Swiper(
        index: 0,
        autoplay: true,
        autoplayDisableOnInteraction: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return buildSwiperItem(context, places[index]);
        },
        itemCount: places.length,
        itemWidth: MediaQuery.of(context).size.width,
        viewportFraction: 0.8,
        scale: 0.85,
      ),
    );
  }

  Widget buildSwiperItem(BuildContext context, TourismPlace place) {
    return GestureDetector(
      onTap: () {
        navigateToDetail(context, place);
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage(place.imageAsset),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    place.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
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
