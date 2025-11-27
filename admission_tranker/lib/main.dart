import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(AdmissionApp());
}

class AdmissionApp extends StatelessWidget {
  const AdmissionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Admission Tracker",
      home: SplashScreen(),
    );
  }
}
