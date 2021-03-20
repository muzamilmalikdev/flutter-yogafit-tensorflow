import 'package:flutter/material.dart';
import 'forgotpassword.dart';
import 'loginscreen.dart';
import 'package:yogafit/welcomescreen.dart';
import 'package:splashscreen/splashscreen.dart';

class welcomescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
         image: Image.asset('assets/yogagifmain.gif'),
         photoSize: 150.0,
         navigateAfterSeconds: loginscreen(),
         loadingText: Text("YOGA FIT - DAILY"),

    );
  }
}