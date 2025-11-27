import 'package:flutter/material.dart';
import '../../widgets/bottom_nav.dart';
import '../../chat/group_chat_page.dart';
import 'principal_home.dart';
import 'principal_students.dart';
import 'principal_settings.dart';

class PrincipalDashboard extends StatefulWidget {
  const PrincipalDashboard({super.key});

  @override
  State<PrincipalDashboard> createState() => _PrincipalDashboardState();
}

class _PrincipalDashboardState extends State<PrincipalDashboard> {
  int pageIndex = 0;

  final screens = const [
    PrincipalHome(),
    PrincipalStudents(),
    PrincipalSettings(),
    GroupChatPage(userRole: "Principal"),
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
