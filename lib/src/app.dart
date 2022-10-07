import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kalahok_mobile/src/screens/Home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalahok',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/kalahok-logo.png'),
        splashIconSize: double.infinity,
        backgroundColor: Colors.indigo,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const Home(title: "Kalahok"),
      ),
    );
  }
}
