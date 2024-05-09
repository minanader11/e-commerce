import 'dart:async';

import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/presentation/auth/login/view/login_Screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName='splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3), // Change the duration as needed
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  Image.asset(MyTexts.splashScreen,fit: BoxFit.cover,width: double.infinity,height: double.infinity,)
    );
  }
}
