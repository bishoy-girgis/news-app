import 'package:flutter/material.dart';
import 'package:news_app/pages/home/home_page.dart';
import 'package:news_app/pages/splash_screen/splash_screen.dart';
import 'package:news_app/shared_components/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.LightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName ,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SplashScreen.routeName: (context) => SplashScreen(),
      },
    );
  }
}
