import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PrincipalHomeTab(),
    const PrincipalStudentsTab(),
    const PrincipalSettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Principal Dashboard"),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Students"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

// ------------------------------------------------------
// HOME TAB
// ------------------------------------------------------

class PrincipalHomeTab extends StatelessWidget {
  const PrincipalHomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Overview", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

          const SizedBox(height: 20),

          _buildCard("Total Admissions", "500"),
          const SizedBox(height: 15),
          _buildCard("Remaining Admissions", "120"),
          const SizedBox(height: 15),
          _buildCard("Total Teachers", "5"),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String value) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ------------------------------------------------------
// STUDENTS TAB
// ------------------------------------------------------

class PrincipalStudentsTab extends StatelessWidget {
  const PrincipalStudentsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Upload Student Excel File", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              // TODO: upload Excel file
            },
            icon: const Icon(Icons.upload_file),
            label: const Text("Choose Excel File"),
          ),

          const SizedBox(height: 30),

          const Text(
            "After uploading, 500 students will be split into 5 groups of 100 and auto-assigned to teachers.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------
// SETTINGS TAB
// ------------------------------------------------------

class PrincipalSettingsTab extends StatelessWidget {
  const PrincipalSettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // TODO: logout logic
        },
        child: const Text("Logout"),
      ),
    );
  }
}
