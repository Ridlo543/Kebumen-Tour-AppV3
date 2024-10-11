// detail_place_screen.dart
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kebumen_tour_app/model/place.dart';

class DetailPlaceScreen extends StatefulWidget {
  const DetailPlaceScreen({required this.place, super.key});
  final TourismPlace place;

  @override
  State<DetailPlaceScreen> createState() => _DetailPlaceScreenState();
}

class _DetailPlaceScreenState extends State<DetailPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text(place.name),
        // ),
        body: Stack(
          children: [
            Image.asset(
              widget.place.imageAsset,
              width: double.infinity,
              fit: BoxFit.cover,
              height: screenHeight * 0.5,
            ),

            //////////
            /// icon back dan wishlist
            SafeArea(
                child: Column(
              children: [
                _buildTopIcons(context),

                ////////
                // box
                SizedBox(height: screenHeight * 0.3),
                Expanded(
                  child: Container(
                    height: screenHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      border: Border.all(
                        color: const Color.fromARGB(255, 119, 245, 167),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 17),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                widget.place.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontFamily: "Product_Sans_Bold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            /////////////
                            ////////////
                            /// lokasi
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/location-pin.png',
                                      width: 48,
                                      height: 48,
                                    )),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.place.location,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Product_Sans_Regular",
                                      ),
                                      // textWidthBasis: TextWidthBasis.longestLine,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///////////////
                            //////////////
                            /// icon
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(5, 5),
                                      blurRadius: 5,
                                    ),
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 119, 245, 167),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/calendar.png',
                                                width: 48,
                                                height: 48,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                widget.place.openDays,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      "Product_Sans_Regular",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/deadline.png',
                                                width: 48,
                                                height: 48,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                widget.place.openTime,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      "Product_Sans_Regular",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/price-tag.png',
                                                width: 48,
                                                height: 48,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                widget.place.ticketPrice,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      "Product_Sans_Regular",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ////////////////
                            /// deskripsi
                            Text(
                              widget.place.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Product_Sans_Regular",
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              color: Colors.transparent,
                              height: 200,
                              child: Swiper(
                                index: 0,
                                autoplay: true,
                                autoplayDisableOnInteraction: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            widget.place.imageList[index]),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                                itemCount: widget.place.imageList.length,
                                itemWidth: MediaQuery.of(context).size.width,
                                viewportFraction: 0.8,
                                scale: 0.85,
                                pagination: const SwiperPagination(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ));
  }

  // Metode untuk membangun ikon back dan wishlist di detail screen
  Widget _buildTopIcons(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(255, 6, 158, 64),
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _toggleBookmarkStatus();
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          widget.place.isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: const Color.fromARGB(255, 6, 158, 64),
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _toggleBookmarkStatus() {
    setState(() {
      widget.place.isBookmarked = !widget.place.isBookmarked;
    });
  }
}
