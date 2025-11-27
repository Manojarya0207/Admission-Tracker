import 'package:flutter/material.dart';

class PrincipalStudents extends StatelessWidget {
  const PrincipalStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Students Data")),
      body: const Center(
        child: Text("Principal: Manage All Students"),
      ),
    );
  }
}
