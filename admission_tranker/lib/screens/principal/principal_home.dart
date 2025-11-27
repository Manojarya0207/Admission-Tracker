import 'package:flutter/material.dart';

class PrincipalHome extends StatelessWidget {
  const PrincipalHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "PRINCIPAL HOME",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
