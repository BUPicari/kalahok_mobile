import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/data/repositories/survey_repo.dart';
import 'package:kalahok_mobile/screens/survey_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalahok',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/kalahok-logo.png'),
        splashIconSize: double.infinity,
        backgroundColor: Colors.indigo,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: RepositoryProvider(
          create: (context) => SurveyRepository(),
          child: const SurveyScreen(),
        ),
        // nextScreen: const SurveyScreen(),
      ),
    );
  }
}
