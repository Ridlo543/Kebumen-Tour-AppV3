//main
import 'package:flutter/material.dart';
import 'package:kebumen_tour_app/view/page/splash_screen.dart';

void main() => runApp(const MyApp());

class AppTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: const Color.fromARGB(255, 36, 186, 94),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      title: 'Wisata Kebumen App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
      },
    );
  }
}
