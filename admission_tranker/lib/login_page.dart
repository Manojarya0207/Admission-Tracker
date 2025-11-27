import 'package:flutter/material.dart';
import 'principal/principal_dashboard.dart';
import 'teacher/teacher_dashboard.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Login as Principal"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => PrincipalDashboard()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Login as Teacher"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => TeacherDashboard()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
