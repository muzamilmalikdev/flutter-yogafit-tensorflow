import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'welcomescreen.dart';
import 'homescreen.dart';
import 'package:yogafit/homescreen.dart';
void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcomescreen(),
    )
);

class LoginPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}