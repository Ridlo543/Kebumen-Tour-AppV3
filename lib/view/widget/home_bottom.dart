//home_bottom
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeBottom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottom({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 6, 158, 64);

    return CurvedNavigationBar(
      backgroundColor: const Color.fromARGB(255, 155, 231, 184),
      height: MediaQuery.of(context).size.height / 13,
      index: currentIndex,
      items: const <Icon>[
        Icon(
          Icons.bookmark_rounded,
          size: 30,
          color: primaryColor,
        ),
        Icon(
          Icons.home_rounded,
          size: 30,
          color: primaryColor,
        ),
        Icon(
          Icons.person,
          size: 30,
          color: primaryColor,
        ),
      ],
      onTap: onTap,
    );
  }
}
