import 'package:flutter/material.dart';
import 'principal_home.dart';
import 'principal_students.dart';
import 'principal_settings.dart';

class PrincipalDashboard extends StatefulWidget {
  @override
  _PrincipalDashboardState createState() => _PrincipalDashboardState();
}

class _PrincipalDashboardState extends State<PrincipalDashboard> {
  int index = 0;

  final screens = [
    PrincipalHome(),
    PrincipalStudents(),
    PrincipalSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Students"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
