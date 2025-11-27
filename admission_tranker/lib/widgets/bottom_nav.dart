import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool showChat;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.showChat = true,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        const BottomNavigationBarItem(icon: Icon(Icons.people), label: "Students"),
        const BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        if (showChat)
          const BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
      ],
    );
  }
}
