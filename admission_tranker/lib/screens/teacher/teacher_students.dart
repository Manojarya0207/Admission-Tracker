import 'package:flutter/material.dart';

class TeacherStudents extends StatelessWidget {
  const TeacherStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Students Data")),
      body: const Center(
        child: Text("Teacher: View Assigned Students"),
      ),
    );
  }
}
