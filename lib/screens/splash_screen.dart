import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swecom_app/screens/auth/firebase/auth_config.dart';
import 'package:swecom_app/screens/auth/get_started.dart';
import 'package:swecom_app/screens/dashboard/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkAuthStatus() async {
    User? user = AuthService().getCurrentUser();
    Timer(Duration(seconds: 3), () {
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeDashboardScreen()),  // Navigate to your dashboard screen
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => GetStartedScreen()),  // Navigate to your login screen
        );
      }
    });
  }

  @override

  void initState() {
    super.initState();
    User? user =  AuthService().getCurrentUser();
    Timer(Duration(seconds: 2), () {
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeDashboardScreen(),
          ), // Navigate to your dashboard screen
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => GetStartedScreen(),
          ), // Navigate to your login screen
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash_screen.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/logo.png",
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
