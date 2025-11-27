import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,   // White looks better with your logo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // 🔵 College Logo
            Image.asset(
              "assets/images/gttc_logo.jpg",
              height: 150,
            ),

            SizedBox(height: 20),

            // 🔵 App Title
            Text(
              "Admission Tracker",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            SizedBox(height: 10),

            // 🔵 College Name
            Text(
              "GTTC MAGADI",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
