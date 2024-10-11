//main_screen
import 'package:flutter/material.dart';
import 'package:kebumen_tour_app/view/page/bookmark_page.dart';
import 'package:kebumen_tour_app/view/widget/app_bar.dart';
import 'package:kebumen_tour_app/view/widget/home_bottom.dart';
import 'package:kebumen_tour_app/view/page/home_page.dart';
import 'package:kebumen_tour_app/view/page/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

// main_screen.dart
class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'KEBUMEN TOUR'),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          BookmarkPage(),
          HomePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: HomeBottom(
        currentIndex: _currentIndex,
        onTap: (index) {
          final int pageDifference = (index - _currentIndex).abs();

          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300 * pageDifference),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
