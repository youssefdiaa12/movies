import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/HomeScreen.dart';

class splash extends StatelessWidget {

  static const String routeName = "splash";
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: AnimatedSplashScreen(
          splashIconSize: 250,
          duration: 1500,
          animationDuration: const Duration(seconds: 2),
          splashTransition: SplashTransition.rotationTransition,
          curve: Curves.fastOutSlowIn,
          backgroundColor: Colors.black,
          splash: Center(
            child: Container(
              width: double.infinity,
              child: Lottie.network("https://lottie.host/19e350a3-71fb-41e6-af52-a69cac311867/rvj70SfJEh.json"),
            ),

          )


          , nextScreen: HomeScreen()),
    );
  }
}
