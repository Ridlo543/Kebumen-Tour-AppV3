// place.dart
class TourismPlace {
  // String id;
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageList;
  bool isBookmarked;

  TourismPlace({
    // required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageList,
    this.isBookmarked = false,
  });
}
