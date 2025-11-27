import 'package:flutter/material.dart';
import '../../widgets/bottom_nav.dart';
import '../../chat/group_chat_page.dart';
import 'teacher_home.dart';
import 'teacher_students.dart';
import 'teacher_settings.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  int pageIndex = 0;

  final screens = const [
    TeacherHome(),
    TeacherStudents(),
    TeacherSettings(),
    GroupChatPage(userRole: "Teacher"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[pageIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: pageIndex,
        onTap: (index) => setState(() => pageIndex = index),
      ),
    );
  }
}
