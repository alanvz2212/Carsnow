import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:carsnow/screens/base_screen.dart';
import 'package:carsnow/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkLoginStatus(),
      builder: (BuildContext context, snapshot) {
        return AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash: Image.asset('assets/Images/cars.png'),
          nextScreen: snapshot.data == true ? BaseScreen() : LoginScreen(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 3000,
          splashIconSize: 100,
          centered: true,
        );
      },
    );
  }
}
