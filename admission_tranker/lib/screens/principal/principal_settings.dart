import 'package:flutter/material.dart';

class PrincipalSettings extends StatelessWidget {
  const PrincipalSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Principal Settings",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
