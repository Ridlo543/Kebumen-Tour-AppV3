// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:kebumen_tour_app/view/page/main_screen.dart';
import 'package:lottie/lottie.dart';

const List<Color> backgroundColors = [
  Color.fromARGB(255, 155, 231, 184),
  Color.fromARGB(255, 255, 255, 255),
];
const Color textColor = Color.fromARGB(255, 2, 109, 43);
const String welcomeText = "Welcome to\nKebumen Tour App!";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  void _configureController() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  void _disposeController() {
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _configureController();
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: backgroundColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Lottie.asset(
                  'assets/animations/travel.json',
                  controller: _controller,
                  height: MediaQuery.of(context).size.height * 1,
                  animate: true,
                  onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..forward().whenComplete(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                        );
                      });
                  },
                );
              },
            ),
            const Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  welcomeText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontFamily: "Product_Sans_Bold",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
