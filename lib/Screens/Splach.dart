import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:task1/Screens/Home.dart';

class Splash extends StatelessWidget {
  static const String RouteNAME="Spla";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/dark_splash.png',
      nextRoute: Home.RouteNAME,
      splashTransition: SplashTransition.rotationTransition, nextScreen: Home(),
     
    );
  }
}
