import 'package:flutter/material.dart';

class TeacherSettings extends StatelessWidget {
  const TeacherSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Teacher Settings",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
